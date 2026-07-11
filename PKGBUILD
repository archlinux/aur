# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=SoCkEt7
_pkgname=Livediff
_appname=${_pkgname,,}
pkgname=${_appname}
pkgdesc="👁️ Real-time file monitoring with beautiful, pulsing TUI diff visualization"

pkgver=3.2.0
pkgrel=2
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT' 'Apache-2.0')

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc')

provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_pkgvername}.tar.gz")
sha256sums=('a813b9df67351cb4e401cdd6d483b907ad590f345a94fdd876e1c46e998df16e')


prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd ${srcdir}/${_pkgname}-${pkgver} || exit 1

	./target/release/${_appname} --version
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CONTEXT.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTEXT.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "docs/use-cases.md" "${pkgdir}/usr/share/doc/${pkgname}/USE-CASES.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
