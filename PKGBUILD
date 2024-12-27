# Maintainer: taotieren <admin@taotieren.com>

pkgname=protocol-tool-git
_pkgname=ProtocolTool
pkgver=r3.6a21a5a
pkgrel=1
pkgdesc="一款可配置的协议解析工具"
arch=($CARCH)
url="https://gitee.com/mzy2364/protocol-tool"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    qt5-base
    qt5-script
)
makedepends=('git' 'qt5-tools')
backup=()
options=('!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd ${srcdir}/${pkgname}/
    qmake ${_pkgname}.pro
    make
}

package() {
    install -dm755 "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/${pkgname%-git}/"

    cd ${srcdir}/${pkgname}/
    cp --preserve=mode -r ${_pkgname} default.js "${pkgdir}/usr/share/${pkgname%-git}/"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/bin/env bash

cd /usr/share/${pkgname%-git}
./${_pkgname}
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/share/applications/com.gitee.mzy2364.protocol_tool.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=protocol-tool
Comment=一款可配置的协议解析工具
Categories=Development;Qt;

Icon=protocol-tool
Exec=protocol-tool
Terminal=false

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/share/metainfo/com.gitee.mzy2364.protocol_tool.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>com.gitee.mzy2364.protocol_tool</id>

  <name>protocol-tool</name>
  <summary>一款可配置的协议解析工具</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>MIT</project_license>

  <description>
    <p>
      一款可配置的协议解析工具
    </p>
  </description>

  <launchable type="desktop-id">com.gitee.mzy2364.protocol_tool.desktop</launchable>
</component>
EOF

    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 "${srcdir}/${pkgname}/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}
