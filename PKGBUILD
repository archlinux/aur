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
  'util-patch.diff'
  'denariusd.service'
)
sha512sums=('SKIP'
            'c7a121b537bf612cf7e99b5bae4f8fdab1ef86c22a632e2068ddd8956d78e09e3271c80409bc62bfce9f1601023a4d91387d80094b391ebf4a10198b2e8a2d43'
	    '0bbdf08df9f7cd15cebd01df55415ebe9ee35034e81e3cf18a2f9754c9709d1efd347bfa0a5f0badde73d4d79df43c642ee018af025ab9069e804ab8007043e2')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"

	# put config files in ~/.config/denarius instead of ~/.denarius
	patch -uN src/util.cpp ../util-patch.diff
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
