# Maintainer: Adrià Arrufat <adria.arrufat+AUR AT protonmail DOT ch>
pkgname=coax-git
pkgver=0+53+gb5e7536
pkgrel=1
pkgdesc="A (barely working) native Wire client for Unix"
arch=('i686' 'x86_64')
url="https://github.com/wireapp/coax"
license=('GPL3')
depends=('libsodium' 'gtk3' 'openssl' 'sqlite')
makedepends=('cargo')
source=("git+https://github.com/wireapp/coax.git/")
sha512sums=('SKIP')


pkgver() {
  cd coax
  _count=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short HEAD)
  echo 0+$_count+g$_commit
}

build() {
  cd "coax/coax-gtk"
  cargo build --release --features=prod
}

package() {
  cd "coax/coax-gtk"
  cargo install --force --features=prod --root=$pkgdir/usr
  install -Dm644 src/gtk/coax.desktop $pkgdir/usr/share/applications/coax.desktop
  sed -i $pkgdir/usr/share/applications/coax.desktop -e 's/@bindir@/\/usr\/bin/'
  install -Dm644 src/gtk/coax.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/coax.svg
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/coax/COPYING"
  rm $pkgdir/usr/.crates.toml
}
