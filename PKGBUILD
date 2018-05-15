pkgname=rippled
pkgrel=1
pkgver=1.0.0
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/ripple/rippled.cfg" "etc/ripple/validators.txt")
depends=('protobuf' 'boost-libs')
makedepends=('cmake' 'boost' 'clang')
source=("https://github.com/ripple/rippled/archive/$pkgver.tar.gz"
	"rippled.service")
sha256sums=('fc02cd6b528da3a202e65ef5a8af2e758498e9e171dad243d16bf9b709ec9681'
	'6f6f6642d989dbe17b17efa217ee4758e372487ad3fb3eca378950d069bfe65f')

build() {
	cmake "$srcdir/$pkgname-$pkgver" -Dtarget=clang.release.unity
	cmake --build .
}

check() {
	rippled --unittest
}

package() {
	install -D -m644 rippled.service "${pkgdir}/usr/lib/systemd/system/rippled.service"
	install -D rippled "${pkgdir}/usr/bin/rippled"
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/lice1nses/$pkgname/LICENSE"
	install -D -m644 cfg/rippled-example.cfg "${pkgdir}/etc/ripple/rippled.cfg"
	install -D -m644 cfg/validators-example.txt "${pkgdir}/etc/ripple/validators.txt"
}
