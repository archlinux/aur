# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AI-Shell-Team
_gitname=aish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Empower the Shell to think. Evolve Operations."

pkgver=0.3.8
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

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('182b432e0e2ba88c28049e5e2386f0d640b0bc28dfd397f578428e46774edb56'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('c645534ed492e893ef8da04cc42750430e9cac89252344ae38f16408d3629773')
sha256sums_aarch64=('23b7ff882b51a3289e72980de59626a01af49f5923a0291c7083fdabe4d9b835')


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

	install -Dm644 "${_rootfs}/etc/${_appname}/${_config}" "${pkgdir}/etc/${_appname}/${_config}"

	install -dm755 "${pkgdir}/usr/share/${_appname}"
	cp -rf "${_rootfs}/usr/share/${_appname}/"* "${pkgdir}/usr/share/${_appname}"

	install -Dm644 "${_rootfs}/etc/systemd/system/${_appname}-sandbox.socket" "${pkgdir}/usr/lib/systemd/system/${_appname}-sandbox.socket"
	install -Dm644 "${_rootfs}/etc/systemd/system/${_appname}-sandbox.service" "${pkgdir}/usr/lib/systemd/system/${_appname}-sandbox.service"

	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
