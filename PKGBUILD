# Maintainer: taotieren <admin@taotieren.com>

pkgname=freerouting-zh-cn-git
pkgver=2.1.0.r9.gc226a96
pkgrel=1
_jrever=21
_jdkver=21
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=("java-runtime=${_jrever}")
makedepends=('git' "java-environment-openjdk=${_jdkver}")
optdepends=(
    'eagle'
    'easyeda'
    'easyeda-pro'
    'easyeda-router'
    'lceda'
    'lceda-pro'
    'kicad'
    'pcb-rnd')
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    # don't forget to set active JDK to 21 version before running makepkg:
    # sudo archlinux-java set java-21-openjdk

    cd "${srcdir}/${pkgname%-git}"
    export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
    #     chmod +x gradlew
    ./gradlew assemble
    #     ./gradlew dist
}

package() {
    cd "${pkgname%-git}"
    install -Dm0644 design/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm0644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable-zh-cn.jar"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/usr/bin/bash
export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin/:\$PATH"

java -jar /usr/lib/freerouting/freerouting-executable-zh-cn.jar -l zh "\$@"

exit 0

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" <<EOF
[Desktop Entry]
Version=1.0
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
