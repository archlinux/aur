# Maintainer: taotieren <admin@taotieren.com>

pkgname=freerouting-zh-cn-git
pkgver=1.5.0.r1.gc185fc4
pkgrel=1
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=()
makedepends=('git' 'java-runtime>=11' 'gradle')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
# don't forget to set active JDK to 11 version before running makepkg:
# sudo archlinux-java set java-11-openjdk

    cd "${srcdir}/${pkgname%-git}"
#     chmod +x gradlew
    bash gradlew assemble
}

package() {
    cd "${pkgname%-git}"
    install -Dm0644 design/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm0644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable-zh-cn.jar"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/usr/bin/bash

java -jar /usr/lib/freerouting/freerouting-executable-zh-cn.jar -l zh "\$@"

exit 0

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-git}
Name[zh_CN]=自动布线器中文版
Comment=${pkgdesc}
Exec=${pkgname%-git}
Type=Application
StartupNotify=true
Categories=Tool;Electron;PCB;
Terminal=false
Icon=${pkgname%-git}.png
Version=${pkgver}
EOF
}
