# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=PaulBunch
_gitname=rmd
_appname=${_gitname}
pkgsuffix=cli
pkgname=${_appname}-${pkgsuffix}
pkgdesc="One-shot Linux reminders that survive reboot and show up as desktop notifications"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('cargo')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('d0fe2cdaa4f10307a15d33f0f0096acc938380dcc18677fb4d424d5625adbb74')


prepare() {
	cd "${pkgname%-${pkgsuffix}}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"

	sed -e 's|%h/.local/bin/|/usr/bin/|g' -i "extra/${_appname}.service"
}

build() {
	cd "${pkgname%-${pkgsuffix}}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname%-${pkgsuffix}}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname%-${pkgsuffix}}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "extra/${_appname}.service" "${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/TIME.md" "${pkgdir}/usr/share/doc/${pkgname}/TIME.md"
	install -Dm644 "docs/VISION.md" "${pkgdir}/usr/share/doc/${pkgname}/VISION.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
