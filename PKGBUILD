#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('zhisu_ocr-appimage')
pkgver=1.11.11
pkgrel=1
pkgdesc="智速OCR文字识别，可以识别图片文字"
provides=("zhisu_ocr")
url='https://ocr.psing.tech/'
arch=('x86_64')
depends=('libappimage')
source=("http://cdn.psing.tech/zhisu_ocr_linux_x64.AppImage"
)
sha512sums=('bb3ead6339135b306a415085c0172b69f140b48598a305838382731245174a79d361fe447e2e801b8fbfccbdccf88c003aad248caba7cb374006d265adb7d4af'
)
options=(!strip)
_filename="zhisu_ocr_linux_x64.AppImage"

prepare(){
    cd "${srcdir}"
    
    chmod +x  "${_filename}"
    ./"${_filename}" --appimage-extract
    
    sed -i "s|Exec=AppRun|Exec=/usr/bin/zhisu_ocr|" "squashfs-root/zhisuOcr.desktop"
    
    chmod -R a-x+rX squashfs-root/usr
}

package(){
    # AppImage
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/zhisu_ocr/${_filename}"
	 
	 # Desktop
	 install -Dm644 "${srcdir}/squashfs-root/zhisuOcr.desktop" "${pkgdir}/usr/share/applications/zhisuOcr.desktop"
	 
	 # Icons
	 install -dm755 "${pkgdir}/usr/share"
	 cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
	 
	 mkdir -p "${pkgdir}"/usr/bin
	 ln -s /opt/zhisu_ocr/"${_filename}" "${pkgdir}"/usr/bin/zhisu_ocr
}
