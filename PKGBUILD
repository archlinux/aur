# Maintainer: Myt1 <MYT1 @ qq.com>
# Maintainer: littzhch <2371050115@qq.com>

pkgname=notepad---bin
pkgver=2.20.0.0
_pkgver="v2.20"
pkgrel=1
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
source=("https://gitee.com/mao-yaotang/mmszahuo/raw/master/com.hmja.notepad_2.20.0.0_amd64.deb"
"${url}/raw/master/LICENSE")
sha256sums=('11add1f426e4e445514d204e1472b05151e1afc87cebe29f0338ae3c1b9f4a82'
            '0b383d5a63da644f628d99c33976ea6487ed89aaa59f0b3257992deac1171e6b')
options=("!strip")

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.xz
    cd opt/apps/com.hmja.notepad/files
    strip lib*
    strip plugin/lib*
    patchelf Notepad-- --set-rpath /usr/lib/notepad--
    patchelf plugin/lib* --replace-needed libqmyedit_qt5.so.15 /usr/lib/notepad--/libqmyedit_qt5.so.15
    echo "#!/bin/sh
/usr/lib/notepad--/Notepad-- \$@" > notepad--
}

pkgver(){
	cd "${srcdir}/opt/apps/com.hmja.notepad"
	cat info | grep '"version"' | sed 's/[^0-9.]*//g'
}


package() {
    cd "${srcdir}/opt/apps/com.hmja.notepad/files"
    install -Dm755 "notepad--" "${pkgdir}/usr/bin/notepad--"
    install -Dm755 "Notepad--" "${pkgdir}/usr/lib/notepad--/Notepad--"
    install -Dm755 "libqmyedit_qt5.so.15" "${pkgdir}/usr/lib/notepad--/libqmyedit_qt5.so.15"
    cp -r plugin "${pkgdir}/usr/lib/notepad--/"
    cp -r themes "${pkgdir}/usr/lib/notepad--/"

    cd "${srcdir}/opt/apps/com.hmja.notepad/entries"
    sed "s/\/opt\/apps\/com.hmja.notepad\/entries/\/usr\/share/g" -i applications/com.hmja.notepad.desktop
    sed "s/\/opt\/apps\/com.hmja.notepad\/files\/Notepad/\/usr\/bin\/notepad/g" -i applications/com.hmja.notepad.desktop
    sed "s/Categories=TextEditor;/Categories=TextEditor;Development;Utility;/g" -i applications/com.hmja.notepad.desktop
    sed "s/Exec=\/usr\/bin\/notepad-- %U/Exec=env QT_SCALE_FACTOR=1.15 notepad-- %U/g" -i applications/com.hmja.notepad.desktop
    sed "s/Icon=\/usr\/share\/icons\/hicolor\/scalable\/apps\/ndd.svg/Icon=notepad--/g" -i applications/com.hmja.notepad.desktop
    install -Dm644 applications/com.hmja.notepad.desktop "${pkgdir}/usr/share/applications/notepad--.desktop"
    cp -r icons "${pkgdir}/usr/share/" 
    cd ${pkgdir}/usr/share/icons/hicolor/scalable/apps
    mv ndd.svg notepad--.svg
    install -Dm644 notepad--.svg ${pkgdir}/usr/share/pixmaps/notepad--.svg
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
