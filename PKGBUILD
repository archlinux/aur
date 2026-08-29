# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=scopy-appimage
_disname=${pkgname%-appimage}
pkgver=2.2.1
pkgrel=1
pkgdesc="A software oscilloscope and signal analysis toolset."
arch=('x86_64')
url="https://github.com/analogdevicesinc/scopy"
license=('GPL-3.0-only')
provides=('scopy')
conflicts=('scopy')
depends=('glibc' 'zlib' 'hicolor-icon-theme')

_ver=v${pkgver}
_appimage=Scopy-${_ver}-Linux-x86_64.AppImage
source=(
    ${url}/releases/download/${_ver}/${_appimage}
    LICENSE::${url}/releases/download/${_ver}/LICENSE.txt
)
sha256sums=('52c95c6d1abd5fc597b1c2477d98848dffa8b8f56f2cfc7e5305523ee6f0f730'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
options=('!strip')


prepare() {
    cd ${srcdir} && rm -rf "squashfs-root"
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
    sed -i "/^Exec=/c\Exec=/usr/bin/${_disname} %U" ${srcdir}/squashfs-root/${_disname}.desktop
}

package() {
    # AppImage
    install -Dm755 ${srcdir}/${_appimage} ${pkgdir}/opt/${pkgname}/${_disname}.AppImage
    
    # Desktop file
    install -Dm644 ${srcdir}/squashfs-root/${_disname}.desktop -t ${pkgdir}/usr/share/applications

    # Icon images
    install -Dm644 ${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_disname}.png -t ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    install -Dm644 ${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_disname}.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps
    
    # Symlink executable
    install -dm755 ${pkgdir}/usr/bin && ln -sf /opt/${pkgname}/${_disname}.AppImage ${pkgdir}/usr/bin/${_disname}

    # License
    install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
