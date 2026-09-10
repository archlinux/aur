# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=findyourexit
_gitname=excise
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Surgical terminal storage navigator"

pkgver=1.2.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}-${_gitversion}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}-${_gitversion}.tar.gz")
sha256sums_x86_64=('5c0344b933e43a4fba1a3b0acc4eb42af6eff9a542d59dee3b406076222e5035')
sha256sums_aarch64=('5c0344b933e43a4fba1a3b0acc4eb42af6eff9a542d59dee3b406076222e5035')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_gitname}-${_CARCH}-${_gitversion}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "generated/completions/_${_appname}" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "generated/completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "generated/completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "generated/man/${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "schemas/deletion-history.schema.json" -t "${pkgdir}/usr/share/doc/${pkgname}/schemas/"
	install -Dm644 "schemas/native-path.schema.json" -t "${pkgdir}/usr/share/doc/${pkgname}/schemas/"
	install -Dm644 "schemas/scan-report.schema.json" -t "${pkgdir}/usr/share/doc/${pkgname}/schemas/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
