# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=mitalk
pkgver=4.0.13
pkgrel=2
pkgdesc="MiTalk Messenger"
arch=('x86_64')
url="http://www.miliao.com/"
license=('custom')
makedepends=(
    'imagemagick'
    'p7zip'
    'sed'
)
source=(
    'mitalk.appimage::https://s1.zb.mi.com/miliao/apk/miliao/7.4/MiTalk_4.0.13.AppImage'
)
md5sums=(
    '692fc2549674c10a86c01d9b13d8bea3'
)

package() {
    7z x mitalk.appimage -o"${pkgdir}"/opt/mitalk/

    chmod -R 755 "${pkgdir}"/opt/

    mv "${pkgdir}"/opt/mitalk/米聊 "${pkgdir}"/opt/mitalk/mitalk
    mv "${pkgdir}"/opt/mitalk/usr/share/icons/hicolor/0x0/apps/米聊.png \
       "${pkgdir}"/opt/mitalk/usr/share/icons/hicolor/0x0/apps/mitalk.png

    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        convert -adaptive-resize $i "${pkgdir}"/opt/mitalk/usr/share/icons/hicolor/0x0/apps/mitalk.png \
                                    "${pkgdir}"/opt/mitalk/usr/share/icons/hicolor/0x0/apps/mitalk_$1.png
        install -Dm644 "${pkgdir}"/opt/mitalk/usr/share/icons/hicolor/0x0/apps/mitalk_$1.png \
                       "${pkgdir}"/usr/share/icons/hicolor/$i/apps/mitalk.png
        rm "${pkgdir}"/opt/mitalk/usr/share/icons/hicolor/0x0/apps/mitalk_$1.png
    done

    sed -i "s/米聊/mitalk/" "${pkgdir}"/opt/mitalk/AppRun
    sed -i "s/Icon=米聊/Icon=mitalk/" "${pkgdir}"/opt/mitalk/米聊.desktop
    sed -i "s/Exec=AppRun/Exec=\/opt\/mitalk\/AppRun/" "${pkgdir}"/opt/mitalk/米聊.desktop

    install -Dm644 "${pkgdir}"/opt/mitalk/米聊.desktop "${pkgdir}"/usr/share/applications/mitalk.desktop

    rm "${pkgdir}"/opt/mitalk/米聊.png
    rm "${pkgdir}"/opt/mitalk/米聊.desktop

    rm -r "${pkgdir}"/opt/mitalk/resources/app.asar.unpacked/
}
