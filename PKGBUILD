# Maintainer: Chris Benedict <chrisbdaemon@gmail.com>

pkgname='denarius-git'
pkgver=v3.3.9.13.r9.g7164b78
pkgrel=1
pkgdesc="Denarius (D) is an anonymous, untraceable, energy efficient, Proof-of-Work, and Proof-of-Stake cryptocurrency."
arch=('x86_64')
url="https://denarius.io"
license=('MIT')
depends=('miniupnpc' 'libevent' 'openssl-1.0' 'boost-libs' 'libcurl-compat')
makedepends=('git' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  'git+https://github.com/carsenk/denarius.git'
  'denariusd.service'
)
sha512sums=('SKIP' 
         '7918404e8108892a77243c7cb70b5ff1f902f1ed5454c528a0625d14eaa08e479745e7112489770061ab5e3c0bbf19f1575bd641cb6280314e47f0d037ecc07f')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$srcdir/${pkgname%-git}/src"
	OPENSSL_LIB_PATH=/usr/lib/openssl-1.0 OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 make "USE_NATIVETOR=-" -f makefile.unix
}

package() {
	install -Dm755 "$srcdir/${pkgname%-git}/src/denariusd" "$pkgdir/usr/bin/denariusd"
	install -Dm644 "$srcdir/denariusd.service" "$pkgdir/usr/lib/systemd/system/denariusd.service"
	install -Dm644 "$srcdir/${pkgname%-git}/COPYING" "$pkgdir/usr/share/licenses/denarius-git/LICENSE"
}
