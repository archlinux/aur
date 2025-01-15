# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Wenxuan Zhang <wenxuangm at gmail dot com>
# Contributor: éclairevoyant

_pkgauthor=wfxr
_pkgname=csview
pkgname=${_pkgname}-bin
pkgver=1.3.4
pkgrel=1
pkgdesc='High performance CSV viewer with CJK/emoji support'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('Apache' 'MIT')
depends=('glibc' 'gcc-libs')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[2]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1d9f0683fb9332c77cd96a71b6d80dea88cfe81630316c32c9b5faa562db33dc')
sha256sums_i686=('039952c21c75454d8e83fa5ec51ebc642abab258134eaffec2e6496fb03917d9')
sha256sums_aarch64=('4283fa89e795e20aa8a83ac10d63b3dfd2cc7371edd7530a0a0b691c568b5ea3')

build() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu" || exit

	help2man ./${_pkgname} --output "MAN.1" --no-info
	gzip "MAN.1"
}

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu" || exit

	install -Dm755 "${_pkgname}" 							"${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 LICENSE-{APACHE,MIT}					-t	"${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md 							-t	"${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 completions/bash/${_pkgname}.bash		"${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 completions/fish/${_pkgname}.fish		"${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 completions/zsh/_${_pkgname}     		"${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

	install -Dm644 "MAN.1.gz" 								"${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
