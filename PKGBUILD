pkgname=rippled
pkgrel=1
pkgver=1.2.4
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs<1.69')
makedepends=('git' 'cmake' 'boost<1.69' 'clang' 'doxygen')
source=("https://github.com/ripple/rippled/archive/$pkgver.zip")
sha256sums=('bd5300774eae731f1863ca06688bf06d4499e231531b2bcda01aa1f488faaafc')

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
