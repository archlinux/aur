# template start; name=nosystemd-git; version=1.0;
# template start; name=base; version=1.0;
# Maintainer: Xenhat Hex (aur@xenh.at)
# Contributor: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
#
# shellcheck disable=2034,3030,2154
pkgdesc="A Second Life client with focus on performance and code correctness - Git build."
arch=('x86_64')
license=('LGPL')
options=('!buildflags' '!lto' '!strip')
url="https://www.alchemyviewer.org"
install=alchemy.install
# template end;
# template start; name=deps; version=1.0;
depends=('glu' 'libgl' 'libiconv' 'libidn' 'libjpeg-turbo' 'libpng' 'libxml2' 'libxss' 'mesa' 'nss' 'openal' 'sdl2' 'vlc' 'zlib')
makedepends=('gcc' 'python-pip' 'git')
optdepends=(
  'alsa-lib: ALSA support'
  'freealut: OpenAL support'
  'gamemode: Gamemode support'
  'lib32-libidn11: SLVoice support'
  'lib32-libsndfile: SLVoice support'
  'lib32-util-linux: SLVoice support'
  'lib32-gstreamer0.10: SLVoice support'
  'libpulse: PulseAudio support'
  'mesa-libgl: Intel, Radeon, Nouveau support'
  'nvidia-libgl: NVIDIA support'
  'nvidia-utils: NVIDIA support'
  'wine: More up-to-date, less buggy SLVoice support'
  'xdg-desktop-portal: File picker portal')
# template end;
pkgname=alchemy-next-viewer-nosystemd-git
pkgver=7.0.1.54541.1d7f9b75bd
pkgrel=1
provides=('alchemy-viewer')
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch='"${AL_BRANCH_OVERRIDE:-main}")
sha256sums=('SKIP')
# Not included as a dependency as it is impossible to update the package otherwise
#depends+=('libelogind')
conflicts+=("alchemy-next-viewer-systemd-git")

# template start; name=pkgver; version=1.0;
pkgver() {
  cd "${pkgname}" || exit 1
  (
  set -o pipefail
  vwr_version=$(cat indra/newview/VIEWER_VERSION.txt)
  rev=$(git rev-list --count HEAD)
  short=$(git rev-parse --short HEAD)
  printf "%s.%s.%s" "${vwr_version}" "${rev}" "${short}"
)
}
# template end;

# template start; name=prepare; version=1.0;
prepare() {
  cd ${srcdir} || exit
    echo "Creating virtual environment in $PWD"
    virtualenv ".venv" -p python3
    source "${srcdir}/.venv/bin/activate"

    echo "Installing build toolchain..."
    pip3 install --upgrade cmake llbase llsd certifi autobuild ninja
}
# template end;

# template start; name=build; version=1.0;
build() {
  cd "${pkgname}" || exit 1
  source "${srcdir}/.venv/bin/activate"
echo ""
echo "Configuring the build"

_logfile="build.${CARCH}.$(date +%s).log"
build_jobs=$(nproc)

AL_CMAKE_CONFIG=(
  -DLL_TESTS:BOOL=ON
  -DDISABLE_FATAL_WARNINGS=ON
  -DUSE_LTO:BOOL=OFF
  -DVIEWER_CHANNEL="Alchemy Test"
)

if [[ " ${BUILDENV[*]} " =~ ' ccache ' ]] && command -v ccache >/dev/null 2>&1; then
  AL_CMAKE_CONFIG+=("-DCMAKE_CXX_COMPILER_LAUNCHER=$(which ccache)")
  echo "ccache was found and will be used"
fi
if [[ -z "$NO_CLANG" ]] && command -v clang++ >/dev/null 2>&1; then
  AL_CMAKE_CONFIG+=("-DCMAKE_C_COMPILER=$(which clang)")
  AL_CMAKE_CONFIG+=("-DCMAKE_CXX_COMPILER=$(which clang++)")
  echo "clang was found and will be used instead of gcc"
fi

if [[ -z "$NO_SMART_JOB_COUNT" ]]; then
  if [[ ${build_jobs} -gt 1 ]]; then
    # The viewer requires an average of 2GB of memory per core to link
    # Note: Behaviour change compared to the previous versions:
    # This script will no longer try to allocate build memory into swap
    # This is bad practice, and swap should be reserved to evict process
    # memory from physical ram to make place for the current workset.
    # This script will now try to check if swap is present and sufficent
    # for the current used memory to be stored in swap before allocating,
    # and will fallback to conservative allocation if swap is not available
    mempercorekb=$((1048576))
    requiredmemorykb=$(($(nproc) * mempercorekb))
    free_output="$(free --kilo --total | tail -n+2 | tr -s ' ')"
    physical_output=$(grep "Mem:" <<<"$free_output")
    totalmemorykbphysical=$(cut -d ' ' -f 2 <<<"$physical_output")
    usedmemorykbphysical=$(cut -d ' ' -f 3 <<<"$physical_output")
    # Don't factor in the caches, these will be flushed as needed
    #freememorykbphysical=$(cut -d ' ' -f 4 <<<"$physical_output")
    availablememorykbphysical=$(cut -d ' ' -f 7 <<<"$free_output")
    total_output=$(grep "Total:" <<<"$free_output")
    totalmemorykbcombined=$(cut -d ' ' -f 2 <<<"$total_output")
    usedmemorytotal=$(cut -d ' ' -f 2 <<<"$total_output")
    freememorytotal=$(cut -d ' ' -f 4 <<<"$total_output")
    swap_output=$(grep Swap: <<<"$free_output")
    # Determine available swap space
    availableswapkb=0
    if [[ -n "$swap_output" ]]; then
      availableswapkb=$(cut -d ' ' -f 4 <<<"$swap_output")
    fi
    echo "Required memory at $(nproc) jobs:         $((requiredmemorykb/1024/1024))GB"
    echo "Available memory (counting swap):   $((totalmemorykbcombined/1024/1024))GB"
    echo "Total RAM:                          $((totalmemorykbphysical/1024/1024))GB"
    if [[ ${requiredmemorykb} -gt ${totalmemorykbphysical} ]]; then
      echo "Not enough physical memory to use all cores"
      if [[ ${usedmemorykbphysical} -lt ${availableswapkb} ]]; then
        # There is enough swap to fit all the used memory. Use all physical ram as swap will do its job
        echo "Using swap memory to store current processes memory"
        # We do not want to compile in swap, so adjust accordingly
        jobs=$(((totalmemorykbphysical) / mempercorekb))
      else
        # TODO: Verify this logic on low-ram systems
        # Not enough swap to hold ram contents, calculate manually
        jobs=1
        echo "${jobs} job  would consume $(((jobs * mempercorekb) / 1024 / 1024))GB"
        while [[ $((jobs * mempercorekb)) -le ${availablememorykbphysical} ]]; do
          ((jobs++))
          echo "${jobs} jobs would consume $(((jobs * mempercorekb) / 1024 / 1024))GB"
        done
        # Back off one job count. Not sure why I have to do this but
      fi
      build_jobs=${jobs}
    fi
  fi
  echo "Adjusted job count: ${build_jobs}"
fi
export AUTOBUILD_CPU_COUNT=$build_jobs

# And now we configure and build the viewer with our adjusted configuration
autobuild configure -A 64 -c ReleaseOS -- "${AL_CMAKE_CONFIG[@]}" > >(tee -a "$_logfile") 2> >(tee -a "$_logfile" >&2)
echo "Building with ${AUTOBUILD_CPU_COUNT} jobs"
autobuild build -A 64 -c ReleaseOS --no-configure > >(tee -a "$_logfile") 2> >(tee -a "$_logfile" >&2)
    }
# template end;

# template start; name=package; version=1.0;
package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/local/share/applications"
  # Patch shortcut maker
  sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
  sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
  mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
# template end;
# template end;

