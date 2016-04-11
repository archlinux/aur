# Maintainer: fthiery fthiery@gmail.com

pkgname=keeweb-desktop
pkgver=1.1.2
pkgrel=1
pkgdesc="This webapp is a desktop password manager compatible with KeePass databases."
arch=('x86_64')
url="https://github.com/antelle/keeweb"
license=('MIT')
source=(
    "${url}/releases/download/v${pkgver}/KeeWeb.linux.x64.zip"
    "keeweb.desktop"
    "keeweb-desktop.install"
    "keeweb.xml"
)
sha256sums=(
    '9d18121c5918b220c4be5859bb82c03535488a2d8c22507521080606e563ea95'
    'd6a5d6402d4c1c211da5f077b77422fc7da4dd4c7208bc77e7e29cf2f5427ca3'
    '179bf1943eef5c618fb9d070e240cde431a796926ed8505eb73ba3eab30eb198'
    '3d017c17a8788166c644e2460ba3596fd503f300342561921201fe5f69e5d194'
)
install=${pkgname}.install

package(){
    mkdir -p "${pkgdir}"/opt/${pkgname}
    cp --preserve=mode -r * "${pkgdir}"/opt/${pkgname}
    rm ${pkgdir}/opt/${pkgname}/KeeWeb.linux.x64.zip

    desktop-file-install -m 644 --dir "$pkgdir"/usr/share/applications/ keeweb.desktop

    for res in 128x128; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        install -Dm755 "${pkgdir}/opt/${pkgname}/resources/app/icon.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/keeweb.png"
    done

    mkdir -p "${pkgdir}"/usr/bin
    echo -e "#!/bin/sh\n/opt/${pkgname}/KeeWeb --disable-updater \$1" > ${pkgdir}/usr/bin/KeeWeb
    chmod 755 ${pkgdir}/usr/bin/KeeWeb

    install -Dm644 keeweb.xml "$pkgdir"/usr/share/mime/packages/keeweb.xml
}
