# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=wepush
pkgdesc="专注批量推送的小而美的工具"
pkgver=4.5.0
pkgrel=1
arch=('x86_64' 'i686')
url="https://rememberber.github.io/WePush/"
license=('MIT')
depends=("java-runtime")
makedepends=('maven' 'imagemagick')

_appname="WePush"
_distasset="wepush-${pkgver}.tar.gz"
source=("${_distasset}::https://github.com/rememberber/WePush/releases/download/v${pkgver}/${_appname}-${pkgver}-linux.tar.gz")
sha256sums=('3a3817901953c758f372dfb38d339ed9da409134a74ac24a0cb56d5090ed31f5')

prepare() {
    gendesk -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="${_appname}" \
        --genericname="${_appname}" \
        --comment="${_appname}" \
        --startupnotify=true \
        --categories="Network;Office;Utility"
}

build() {
    cd "${srcdir}/${_appname}" || return

    sed -i "s|JAVA=.*|JAVA=$(which java)|" ${_appname}
}


package() {
    mkdir -p "${pkgdir}/usr/share"

    install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/${_appname}/${_appname}"
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/libs" "${srcdir}/${_appname}"/libs/*
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"

	_iconpath="${srcdir}/${_appname}/${_appname}.png"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${_iconpath}" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
}