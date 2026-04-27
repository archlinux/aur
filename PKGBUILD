# Maintainer: taotieren <admin@taotieren.com>

pkgname=freerouting-zh-cn-git
pkgver=2.2.0.r0.g6688a42
pkgrel=1
_jrever=25
_jdkver=25
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    sh
    "java-runtime=${_jrever}"
)
makedepends=(
    'git' 
    "java-environment-openjdk=${_jdkver}")
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
    cd "${srcdir}/${pkgname%-git}"
    export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
    #     chmod +x gradlew
    ./gradlew assemble
    #     ./gradlew dist
}

package() {
    cd "${pkgname%-git}"
    install -Dm0644 assets/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm0644 build/libs/freerouting.jar "${pkgdir}/usr/lib/freerouting/freerouting-zh-cn.jar"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/usr/bin/bash
export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin/:\$PATH"

java -jar /usr/lib/freerouting/freerouting-zh-cn.jar -l zh "\$@"

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
