# Maintainer: Myt1 <MYT1 @ qq.com>
# Maintainer: littzhch <2371050115@qq.com>

pkgname=notepad---bin
pkgver=2.20.1
pkgrel=2
pkgdesc="Notepad-- 是一个简单的国产跨平台文本编辑器，是替换 Notepad++ 的一种选择。其内置强大的代码对比功能，让你丢掉付费的 Beyond Compare。"
arch=('x86_64')
url="https://gitee.com/cxasm/notepad--"
license=('GPL-3.0')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
depends=(
    gcc-libs
    qscintilla-qt5
    qt5-xmlpatterns
    qt5-base
    libglvnd
    glibc
    hicolor-icon-theme
    bash
    )
makedepends=(
    patchelf
)
source=("https://gitee.com/mao-yaotang/mmszahuo/raw/master/ndd-v2.20.1-kinly-x64.deb"
"${url}/raw/master/LICENSE")
sha256sums=('9a6dd2c138a22c15785b14ba238da10b35567d630e71a4563b3803c1ee7ac270'
            '0b383d5a63da644f628d99c33976ea6487ed89aaa59f0b3257992deac1171e6b')
options=("!strip")

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.zst
    cd opt/apps/ndd/files
    strip lib*
    strip plugin/lib*
    patchelf Ndd --set-rpath /usr/lib/notepad--
    patchelf plugin/lib* --replace-needed libqmyedit_qt5.so.15 /usr/lib/notepad--/libqmyedit_qt5.so.15
    echo "#!/bin/sh
/usr/lib/notepad--/Notepad-- \$@" > notepad--
}

package() {
    cd "${srcdir}/opt/apps/ndd/files"
    install -Dm755 "Ndd" "${pkgdir}/usr/bin/notepad--"
    install -Dm755 "Ndd" "${pkgdir}/usr/lib/notepad--/Notepad--"
    install -Dm755 "libqmyedit_qt5.so.15" "${pkgdir}/usr/lib/notepad--/libqmyedit_qt5.so.15"
    cp -r plugin "${pkgdir}/usr/lib/notepad--/"
    cp -r themes "${pkgdir}/usr/lib/notepad--/"

    cd "${srcdir}/usr/share"
    sed "s/\/opt\/apps\/ndd\/files\/Ndd/notepad--/g" -i applications/ndd.desktop
    sed "s/Categories=TextEditor;/Categories=TextEditor;Development;Utility;/g" -i applications/ndd.desktop
    sed "s/Exec=notepad-- %U/Exec=env QT_SCALE_FACTOR=1.15 notepad-- %U/g" -i applications/ndd.desktop
    sed "s/Icon=\/usr\/share\/icons\/hicolor\/scalable\/apps\/ndd.svg/Icon=notepad--/g" -i applications/ndd.desktop
    install -Dm644 applications/ndd.desktop "${pkgdir}/usr/share/applications/notepad--.desktop"
    cp -r icons "${pkgdir}/usr/share/" 
    cd ${pkgdir}/usr/share/icons/hicolor/scalable/apps
    mv ndd.svg notepad--.svg
    install -Dm644 notepad--.svg ${pkgdir}/usr/share/pixmaps/notepad--.svg
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
