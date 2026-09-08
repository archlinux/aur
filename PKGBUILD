# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: AsukaMinato
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_pkgname=dsp-guitar
pkgname="go-${_pkgname}-bin"
pkgver=1.8.1
pkgrel=1
pkgdesc="A cross-platform multichannel multi-effects processor for electric guitars and other instruments."
arch=(
	'aarch64'
	'x86_64'
)
url='https://github.com/andrepxx/go-dsp-guitar'
license=('Apache-2.0')
provides=(
	"${pkgname%-bin}"
	"${_pkgname}"
)
conflicts=(
	"${pkgname%-bin}"
	"${_pkgname}"
)
depends=(
	'jack'
)
source=(
	"${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}.tar.gz"
	"${pkgname%-bin}.sh"
)
sha256sums=('60057519e27ea7384cb23b5f8352d506ab07bfde003f23794d388aebeec38fcd'
            '4d4d6d7600ec9260a0deae188b97774dc30771b26028d1a4127d7a58250e5b50')
prepare() {
	sed -i -e "
		s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
	cd "${srcdir}/${pkgname%-bin}"
	case "${CARCH}" in
        x86_64)
            rm -rf *aarch64*
			mv dsp-linux-amd64 "${pkgname%-bin}"
			mv dsp-linux-amd64-debug "${pkgname%-bin}-debug"
        ;;
        aarch64)
            rm -rf *amd64*
			mv dsp-linux-aarch64 "${pkgname%-bin}"
			mv dsp-linux-aarch64-debug "${pkgname%-bin}-debug"
        ;;
    esac
	find "${srcdir}/${pkgname%-bin}" -type f -name "*.exe" -exec rm -rf {} +
	chmod a+r keys/*
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib"
	cp -a "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
}
