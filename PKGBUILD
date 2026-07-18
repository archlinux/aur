# Maintainer: Konstantin Martianov <k.s.martianov@yandex.com>
pkgname=shader-desk-git
_pkgname=shader-desk
pkgver=r70.8b33e0e # Automatically updated by pkgver()
pkgrel=1
pkgdesc="Interactive Wayland wallpaper engine using OpenGL GLESv2 shaders"
arch=('x86_64' 'aarch64')
url="https://github.com/KMartianov/shader-desk"
license=('MIT') 

# Runtime dependencies
depends=(
  'wayland'         # Basic Wayland support
  'libglvnd'        # Vendor-neutral dispatch layer for EGL and GLESv2
  'luajit'          # High-performance scripting engine
  'nlohmann-json'   # JSON configuration parsing
  'glm'             # Mathematics for OpenGL
  'libpulse'        # PulseAudio/PipeWire support for audio-daemon
  'fftw'            # Fast Fourier Transform for audio-daemon
  'libevdev'        # Input device reading for evdev-daemon
  'mpv'             # Video playback backend for video-bg plugin
  'python'          # Required for the plugin generation script
)

# Build dependencies
makedepends=(
  'git'
  'cmake'
  'ninja'           # Faster build system (highly recommended for modern AUR packages)
  'wayland-protocols' # XML protocol files required during compilation
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Source code repositories
# The 'sol2' library is fetched here to comply with Arch packaging guidelines 
# requiring offline builds. CMake's FetchContent will be overridden to use this local copy.
source=(
  "${_pkgname}::git+${url}.git"
  "sol2::git+https://github.com/ThePhD/sol2.git#branch=main"
)
sha256sums=('SKIP' 'SKIP') # Skip checksums for VCS packages

pkgver() {
  cd "${srcdir}/${_pkgname}"
  
  # Generate version based on git tags. 
  # Fallback to revision count if no tags are found.
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # Configure project in an isolated build directory.
  # -DFETCHCONTENT_SOURCE_DIR_SOL2 forces CMake to use the locally cloned sol2
  # preventing unauthorized network access during the build phase (Clean Chroot).
  cmake -B build -S "${_pkgname}" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_SOURCE_DIR_SOL2="${srcdir}/sol2" \
    -DBUILD_AUDIO_DAEMON=ON \
    -DBUILD_EVDEV_DAEMON=ON \
    -DENABLE_PROFILING=OFF

  # Compile the project
  cmake --build build
}

package() {
  # Install binaries, systemd services, and plugins to pkgdir
  DESTDIR="${pkgdir}" cmake --install build

  # Install license (Strict requirement for the Arch Packaging Guidelines)
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
