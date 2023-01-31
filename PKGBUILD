# Maintainer: taotieren <admin@taotieren.com>

pkgname=notepad---git
pkgver=1.21.r10.g9ad3c32
pkgrel=1
pkgdesc="notepad--是一个国产跨平台、简单的文本编辑器，是替换notepad++的一种选择。其内置强大的代码对比功能，让你丢掉付费的beyond compare。"
arch=('any')
url="https://gitee.com/cxasm/notepad--"
license=('GPL')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(qt5-base
        )
makedepends=(git
            qt5-tools )
backup=()
options=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/src/qscint/src/"
    qmake-qt5 -makefile -o Makefile "CONFIG+=debug_and_release" qscintilla.pro
    sed -i 's|x64/Debug|x64/Release|g' Makefile.Release
    make -f Makefile.Release

    cd "${srcdir}/${pkgname}/src/"
    sed -i 's|/home/yzw/build/CCNotePad/||g' RealCompare.pro
    qmake-qt5 -makefile -o Makefile "CONFIG+=release" RealCompare.pro
    sed -i 's|-Lx64/Debug -lqmyedit_qt5d||g' Makefile
    make
}

package() {
    cd "${srcdir}/${pkgname}/src/"
    install -Dm0755 "${srcdir}/${pkgname}/src/x64/Release/Notepad--" "${pkgdir}/usr/bin/${pkgname%-git}"
#     make DESTDIR="${pkgdir}" install

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.gitee.cxasm.notepad--.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.gitee.cxasm.notepad--</id>

  <name>Notepad--</name>
  <summary>Notepad--</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      notepad--是一个国产跨平台、简单的文本编辑器，是替换notepad++的一种选择。其内置强大的代码对比功能，让你丢掉付费的beyond compare。
    </p>
  </description>

  <launchable type="desktop-id">io.gitee.cxasm.notepad--.desktop</launchable>
</component>
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.gitee.cxasm.notepad--.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=Notepad--
Comment=Notepad--
Categories=Development;

Icon=notepad--
Exec=notepad--
Terminal=false
EOF

    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
#     install -Dm0644 "$srcdir/${pkgname}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    cd macicon/mac.iconset
#     icon_128@2x.png  icon_128.png  icon_32@2x.png  icon_32.png  icon_64@2x.png  icon_64.png  txt_128x128.png
    for _icon in 32 64 128 ; do
        install -Dm0644 icon_${_icon}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-git}.png
    done
}
