# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainer: Xenhat Hex (me@xenh.at)
# shellcheck disable=2034,3030,2154
pkgname=alchemy-viewer
pkgdesc="A Second Life client with focus on performance and code correctness."
_build_id=2251
pkgver=7.1.1.${_build_id}
pkgrel=2
#epoch=1
# _release_version=2177
_variant="beta"
# _commit_hash=f13e479f 
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
options=(!strip !lto)
install=alchemy.install
depends=(glu libgl libiconv libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
makedepends=('gcc' 'git' 'python-pip' 'python-virtualenv' 'sed' 'xz')
optdepends=(
  'alsa-lib: ALSA support'
  'dbus-glib: D-Bus support for systemd'
  'elogind: D-Bus support for non-systemd'
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
provides=('alchemy-viewer')
replaces=('alchemy-viewer-git')
_archive_file_name="alchemy-next-${pkgver}${_variant}.tar.bz2"
# source=("${pkgname}.tar.gz"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/archive/'"${_commit_hash}"'/alchemy-next-'"${_commit_hash}"'.tar.gz')
source=("${_archive_file_name}"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/archive/'"${pkgver}-${_variant}"'/alchemy-next-'"${pkgver}-${_variant}"'.tar.bz2')
sha256sums=('2f828f2eb76f64d0134e0e120b3f3930ea88c3e2041f52e85ca3d8e67c3b496f')
noextract=("${_archive_file_name}")

pkgver() {
  # Dirty workaround for the archive format produced by the upstream CI tooling
  bsdtar -xf "${_archive_file_name}" --strip-components=1
  printf "${pkgver}"
}

prepare() {
  echo "$PWD"
  echo "Creating virtual environment in $PWD"
  virtualenv ".venv" -p python3
  source ".venv/bin/activate" || exit 1

  echo "Installing build toolchain..."
  pip3 install --upgrade certifi --quiet
  pip3 install --upgrade llbase --quiet
  pip3 install --no-cache --upgrade autobuild --quiet
  pip3 install --upgrade cmake ninja
}

build() {
  # cd "${pkgname}" || exit 1
  source ".venv/bin/activate"
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
    -DREVISION_FROM_VCS:BOOL=OFF
  )
  export AUTOBUILD_BUILD_ID="${_build_id}"
  CI_COMMIT_SHA=$(git rev-parse HEAD)
  export CI_COMMIT_SHA
  echo "BUILDENV: ${BUILDENV[*]}"
  if [[ " ${BUILDENV[*]} " =~ ' ccache ' ]] && command -v ccache; then
    echo "------ Will Use CCACHE ------"
    CMAKE_CXX_COMPILER_LAUNCHER="$(which ccache)"
    export CMAKE_CXX_COMPILER_LAUNCHER
  fi
  _logfile="${srcdir}/build.${CARCH}.$(date +%s).log"
  $prefix_cmd autobuild configure -A 64 -c ReleaseOS -- "${AL_CMAKE_CONFIG[@]}" > >(tee -a "$_logfile") 2> >(tee -a "$_logfile" >&2)
  msg2 "Building with ${AUTOBUILD_CPU_COUNT} jobs" 
  $prefix_cmd autobuild build -A 64 -c ReleaseOS --no-configure > >(tee -a "$_logfile") 2> >(tee -a "$_logfile" >&2)
}

package() {
  mkdir -p "${pkgdir}"/opt
  mkdir -p "${pkgdir}/usr/local/share/applications"
  _build_folder="${srcdir}/build-linux-64/newview/packaged"
# Patch shortcut maker
  sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${_build_folder}/etc/refresh_desktop_app_entry.sh"
  mv "${_build_folder}" "${pkgdir}/opt/${pkgname}"
}
