# Maintainer: Cameron Katri <katri.cameron@gmail.com>

pkgname=ldid
pkgver=2.1.4
pkgrel=1
pkgdesc="a tool used for ad-hoc codesigning Darwin binaries - sbingners fork"
provides=('ldid' 'ldid2')
arch=('x86_64')
url="https://github.com/sbingner/ldid"
license=('AGPL')
depends=('openssl' 'libplist' 'libxml2')
source=("https://github.com/sbingner/ldid/archive/v$pkgver.tar.gz" "password-p12.patch")
b2sums=('1241cfde82259918bc4590b52e23ffc1f955e80ff2095eb9c47d2c465024288748f45b666da50bd6428dbf18ef2ed806845f025ef9dc99d61aad56d256025e66'
        '63781c6ebd916356f6c499984a5f48d53042bfcd836d7b13b68b5874d04ca96f17562676509d04176f40833d5381523206c7608e893f14b44078462fe2d1ce3a')

build() {
	cd ldid-$pkgver
	patch -p1 < ${srcdir}/password-p12.patch
	cc ${CFLAGS} -I. -c -o lookup2.o lookup2.c
	c++ ${CXXFLAGS} -std=c++11 -o ldid lookup2.o ldid.cpp -I. -lcrypto -lplist-2.0 -lxml2
}

package() {
	cd ldid-$pkgver
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ldid ${pkgdir}/usr/bin/
	ln -s ldid ${pkgdir}/usr/bin/ldid2
}
