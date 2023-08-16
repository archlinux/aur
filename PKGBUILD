# Maintainer: taotieren <admin@taotieren.com>

_pkgname=RTools
pkgname=rtools-git
pkgver=1.0.0.r32.g9dd42ad
pkgrel=1
pkgdesc="RTools(米饭工具集)是开发工具集桌面悬浮窗软件，每一个子功能如同一颗米粒组成一碗米饭。"
arch=('x86_64' 'aarch64')
url="https://gitee.com/RiceChen0/rtools"
license=('Apache-2.0')
provides=(${_pkgname})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('qt5-charts' 'qt5-serialport' 'qt5-networkauth' 'qt5-mqtt')
makedepends=('qt5-tools' 'git')
optdepends=('jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
backup=()
options=('!strip')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/^RTOOL_Release_v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    sed -i "s|JLinkARM.dll|/opt/SEGGER/JLink/libjlinkarm.so|g" "$srcdir"/${pkgname%-git}/${_pkgname}/PageView/JlinkTool/jlinktool.cpp
#     sed -i 's|\\|/|g' "$srcdir"/${pkgname%-git}/${_pkgname}/rtools.ui
}

build() {
    cd "${srcdir}/${pkgname%-git}/${_pkgname}/"
    qmake
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/${_pkgname}/"
    install -Dm0755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 resource/image/iconfont/iconfont.ttf -t "${pkgdir}"/usr/share/fonts/TTF/

    install -Dm644 /dev/stdin "${pkgdir}"/usr/share/applications/com.gitee.ricechen0.rtools.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=RTools
Comment=RTools
Categories=Development;Electronics;

Icon=rtools
Exec=rtools
Terminal=false
EOF
    install -Dm644 /dev/stdin "${pkgdir}"/usr/share/metainfo/com.gitee.ricechen0.rtools.metainfo.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.gitee.ricechen0.rtools</id>

  <name>RTools</name>
  <summary>RTools</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>Apache-2.0</project_license>

  <description>
    <p>
      RTools(米饭工具集)是开发工具集桌面悬浮窗软件，每一个子功能如同一颗米粒组成一碗米饭。
    </p>
  </description>

  <launchable type="desktop-id">com.gitee.ricechen0.rtools.desktop</launchable>
</component>
EOF
    install -Dm644 "$srcdir/${pkgname%-git}/${_pkgname}"/resource/image/logo.png "${pkgdir}"/usr/share/pixmaps/rtools.png
}
