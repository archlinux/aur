# Maintainer: Dominik Wetzel <dimonok at web dot de>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=lib32-libevent
_pkgname=libevent
pkgver=2.1.8
pkgrel=1
pkgdesc="An event notification library"
arch=('x86_64')
url="http://libevent.org/"
license=('BSD')
depends=('libevent' 'lib32-openssl')
# optdepends=('python2: to use event_rpcgen.py')
source=(https://github.com/libevent/libevent/releases/download/release-$pkgver-stable/$_pkgname-$pkgver-stable.tar.gz{,.asc})
sha256sums=('965cc5a8bb46ce4199a47e9b2c9e1cae3b137e8356ffdad6d94d3b9069b71dc2'
            'SKIP')
validpgpkeys=('B35BF85BF19489D04E28C33C21194EBB165733EA'
              '9E3AC83A27974B84D1B3401DB86086848EF8686D')

build() {
#  export CC="gcc -m32"
#  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgname}-${pkgver}-stable
  ./autogen.sh
  ./configure \
  	--prefix=/usr \
	--sysconfdir=/etc \
	--disable-libevent-regress \
	--libdir=/usr/lib32 \
	--libexecdir=/usr/lib32 \
	CC="gcc -m32" \
	CXX="g++ -m32" \
	"LDFLAGS=-m32"
  make
}

check() {
  cd ${_pkgname}-${pkgver}-stable
  make -j1 check
}

package() {
  cd ${_pkgname}-${pkgver}-stable
  make DESTDIR="${pkgdir}" install
#  install -Dm 644 LICENSE "${pkgdir}"/usr/share/licenses/libevent/LICENSE
#  mkdir "${pkgdir}/usr/lib32"
#  mv "${pkgdir}/usr/lib/*" "${pkgdir}/usr/lib32/"
#  rm -r "${pkgdir}/usr/lib"
  rm -r "${pkgdir}/usr/include"
  rm -r "${pkgdir}/usr/bin"
}

