# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: AsukaMinato
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_pkgname=dsp-guitar
pkgname="go-${_pkgname}-bin"
pkgver=1.8.0
pkgrel=4
pkgdesc="A cross-platform multichannel multi-effects processor for electric guitars and other instruments"
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
sha256sums=('a39993ba8ad40ce74234e908db276841df1fd517c19385d01436d160986c77b1'
            '8141e31e6fa242eb005924977a7786a2741e2f00cdb7bf13686d97b35d6e3527')
build() {
	sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
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
	rm -rf *.exe
	chmod a+r keys/*
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/opt"
	cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
}