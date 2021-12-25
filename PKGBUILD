# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Peter Nguyen <peter dot hieu dot nguyen at gmail dot com>

pkgname=mongrel2
pkgver=1.13.0
pkgrel=1
pkgdesc="Application, language, and network architecture agnostic web server"
url="https://mongrel2.org/"
license=('BSD')
arch=("i686" "x86_64")
depends=('sqlite3' 'zeromq' 'libbsd')
makedepends=('git')
source=("https://github.com/mongrel2/mongrel2/releases/download/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('b6f1f50c9f65b605342d8792b1cc8a1c151105339030313b9825b6a68d400c10')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  OPTLIBS="$OPTLIBS -lbsd" \
  OPTFLAGS="$CFLAGS -DHAS_ARC4RANDOM=1 -Wno-implicit-fallthrough -Wno-unused -Wno-unused-result $LDFLAGS" make -f localmbedtls.mak
}

check() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make -f localmbedtls.mak tests
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make -f localmbedtls.mak PREFIX="${pkgdir}"/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
