# Maintainer: Integral <integral@member.fsf.org>

pkgname=ouou-dictation
pkgver=1.0.0
_pkgver=${pkgver%.*}
pkgrel=2
pkgdesc="A command-line program for self-help dictation supporting Chinese, Japanese and English"
arch=('x86_64' 'aarch64')
url="https://github.com/OuOu2021/${pkgname}"
license=('Apache-2.0 OR MIT')
depends=('speech-dispatcher')
makedepends=('cargo' 'libspeechd')
optdepends=('festival: Speech output using Festival'
	'espeak-ng: Speech output using ESpeak-ng')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('b8f3aa04f2fbda29671aff13b3053188596f30fd60c00e67071bffa20495743a')

prepare() {
	cd "${pkgname}-${_pkgver}/"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}-${_pkgver}/"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${_pkgver}/"
	install -Dm755 "target/release/${pkgname/-/_}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
