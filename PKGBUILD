pkgname=bobby
pkgver=51.0.0
pkgrel=1
pkgdesc="Browse SQLite database files"
arch=('x86_64' 'aarch64')
url="https://github.com/hbons/Bobby"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'gtk4' 'libadwaita' 'sqlite')
makedepends=('cargo' 'meson' 'ninja')
source=("https://github.com/hbons/Bobby/releases/download/v${pkgver}/Bobby-${pkgver}.tar.xz")
sha256sums=('dd90e6d3d08693bfeff4835a6fb6a8125f3f044914bed7da9f91550385c23774')

prepare() {
  cd "Bobby-${pkgver}"
  sed -i 's/rusqlite = { version = "0.37.0", features = \["bundled"\] }/rusqlite = "0.37.0"/' Cargo.toml
  sed -i 's/^strip = true$/strip = false/' Cargo.toml
}

build() {
  arch-meson "Bobby-${pkgver}" build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
