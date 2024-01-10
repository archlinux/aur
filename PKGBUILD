# Maintainer: taotieren <admin@taotieren.com>

pkgname=chordnova-git
pkgver=3.0.2021.r13.ga858152
pkgrel=0
pkgdesc="ChordNova is a powerful open-source chord progression analysis plus generation software for multiple operating systems."
arch=(
    aarch64
    riscv64
    x86_64)
url="https://github.com/Chen-and-Sim/ChordNova"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    qt5-base
)
makedepends=(git qt5-tools)
backup=()
options=('!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/main"
    sed -i -e 's|/opt/$${TARGET}|/usr/share/chordnova|g' ChordNova.pro
    qmake-qt5 ChordNova.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}/main"
    make INSTALL_ROOT="${pkgdir}" install

    install -Dm0644 "${srcdir}/${pkgname}/attachments/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"

    install -dm0755 "${pkgdir}/usr/share/${pkgname%-git}"
    cd "${srcdir}/${pkgname}/attachments"
    cp -rva presets "${pkgdir}/usr/share/${pkgname%-git}"
    cp -rva icons "${pkgdir}/usr/share/${pkgname%-git}/bin"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/bin/env bash

cd /usr/share/${pkgname%-git}/bin
./ChordNova \$@
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.gitub.chen-and-sim.${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=ChordNova
Nmae[zh_CN]=智弦
Comment=ChordNova - Beyond boundaries!
Comment=智弦 - 和声生成神器！
Categories=Electronics;Music;

Icon=${pkgname%-git}.png
Exec=${pkgname%-git}
Terminal=false
EOF
}
