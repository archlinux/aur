# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pvolok
pkgname=mprocs
pkgver=0.7.1
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
makedepends=('rust' 'help2man')

source=("https://github.com/pvolok/mprocs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17dcb04d2d7caf8c1263b124cf5ecb145d28ac6d0717c2de78c988858c0572af')


build() {
	cd mprocs-$pkgver

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	install -Dm755 "${srcdir}/mprocs-${pkgver}/target/release/mprocs" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/mprocs-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/mprocs-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "${srcdir}/mprocs-${pkgver}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	help2man ${pkgname} --output "${srcdir}/mprocs-${pkgver}/${pkgname}.1"
	install -Dm644 "${srcdir}/mprocs-${pkgver}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
	gzip "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
