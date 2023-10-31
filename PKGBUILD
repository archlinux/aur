# Maintainer:       Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer:    zzjzxq33 <wojiushixxx at 126 dot com>
pkgname=bbg-git
_pkgname=${pkgname%-git}
pkgver=20231016.r6.9e9ae1d
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
depends=('electron')
makedepends=('git' 'npm' 'yarn' 'asar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    'icon.png'::'https://github.com/bbg-contributors/bbg-resources/raw/main/icon.png'
    "${_pkgname}::git+${url}.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    git submodule update --init --recursive

    # https://github.com/bbg-contributors/bbg/blob/c6f3cff622d45dac06d5ec25266e4c68e34e5bae/App/start.js#L274-L278
    touch App/is_aur_build
}

build() {
    cd "$srcdir/${_pkgname}"
    yarn install
    asar pack . app.asar
    mv app.asar ../"app-${pkgver}.asar"
}

package() {
    cd "$srcdir"
    install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/lib/${_pkgname}/app.asar"
    install -Dm644 icon.png "${pkgdir}/usr/share/icons/${_pkgname}.png"
    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${_pkgname} << EOF
#!/bin/sh

exec electron /usr/lib/bbg/app.asar "\$@"
EOF
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Name=bbg
Comment=blog generator
Keywords=
Exec=/usr/bin/bbg
TryExec=
Terminal=false
Icon=/usr/share/icons/bbg.png
Type=Application
StartupNotify=false
Categories=Office
EOF
}
