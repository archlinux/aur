# Maintainer: Drackrath <datenschutz at ai-krieger dot de>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later' 'MIT')

provides=("${_appname}")
# Needs Rust 1.100 (rust-toolchain.toml); rustup installs it.
makedepends=('rustup')
depends=('glibc' 'libgcc' 'xz' 'dbus' 'vulkan-driver' 'vulkan-icd-loader')
optdepends=('lib32-vulkan-driver: 32-bit Windows games via Proton (multilib)'
            'lib32-vulkan-icd-loader: 32-bit Windows games via Proton (multilib)'
            'lib32-freetype2: fonts in 32-bit Windows games (multilib)'
            'lib32-wayland: Wayland driver for 32-bit Windows games (multilib)'
            'steam: Steamworks bridge for games that need the Steam client')
install=aurelia.install

options=(!strip !lto)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_gitversion}.tar.gz")
sha256sums=('0b4f1f617b3600f4065ca591c30f3215750bd0dd2a03d6424cf2a1ddd8e3d66e')


prepare() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export CARGO_TARGET_DIR=target
	# Some tests read Steam data under $HOME.
	export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
	export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
	mkdir -p "${srcdir}/test-home"
	HOME="${srcdir}/test-home" cargo test --frozen --release
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
