# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AI-Shell-Team
_gitname=aish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Empower the Shell to think. Evolve Operations."

pkgver=0.3.11
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

_config="security_policy.yaml"
backup=("etc/${_appname}/${_config}")

options=('!strip')

source=("CONFIG-${pkgver}.yaml::${_ghurlraw}/config/${_config}"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('0081ab5c70ec0225227f1ab5d5a90d59add381adb6b9a35d03fb0fb719bdaaa0'
            '9eb9c0f06cbe918a0f5485931c3b2f57e890eb242997127992e2b97dc2096b06'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('c0ac6992c7f3b56626d8b0c8537266eed054f5aa3714cdc06cff83da6d64f8e4')
sha256sums_aarch64=('57b5f0dcd3be7686cd6a46c68b025712645941bb583c96be61effe3edff2e221')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/"

	_rootfs="rootfs"

	install -Dm755 "${_rootfs}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_rootfs}/etc/systemd/system/${_appname}-sandbox.socket" "${pkgdir}/usr/lib/systemd/system/${_appname}-sandbox.socket"
	install -Dm644 "${_rootfs}/etc/systemd/system/${_appname}-sandbox.service" "${pkgdir}/usr/lib/systemd/system/${_appname}-sandbox.service"

	install -Dm644 "../CONFIG-${pkgver}.yaml" "${pkgdir}/etc/${_appname}/${_config}"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
