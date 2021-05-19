# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver=3.9.2
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
sha512sums=('df81cefe849268e2ee9bcf046fad3cc3be85e6a3544c71eabe895bfe07df3d5939e9f0b2fd53579d8b34d62fddbd085fa74cd6148394a6c921f0207bd26a4935'
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

