# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=park
pkgver=0.1.4
pkgrel=3
pkgdesc="Configuration-based dotfiles manager"
url="https://gitlab.com/gbrlsnchs/park"
source=("https://gitlab.com/gbrlsnchs/park/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
arch=("x86_64" "i686")
license=("MIT")

makedepends=("cargo")
optdepends=(
	"gettext: contains envsubst, which can be used in configs to resolve environment variables"
)

sha256sums=("4ac2c12f7d063b1614d3e767942daea05765593566e102939976d267950f546a")

prepare() {
	cd "${srcdir}/${pkgname}-v${pkgver}"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build () {
	cd "${srcdir}/${pkgname}-v${pkgver}"

	cargo build --frozen --release
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "target/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
	install -Dm644 "target/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
	install -Dm644 "target/completions/_${pkgname}" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${pkgname}"
}
