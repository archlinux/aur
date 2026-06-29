# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pitahayaDevSoft
_gitname=poshbuddy
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="TUI manager for Oh My Posh"

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'fontconfig' 'oh-my-posh')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('a422594482a236be957926cdb2194bd5e052c88915e4b130b5b4cd066347ba30')


prepare() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_HOME="${srcdir}/cargo-home"

	msg2 "Building Application"
	cargo build --release --locked
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
