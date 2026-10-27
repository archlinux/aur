# Maintainer: aubree.wtf <https://aubree.wtf/>
pkgname=quadrahq-git
_name=Quadra
pkgver=0.37.4.r1.g1e561fd
pkgrel=2
pkgdesc="Run the macOS Roblox client on Linux through Darling"
arch=('x86_64')
url="https://quadrahq.org"
_repo="https://github.com/QuadraHQ/Quadra"
license=('GPL-3.0-only' 'MIT' 'ISC' 'OFL-1.1')
depends=('unzip' 'python' 'python-gobject' 'python-cairo'
         'gtk4>=4.14' 'libadwaita>=1.5' 'webkitgtk-6.0' 'sdl2' 'wayland'
         'libpulse' 'libglvnd' 'vulkan-icd-loader' 'llvm-libs>=15' 'libx11' 'libxext' 'libxfixes' 'libxi' 'libxcursor' 'gcc-libs')
depends+=('hicolor-icon-theme' 'shared-mime-info' 'desktop-file-utils')
makedepends=('git' 'clang' 'lld' 'pkgconf' 'vulkan-headers' 'rust>=1.98')
optdepends=('darling: regular Darling runtime'
            'ciderdarling-bin: QuadraHQ Darling runtime (also available from the launcher)'
            'mangohud: performance overlay'
            'mesa: Mesa EGL and Zink for the Vulkan renderer'
            'vulkan-driver: hardware Vulkan driver for the Vulkan renderer'
            'pipewire-audio: native PipeWire audio playback')
provides=('quadrahq' 'ciderhq' 'macoblox')
conflicts=('quadrahq' 'ciderhq' 'ciderhq-git' 'macoblox' 'macoblox-git')
replaces=('ciderhq-git' 'macoblox-git')
source=("$_name::git+$_repo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  # Normalize p1 and .p1 tags so patch builds sort after earlier git snapshots.
  git describe --tags --long --match 'v[0-9]*' --abbrev=7 |
    sed 's/^v//;s/^\([0-9][0-9.]*[0-9]\)\.\{0,1\}p\([0-9][0-9]*\)/\1.\2/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  # Prevenir cierre prematuro de RobloxCrashHandler antes del handshake de Crashpad
  sed -i 's/time\.sleep(2)/time.sleep(15)/' launcher/quadra/core.py
  sed -i 's/time\.monotonic() - self\.started_at > 3/time.monotonic() - self.started_at > 20/' launcher/quadra/core.py

  # Activar watchdog thread kicks por defecto para evitar congelamientos en CiderDarling (QUADRA_KICK=1)
  sed -i 's/"cider_thread_kicks": False/"cider_thread_kicks": True/' launcher/quadra/core.py
}

build() {
  cd "$_name"
  QUADRA_BUILD_DIR="$srcdir/native-build" ./build_debug_shim.sh
  QUADRA_BUILD_DIR="$srcdir/native-build" bash packaging/build-metal.sh
}

package() {
  cd "$_name"
  bash packaging/install-payload.sh "$PWD" "$srcdir/native-build" "$pkgdir" /usr/lib
  python -m compileall -q -d /usr/share/quadrahq/launcher "$pkgdir/usr/share/quadrahq/launcher"
}
