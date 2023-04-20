# Maintainer: Philip Meier <meier.philip@posteo.de>
pkgname='timeular'
pkgver=5.8.4
pkgrel=1
pkgdesc='A proprietary time tracking service'
arch=('x86_64')
url='https://timeular.com'
license=('custom')
depends=('zlib'
	'hicolor-icon-theme')
options=('!strip')
_bin="Timeular-${pkgver}.AppImage"
source=("https://releases.timeular.com/desktop/public/linux/production/${_bin}"
	'LICENSE')
sha512sums=('ec4ea2b1b5b910117be100147f59656c26aea450f3d36ccf291fd06de421a53513585e671be771fe1a3c6953a6d52eab2d7f4a04410be8a9b295b1e0fe33dd06'
            '35c5e9efa9529ca7b6ca6d26990b41482a1bbb0a735051761460f7ae1d7c05e6e50f66a63eedf31d6830bbf5eb9c96045ba78c2c8680f8f6c8416c62b6f5b67e')
	    
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

