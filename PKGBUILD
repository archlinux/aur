# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
pkgver=0.10.0
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('e9f2c206038cf78f6dc71ca1c724d78c85b7f084c375bb1e5bcef1061ab5239208e7ff7c07f87c5d581553c59eaad43c02bb4d623dc773391eb3bc023d0e9e7d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
