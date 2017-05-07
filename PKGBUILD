# Maintainer: Adrià Arrufat <adria.arrufat+AUR AT protonmail DOT ch>
pkgname=coax-git
pkgver=0+103+g6326c4c
pkgrel=1
pkgdesc="A (barely working) native Wire client for Unix"
arch=('i686' 'x86_64')
url="https://github.com/wireapp/coax"
license=('GPL3')
depends=('libsodium' 'gtk3' 'openssl' 'sqlite')
makedepends=('cargo')
source=("git+https://github.com/wireapp/coax.git/" "coax-symbolic.svg")
sha512sums=('SKIP'
            '09be14c9d112e784a483e4c14dd73341441af5172c1b83f582e2ce56a8766c6d0e7ea3cad530750188090ff7f273ce3a20e6ec1a748b95ebe3d86673d8924d6d')


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
  install -Dm644 ${srcdir}/coax-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/coax-symbolic.svg
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/coax/COPYING"
  rm $pkgdir/usr/.crates.toml
}
