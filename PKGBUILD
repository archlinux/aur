# Maintainer: fthiery fthiery@gmail.com

pkgname=keeweb-desktop
pkgver=1.6.1
pkgrel=2
pkgdesc="This webapp is a desktop password manager compatible with KeePass databases."
arch=('x86_64')
depends=('gconf' 'libxss' 'gtk2')
url="https://github.com/keeweb/keeweb"
license=('MIT')
source=(
    "${url}/releases/download/v${pkgver}/KeeWeb-${pkgver}.linux.x64.zip"
    "keeweb.desktop"
    "keeweb.xml"
    "icon.png"
)
sha256sums=('22a14dcd57c6f909a9910c2b85fb4f50b833d60e95f89d61ab9b687f7523245e'
            'd6a5d6402d4c1c211da5f077b77422fc7da4dd4c7208bc77e7e29cf2f5427ca3'
            '3d017c17a8788166c644e2460ba3596fd503f300342561921201fe5f69e5d194'
            'a0c03adaf79ad7d9af53447cac3746d687daf9a8ce19de7e4d92dc36d1d474a9')

package(){
    mkdir -p "${pkgdir}"/opt/${pkgname}
    cp --preserve=mode -r * "${pkgdir}"/opt/${pkgname}
    rm ${pkgdir}/opt/${pkgname}/KeeWeb-${pkgver}.linux.x64.zip

    desktop-file-install -m 644 --dir "$pkgdir"/usr/share/applications/ keeweb.desktop

    for res in 128x128; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        #https://github.com/keeweb/keeweb/issues/788
        #install -Dm755 "${pkgdir}/opt/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
        install -Dm755 icon.png "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
    done

    mkdir -p "${pkgdir}"/usr/bin
    echo -e "#!/bin/sh\n/opt/${pkgname}/KeeWeb --disable-updater \$1" > ${pkgdir}/usr/bin/KeeWeb
    chmod 755 ${pkgdir}/usr/bin/KeeWeb

    install -Dm644 keeweb.xml "$pkgdir"/usr/share/mime/packages/keeweb.xml
}
