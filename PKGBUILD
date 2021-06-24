# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver=3.9.3
_bin="${pkgname}-${pkgver}.appimage"
pkgrel=0
pkgdesc='A proprietary time tracking service'
arch=('x86_64')
url='https://timeular.com'
license=('custom')
depends=('zlib'
	'hicolor-icon-theme')
options=('!strip')
source=("${_bin}::https://s3.amazonaws.com/timeular-desktop-packages/linux/production/Timeular.AppImage"
	'LICENSE')
sha512sums=('aa80d4cbf8de04e2b57cdf624cea8423df8b1a0c72459256b93b69c95dc57f62434015670a27e4944929bafa6cd51a4eb1d8eecfa647ce68837db7b11fb592d0'
            'SKIP')
	    
prepare() {
    cd "${srcdir}"
    chmod +x "${_bin}"
    "./${_bin}" --appimage-extract
    chmod -x "${_bin}"

    sed -e "s/Exec=.*/Exec=timeular/" -i "${srcdir}/squashfs-root/timeular.desktop"
}

package() {  
    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/${pkgname}/${_bin}" 
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_bin}" "${pkgdir}/usr/bin/timeular"
    
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/squashfs-root/timeular.desktop" "${pkgdir}/usr/share/applications/timeular.desktop"

    cp -R "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +
}

