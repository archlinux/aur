pkgname=bobby
pkgver=50.0.2
pkgrel=1
pkgdesc="Browse SQLite database files"
arch=('x86_64' 'aarch64')
url="https://github.com/hbons/Bobby"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'gtk4' 'libadwaita' 'sqlite')
makedepends=('cargo' 'meson' 'ninja')
source=("https://github.com/hbons/Bobby/releases/download/v${pkgver}/Bobby-${pkgver}.tar.xz")
sha256sums=('f88e5b1db488b0305eb4f41635f9fccf1a8a0c5724d91356e6e16060948f181b')

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
