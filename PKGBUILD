# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=ghcid-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.8.7.r31.gb18ad16
pkgrel=1
pkgdesc="GHCi based bare bones IDE"
arch=('i686' 'x86_64')
url="https://github.com/ndmitchell/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('cabal-install')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cabal new-configure \
    -O --jobs --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests
  cabal new-build
}

check() {
  cd "${srcdir}/${_pkgname}"
  cabal new-test
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cabal new-install --install-method=copy --installdir "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
