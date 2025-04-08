# Maintainer: taotieren <admin@taotieren.com>

pkgname=ma35d1-nuwriter-git
pkgver=1.01.r0.g67de851
pkgrel=1
epoch=
pkgdesc="MA35D1 NuWriter"
arch=($CARCH)
url="https://gitee.com/OpenNuvoton/MA35D1_NuWriter"
license=('GPL3-Only')
groups=()
depends=('python-pyusb' 'python' 'python-crcmod' 'python-pyqt5')
makedepends=("git")
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
source=("${pkgname%-git}::git+${url}.git"
    "${pkgname}.install")
noextract=()
sha256sums=('SKIP'
    '940f09c5609e8a78c600078ddab945c403216c186601830c128a854757de8a89')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/gui/images/NuWriter.ico" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.ico"
    cp -ra ${srcdir}/${pkgname%-git}/ "${pkgdir}/usr/share/"
    rm -rf "${pkgdir}/usr/share/${pkgname%-git}/.git"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/bin/bash

if [ ! -d "$HOME"/.local/share/${pkgname%-git} ] ; then
    mkdir -p "$HOME"/.local/share/${pkgname%-git} || exit 1
    cp -ra /usr/share/${pkgname%-git} "$HOME"/.local/share/ || exit 1
fi

python "$HOME"/.local/share/${pkgname%-git}/nuwriter.py "\$@"
EOF
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}-ui" <<EOF
#!/bin/bash

if [ ! -d "$HOME"/.local/share/${pkgname%-git} ] ; then
    mkdir -p "$HOME"/.local/share/${pkgname%-git} || exit 1
    cp -ra /usr/share/${pkgname%-git} "$HOME"/.local/share/ || exit 1
fi

python "$HOME"/.local/share/${pkgname%-git}/nuwriterUI.py "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}-ui.desktop" <<EOF
[Desktop Entry]
Name=${pkgname%-git}-ui
Name[zh_CN]=${pkgname%-git}-ui
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-git}-ui;
Exec=${pkgname%-git}-ui %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-git}.ico
Version=${pkgver}
EOF

}
