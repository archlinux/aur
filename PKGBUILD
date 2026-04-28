# Maintainer: taotieren <admin@taotieren.com>

pkgname=freerouting-zh-cn-git
pkgver=2.2.0.r0.g6688a42
pkgrel=3
_jrever=25
_jdkver=25
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
provides=(${pkgname%-git} ${pkgname%-zh-cn-git})
conflicts=(${pkgname%-git} ${pkgname%-zh-cn-git})
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
    install -vDm0644 assets/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/pixmaps/${pkgname%-zh-cn-git}.png"
    install -vDm0755 build/libs/freerouting.jar -t "${pkgdir}/usr/lib/freerouting/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-zh-cn-git}" <<EOF
#!/usr/bin/bash
export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin/:\$PATH"

java -jar /usr/lib/freerouting/${pkgname%-zh-cn-git}.jar -l zh "\$@"

exit 0

EOF

    install -vDm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-zh-cn-git}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=${pkgname%-zh-cn-git}
Name[zh_CN]=自动布线器中文版
Comment=${pkgdesc}
Exec=${pkgname%-zh-cn-git}
Type=Application
StartupNotify=true
Categories=Tool;Electron;PCB;
Terminal=false
Icon=${pkgname%-zh-cn-git}.png
Version=${pkgver}
EOF
}
