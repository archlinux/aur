# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=fzy-static
_pkgname=fzy
pkgver=1.1
pkgrel=2
pkgdesc="A better fuzzy finder"
url="https://github.com/jhawthorn/fzy"
arch=(aarch64 'x86_64')
makedepends=(make gcc musl gzip)
license=('MIT')
conflicts=(fzy)
provides=(fzy)
source=(https://github.com/jhawthorn/${_pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('09a14c409f9c0000a0827c14007eeb919404e6b29b11b8d05c415575e678238a669c9fff7c8cd23ab330c9dc0341186c6c52347745813570cc4e0987e26d3781')

build() {
  export CC=musl-gcc
  env CFLAGS="$CFLAGS $LDFLAGS -static" make -C ${_pkgname}-${pkgver}
}

check() {
  make -C ${_pkgname}-${pkgver} check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  strip $pkgdir/usr/bin/fzy
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
