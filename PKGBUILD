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
  'mesa'            # OpenGL ESv2 and EGL drivers
  'luajit'          # Scripting engine
  'nlohmann-json'   # JSON configuration parsing
  'glm'             # Mathematics for OpenGL
# 'sol2'            # C++/Lua integration library
  'libpulse'        # PulseAudio/PipeWire for audio-daemon
  'fftw'            # FFT sound processing for audio-daemon
  'libevdev'        # Input device reading for evdev-daemon
  'mpv'             # Video playback in video-bg plugin
  'python'          # Plugin generation script execution
)

# Build dependencies
makedepends=(
  'git'
  'cmake'
  'wayland-protocols' # XML protocol files
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Source code repository
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP') # Skip checksums for VCS packages

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
  # Configure project in isolated build directory
  # Disable Tracy profiling for release build
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_AUDIO_DAEMON=ON \
    -DBUILD_EVDEV_DAEMON=ON \
    -DENABLE_PROFILING=OFF

  # Compile the project
  cmake --build build
}

package() {
  # Install binaries, systemd services, and plugins to pkgdir
  DESTDIR="${pkgdir}" cmake --install build

  # Install license (Arch Packaging Guidelines requirement)
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
