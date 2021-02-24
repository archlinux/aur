# Maintainer: Ian Stride <ianstride@gmail.com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=rippled
pkgrel=1
pkgver=1.7.0
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs' 'libarchive')
makedepends=('git' 'cmake' 'boost' 'clang' 'doxygen')
source=("$pkgname-$pkgver.zip::https://github.com/ripple/rippled/archive/$pkgver.zip"
        "rippled.service")
sha256sums=('6c20b2b3d22fcfeb6adc4da33eb0425afecabbe7deaa3125f7bab479eb5feb79'
            'd2ae0709844499b82fc1def2a30d18428d67adaa6660653362a1053214091c4c')

build() {
	cmake -DCMAKE_BUILD_TYPE=Release -Dstatic=OFF "$srcdir/$pkgname-$pkgver"
	cmake --build .
}

check() {
	"${srcdir}/rippled" --unittest
}

package() {
	install -D rippled "${pkgdir}/usr/bin/rippled"
	install -D -m644 "${srcdir}/rippled.service" "${pkgdir}/usr/lib/systemd/system/rippled.service"
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 cfg/rippled-example.cfg "${pkgdir}/etc/opt/ripple/rippled.cfg"
	install -D -m644 cfg/validators-example.txt "${pkgdir}/etc/opt/ripple/validators.txt"
}
