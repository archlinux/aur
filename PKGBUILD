# Maintainer: Xenhat Hex (aur@xenh.at)
# Contributor: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
#
# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-git
pkgver=7.0.0.54028.ef16fabfec
pkgrel=1
epoch=1696809895
pkgdesc="A Second Life client with focus on performance and code correctness."
arch=('x86_64')
license=('LGPL')
options=('!buildflags' '!lto' '!strip')
url="https://www.alchemyviewer.org"
depends=(glu libgl libiconv libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc xdg-desktop-portal zlib)
makedepends=('gcc' 'python-virtualenv' 'python-pip' 'git' 'xz')
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
  'wine: More up-to-date, less buggy SLVoice support')
replaces=('alchemy-viewer-git')
provides=('alchemy-viewer')
install=alchemy.install
source=("${pkgname}"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git#branch='"${AL_BRANCH_OVERRIDE:-main}")
sha256sums=('SKIP')

_distname="Alchemy-Config-Simple"

# template start; name=systemd-git; version=1.0;
depends+=(dbus-glib systemd-libs)
conflicts+=("alchemy-next-viewer-nosystemd-git")

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
    pip3 install --upgrade certifi --quiet
    pip3 install --upgrade llbase --quiet
    pip3 install --no-cache --upgrade autobuild --quiet
    pip3 install --upgrade cmake ninja
}
# template end;

# template start; name=build; version=1.0;
build() {
  cd "${pkgname}" || exit 1
  source "${srcdir}/.venv/bin/activate"
  build_jobs=$(nproc)
  if [[ -z "$NO_SMART_JOB_COUNT" ]]; then
    if [[ ${build_jobs} -gt 1 ]]; then
      jobs=1
      # The viewer requires an average of 2GB of memory per core to link
      # Note: Behaviour change compared to the previous versions:
      # This script will no longer try to allocate build memory into swap
      # This is bad practice, and swap should be reserved to evict process
      # memory from physical ram to make place for the current workset.
      # This script will now try to check if swap is present and sufficent
      # for the current used memory to be stored in swap before allocating,
      # and will fallback to conservative allocation if swap is not available
      gigperlinkprocess=2
      mempercorekb=$((gigperlinkprocess * 1048576))
      requiredmemorykb=$(($(nproc) * mempercorekb))
      free_output="$(free --kilo --total | tail -n+2 | tr -s ' ')"
      physical_output=$(grep "Mem:" <<<"$free_output")
      #total_output=$(grep Total: <<< "$free_output")
      usedmemorykbphysical=$(cut -d ' ' -f 3 <<<"$physical_output")
      totalmemorykbphysical=$(cut -d ' ' -f 2 <<<"$physical_output")
      swap_output=$(grep Swap: <<<"$free_output")
      # Determine available swap space
      availableswapkb=0
      if [[ -n "$swap_output" ]]; then
        availableswapkb=$(cut -d ' ' -f 4 <<<"$swap_output")
      fi
      availablememorykbphysical=$(cut -d ' ' -f 7 <<<"$free_output")
      echo "Total memory:         $totalmemorykbphysical (includes swap)"
      echo "Available memory:     $availablememorykbphysical"
      echo "Required memory:      $requiredmemorykb"
      echo "Available physical memory on this system: $((availablememorykbphysical / 1024 / 1024)) GB"
      echo "Estimated required memory to build with all cores: $((requiredmemorykb / 1024 / 1024)) GB"
      if [[ ${requiredmemorykb} -gt ${availablememorykbphysical} ]]; then
        echo "Warning: Not enough available physical memory to build with all cores"
        if [[ ${usedmemorykbphysical} -lt ${availableswapkb} ]]; then
          # use all physical ram as swap will do its job
          echo "There is enough free swap to store the currently used memory"
          jobs=$(((totalmemorykbphysical / 1024 / 1024) / gigperlinkprocess))
        else
          # Not enough swap to hold ram contents, calculate manually
          echo "Allocating build jobs according to available physical memory ("$((availablememorykbphysical / 1024 / 1024))"/"$((requiredmemorykb / 1024 / 1024))"GB)..."
          # FIXME: Goes one iteration beyond what it should
          while [[ $((jobs * mempercorekb)) -lt ${availablememorykbphysical} ]]; do
            jobs=$((jobs + 1))
            echo -e "${jobs} jobs would consume $(((jobs * mempercorekb) / 1024 / 1024))GB"
          done
          # Back off one job count. Not sure why I have to do this but
          # the loop is doing one extra iteration.
          jobs=$((jobs - 1))
        fi
        build_jobs=${jobs}
        echo "Computed job count: ${build_jobs}"
      fi
      fi
      fi
      export AUTOBUILD_CPU_COUNT=$build_jobs
      AL_CMAKE_CONFIG=(
        -DLL_TESTS:BOOL=ON
        -DDISABLE_FATAL_WARNINGS=ON
        -DUSE_LTO:BOOL=OFF
        -DVIEWER_CHANNEL="Alchemy Test"
      )
      echo "BUILDENV: ${BUILDENV[*]}"
      if [[ " ${BUILDENV[*]} " =~ ' ccache ' ]] && command -v ccache; then
        echo "------ Will Use CCACHE ------"
        CMAKE_CXX_COMPILER_LAUNCHER="$(which ccache)"
        export CMAKE_CXX_COMPILER_LAUNCHER
      fi
      $prefix_cmd autobuild configure -A 64 -c ReleaseOS -- "${AL_CMAKE_CONFIG[@]}"
      echo "Building with ${AUTOBUILD_CPU_COUNT} jobs (adjusted)"
      $prefix_cmd autobuild build -A64 -c ReleaseOS --no-configure
    }
# template end;

# template start; name=package; version=1.0;
package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/local/share/applications"
  # Patch shortcut to avoid duplicated entries
  sed -i 's;Name=Alchemy;Name=Alchemy (git build);' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
  sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${pkgname}/build-linux-64/newview/packaged/etc/refresh_desktop_app_entry.sh"
  mv "${pkgname}/build-linux-64/newview/packaged" "${pkgdir}/opt/${pkgname}"
}
# template end;
# template end;

