# Maintainer: taotieren <admin@taotieren.com>

pkgname=freerouting-zh-cn
pkgver=1.5.0
pkgrel=1
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://gitee.com/YaJs666/freerouting-chinese-version"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
makedepends=('git' 'java-runtime')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    git checkout  c003954
    chmod +x gradlew
    ./gradlew assemble
}

package() {
    cd "${pkgname}"
    install -Dm644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable-zh-cn.jar"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/usr/bin/bash

java -jar /usr/lib/freerouting/freerouting-executable-zh-cn.jar "\$@"

exit 0

EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=${pkgname}
Name[zh_CN]=自动布线器中文版
Comment=${pkgdesc}
Exec=${pkgname}
Type=Application
StartupNotify=true
Categories=Tool;
Terminal=false
Icon=
Version=${pkgver}
EOF
}
