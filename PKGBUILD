# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pvolok
_upstream=dekit
pkgname=mprocs
pkgver=0.10.2
pkgrel=1
pkgdesc="Run multiple commands in parallel (now dekit; installs both dekit and mprocs)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_upstream}"
license=('MIT')

provides=("${pkgname}" "${_upstream}")
conflicts=("${_upstream}" "${_upstream}-bin")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${_upstream}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6acfd19444a371ce04557af1a755accc4735c64e650704ae257aaf9f2e1168ba')

build() {
	cd ${_upstream}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_upstream}-${pkgver} || exit 1

	install -Dm755 "target/release/${_upstream}" "${pkgdir}/usr/bin/${_upstream}"
	# started as `mprocs`, dekit runs the legacy mprocs CLI
	ln -s ${_upstream} "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
