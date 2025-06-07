# Maintainer: taotieren <admin@taotieren.com>

pkgname=freerouting-zh-cn
pkgver=2.1.0
pkgrel=1
_jrever=21
_jdkver=21
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(java-runtime=${_jrever})
makedepends=(java-environment-openjdk=${_jdkver}
    git)
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
source=("${pkgname%-zh-cn}::git+${url}.git#tag=v${pkgver}")
sha256sums=('6c3aba422b9758dca60f07e760bb12bd8d1b77370d5e1f54a648bdbe8ea3f8c5')

prepare() {
    git -C "${srcdir}/${pkgname%-zh-cn}" clean -dfx
}

build() {
    cd "${pkgname%-zh-cn}"
    export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
    ./gradlew assemble
}

package() {
    cd "${pkgname%-zh-cn}"
    install -Dm0644 design/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm0644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable-zh-cn.jar"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/bash
export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin/:\$PATH"

java -jar /usr/lib/freerouting/freerouting-executable-zh-cn.jar -l zh "\$@"

exit 0

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname}
Name[zh_CN]=自动布线器中文版
Comment=${pkgdesc}
Exec=${pkgname}
Type=Application
StartupNotify=true
Categories=Tool;Electron;PCB;
Terminal=false
Icon=${pkgname}.png
Version=${pkgver}
EOF
}
