# Maintainer: Adrià Arrufat <adria.arrufat+AUR AT protonmail DOT ch>
pkgname=coax-git
pkgver=0.0.0+20170303+48+gd00254a
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
  _date=$(git show --format="%cd" --date=format:"%Y%m%d" --no-patch)
  _count=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short HEAD)
  echo 0.0.0+$_date+$_count+g$_commit
}

build() {
  cd "coax/coax-gtk"
  cargo build --release --features=prod
}

package() {
  cd "coax/coax-gtk"
  cargo install --root=$pkgdir/usr
  install -Dm644 src/gtk/coax.desktop $pkgdir/usr/share/applications/coax.desktop
  sed -i $pkgdir/usr/share/applications/coax.desktop -e 's/@bindir@/\/usr\/bin/'
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/coax/COPYING"
  rm $pkgdir/usr/.crates.toml
}
