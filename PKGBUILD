pkgname=rippled
pkgrel=1
pkgver=1.2.2
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs<1.69')
makedepends=('git' 'cmake' 'boost<1.69' 'clang' 'doxygen')
source=("https://github.com/ripple/rippled/archive/$pkgver.zip")
sha256sums=('3e686061ee1821f417ff8e2afa6b036454a39e8a73435b70ffa89a320c83f11b')

build() {
	cmake -Dtarget=clang.release.unity -Dstatic=OFF "$srcdir/$pkgname-$pkgver"
	cmake --build .
}

check() {
	"${srcdir}/rippled" --unittest
}

package() {
	install -D rippled "${pkgdir}/usr/bin/rippled"
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 cfg/rippled-example.cfg "${pkgdir}/etc/opt/ripple/rippled.cfg"
	install -D -m644 cfg/validators-example.txt "${pkgdir}/etc/opt/ripple/validators.txt"
}
