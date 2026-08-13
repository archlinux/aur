# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ahkohd
_pkgname=oyo
_execname=oy

pkgname=${_pkgname}
pkgver=0.1.57
pkgrel=1
pkgdesc="A diff viewer that works two ways: step through changes or review a classic scrollable diff"

url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('699f708f88173221ad51fe138082d54cea13f219ff70f737d817be9e8b9f5275')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects" RUSTFLAGS+=" --remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "docs/PERF.md" "${pkgdir}/usr/share/doc/${pkgname}/PERF.md"
	install -Dm644 "docs/AGENT.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENT.md"
	install -Dm644 "docs/THEME.md" "${pkgdir}/usr/share/doc/${pkgname}/THEME.md"
	install -Dm644 "docs/DEBUG.md" "${pkgdir}/usr/share/doc/${pkgname}/DEBUG.md"
	install -Dm644 "docs/REVIEW.md" "${pkgdir}/usr/share/doc/${pkgname}/REVIEW.md"
	install -Dm644 "docs/CONFIG.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIG.md"
	install -Dm644 "docs/CONTROL.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTROL.md"
	install -Dm644 "docs/MARKDOWN.md" "${pkgdir}/usr/share/doc/${pkgname}/MARKDOWN.md"
	install -Dm644 "docs/PROFILING.md" "${pkgdir}/usr/share/doc/${pkgname}/PROFILING.md"
	install -Dm644 "docs/DIFF_VIEWER.md" "${pkgdir}/usr/share/doc/${pkgname}/DIFF_VIEWER.md"
	install -Dm644 "docs/KEYBINDINGS.md" "${pkgdir}/usr/share/doc/${pkgname}/KEYBINDINGS.md"
	install -Dm644 "docs/REVIEW_HOOKS.md" "${pkgdir}/usr/share/doc/${pkgname}/REVIEW_HOOKS.md"
	install -Dm644 "docs/DIFF_PREVIEWS.md" "${pkgdir}/usr/share/doc/${pkgname}/DIFF_PREVIEWS.md"
	install -Dm644 "docs/DEMO_RECORDING.md" "${pkgdir}/usr/share/doc/${pkgname}/DEMO_RECORDING.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
