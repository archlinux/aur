# Maintainer: Adrià Arrufat <adria.arrufat+AUR AT protonmail DOT ch>
pkgname=coax-git
pkgver=0+112+g526dae3
pkgrel=1
pkgdesc="A (barely working) native Wire client for Unix"
arch=('i686' 'x86_64')
url="https://github.com/wireapp/coax"
license=('GPL3')
depends=('libsodium' 'gtk3' 'openssl' 'sqlite')
makedepends=('cargo')
source=("git+https://github.com/wireapp/coax.git/" "coax-symbolic.svg")
sha512sums=('SKIP'
            'ac10d0ce1186edd738955c098bffd47b320e102b26b2416b82bb2f2d356aa6c9bb3a93c535a8625b0236d78d59ccc2d5374f107c09eb9fac0169d0c862d39dd1')


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
