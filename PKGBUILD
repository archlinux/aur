# Maintainer: nothing_glows <wppopqpu@outlook.com>

pkgname=neru-bin
_pkgname=neru
pkgver=1.46.1
pkgrel=1
pkgdesc="tool to navigate your entire screen without touching the mouse"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=("x86_64")
url="https://github.com/y3owk1n/neru"
license=("MIT")
_filename="${_pkgname}-linux-amd64.zip"
_archive="${_pkgname}-${pkgver}.zip"
source=("${_archive}::https://github.com/y3owk1n/${_pkgname}/releases/download/v${pkgver}/${_filename}" "${_pkgname}_license::https://raw.githubusercontent.com/y3owk1n/${_pkgname}/main/LICENSE")
sha256sums=("979b6e39b4f531d1028d00045ee11bc899e7b045035a8923461d3b53735f0b77" "SKIP")

# disable -debug package
options=("!debug")

depends=(
	"cairo"
	"libx11"
	"fontconfig"
	"libxtst"
	"libxrandr"
	"libei"
	"libxkbcommon"
	"wayland"
	"libxfixes"
)
makedepends=("curl" "unzip")


package() {
	cd "${srcdir}"


	echo "Installing the binary file."
	install -vDm755 "bin/${_pkgname}" -t "${pkgdir}/usr/bin/"

	echo "Installing man pages."
	(
		cd share/man/man1
		for each in *; do
			install -vDm644 "${each}" -t "${pkgdir}/usr/share/man/man1/"
		done
	)

	echo "Installing the license file."
	install -vDm644 "${_pkgname}_license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	echo "Generating shell completions."
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/" "${pkgdir}/usr/share/bash-completion/completions/" "${pkgdir}/usr/share/zsh/site-functions/"
	"${pkgdir}/usr/bin/${_pkgname}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	"${pkgdir}/usr/bin/${_pkgname}" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	"${pkgdir}/usr/bin/${_pkgname}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
