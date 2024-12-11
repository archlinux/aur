# Maintainer: Myt1 <MYT1 @ qq.com>
# Maintainer: littzhch <2371050115@qq.com>

pkgname=notepad---bin
_pkgname=com.hmja.notepad
pkgver=3.0.0.0
_pkgver=v3.0
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
source=("https://gitee.com/cxasm/notepad--/releases/download/${_pkgver}/${_pkgname}_${pkgver}_amd64.deb"
"${url}/raw/master/LICENSE")
sha256sums=('0133f059cc165802398a064dc3aac697c7ce2c32a9bbd2da97e9c36329e1d7ad'
            '0b383d5a63da644f628d99c33976ea6487ed89aaa59f0b3257992deac1171e6b')
options=("!strip")

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.xz
    cd "${srcdir}/opt/apps/com.hmja.notepad/files"
    strip lib*
    strip plugin/lib*
    patchelf Notepad-- --set-rpath /usr/lib/notepad--
    patchelf plugin/lib* --replace-needed libqmyedit_qt5.so.15 /usr/lib/notepad--/libqmyedit_qt5.so.15
    echo "#!/bin/sh
/usr/lib/notepad--/Notepad-- \$@" > notepad--
}

package() {
    cd "${srcdir}/opt/apps/com.hmja.notepad/files"
    install -Dm755 "notepad--" "${pkgdir}/usr/bin/notepad--"
    install -Dm755 "Notepad--" "${pkgdir}/usr/lib/notepad--/Notepad--"
    install -Dm755 "libqmyedit_qt5.so.15" "${pkgdir}/usr/lib/notepad--/libqmyedit_qt5.so.15"
    cp -r plugin "${pkgdir}/usr/lib/notepad--/"
    cp -r themes "${pkgdir}/usr/lib/notepad--/"

    cd "${srcdir}/opt/apps/com.hmja.notepad/entries/applications"
    sed "s/\/opt\/apps\/com.hmja.notepad\/files\/Notepad--/notepad--/g" -i com.hmja.notepad.desktop
    sed "s/Categories=TextEditor;/Categories=TextEditor;Development;Utility;/g" -i com.hmja.notepad.desktop
    sed "s/Exec=notepad-- %U/Exec=env QT_SCALE_FACTOR=1.15 notepad-- %U/g" -i com.hmja.notepad.desktop
    sed "s/Icon=\/opt\/apps\/com.hmja.notepad\/entries\/icons\/hicolor\/scalable\/apps\/ndd.svg/Icon=notepad--/g" -i com.hmja.notepad.desktop
    install -Dm644 com.hmja.notepad.desktop "${pkgdir}/usr/share/applications/Notepad--.desktop"
    cd "${srcdir}/opt/apps/com.hmja.notepad/entries/icons/hicolor/scalable/apps"
    install -Dm644 ndd.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" 
    install -Dm644 ndd.svg ${pkgdir}/usr/share/pixmaps/notepad--.svg
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
