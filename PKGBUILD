# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver=3.9.6
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
sha512sums=('c1d241a2626bdf04091ca5a3751b31774291ad5f5d99cd1b2f2d54e6e895af0991d458b35a0606de2ff4b7befd511853309560f2960b01673f01b5064d645abd'
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

