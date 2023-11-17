# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=singboxclient
pkgname=$_pkgname-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross platform client for sing-box"
arch=(x86_64)
url='https://github.com/daodao97/SingBoxClient'
license=('unknown')
depends=('ayatana-ido' 'libayatana-indicator' 'libdbusmenu-glib' 'libayatana-appindicator')
makedepends=('git' 'go')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=(${_pkgname})
conflicts=(${_pkgname}-bin ${_pkgname})
source=(
    "git+https://github.com/daodao97/SingBoxClient"
    "singboxclient.desktop"
)
sha256sums=(
    "SKIP"
    "120e2ee5bf52d7c6bf8f40af5dbc8458473539a82fd77c6d00100e3d26b4d3f3"
)

pkgver() {
    cd "$srcdir/SingBoxClient"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
    cd "$srcdir/SingBoxClient"
    sed -i 's/musl/gnu/g' build.sh
    sed -i 's/open build//g' build.sh
}

build() {
    cd "${srcdir}/SingBoxClient"
    sh build.sh -p linux
}

package() {
    cd "${srcdir}/SingBoxClient"
    install -Dm755 sbox "$pkgdir/usr/bin/${_pkgname}";
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/SingBoxClient/icon/logo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
