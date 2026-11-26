# Maintainer: MapleProjects <https://github.com/MapleProjects>
# Empaquetado original de aubree.wtf <https://aubree.wtf/>
#
# Quadra 0.50.x es una reescritura en Rust: el launcher Python
# (launcher/quadra/core.py) y los scripts build_debug_shim.sh /
# packaging/build-metal.sh ya no existen en el repositorio upstream.
# build() y package() siguen el layout actual (Cargo + data/ + flatpak/).
pkgname=quadrahq-git
_name=Quadra
pkgver=0.52.0.r0.gf252814
pkgrel=4
pkgdesc="Bootstrapper for the macOS Roblox client on Linux through Rosemary"
arch=('x86_64')
url="https://quadrahq.org"
_repo="https://github.com/QuadraHQ/Quadra"
license=('GPL-3.0-only' 'MIT' 'ISC' 'OFL-1.1')
depends=('gtk4' 'libadwaita' 'pango' 'cairo' 'glib2'
         'hicolor-icon-theme' 'shared-mime-info' 'desktop-file-utils')
makedepends=('git' 'cargo' 'rust' 'clang' 'lld' 'pkgconf')
optdepends=('mangohud: performance overlay'
            'mesa: Mesa EGL and Zink for the Vulkan renderer'
            'vulkan-driver: hardware Vulkan driver for the Vulkan renderer'
            'pipewire-audio: native PipeWire audio playback')
provides=('quadrahq' 'ciderhq' 'macoblox')
conflicts=('quadrahq' 'ciderhq' 'ciderhq-git' 'macoblox' 'macoblox-git')
replaces=('ciderhq-git' 'macoblox-git')
source=("$_name::git+$_repo.git")
sha256sums=('SKIP')
# El crate ring compila objetos C/asm pregenerados; con -flto (opcion lto de
# makepkg) esos objetos quedan en bitcode y el enlace de Rust falla con
# "undefined symbol: ring_core_0_17_14__*". Se desactiva LTO para este paquete.
options=('!lto')

pkgver() {
  cd "$_name"
  # Normalize p1 and .p1 tags so patch builds sort after earlier git snapshots.
  git describe --tags --long --match 'v[0-9]*' --abbrev=7 |
    sed 's/^v//;s/^\([0-9][0-9.]*[0-9]\)\.\{0,1\}p\([0-9][0-9]*\)/\1.\2/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  cargo build --release --locked
}

package() {
  cd "$_name"
  install -Dm755 target/release/quadra "$pkgdir/usr/bin/quadra"
  install -Dm644 data/org.quadrahq.Quadra.desktop \
    "$pkgdir/usr/share/applications/org.quadrahq.Quadra.desktop"
  install -Dm644 data/org.quadrahq.Quadra.xml \
    "$pkgdir/usr/share/mime/packages/org.quadrahq.Quadra.xml"
  install -Dm644 flatpak/org.quadrahq.Quadra.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.quadrahq.Quadra.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/icons"
  cp -r data/icons/hicolor "$pkgdir/usr/share/icons/"
}
