# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=supersonic-desktop-wayland
pkgver=0.10.0
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic and Jellyfin music servers."
_pkgname="${pkgname//-desktop-wayland/}"
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
depends=('glibc'
         'libglvnd'
         'libx11'
         'mpv')
optdepends=('libappindicator-gtk3: Systray indicator support'
            'org.freedesktop.secrets: Keyring password store support')
makedepends=('go>=1.17')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c97c77fe831c0945122a4ab4c57abc7f0fc911bdf5c787499cafe55f07291791')

build() {
    export GOPATH="$srcdir"/gopath

    cd "$srcdir/${_pkgname}-${pkgver}"

    go build -mod=readonly -modcacherw -tags=wayland .
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    _output="${srcdir}/${_pkgname}-${pkgver}"

    install -Dm755 "${_output}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-wayland}"
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/res/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-wayland}.png"
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/res/${pkgname%-wayland}.desktop" "$pkgdir/usr/share/applications/${pkgname%-wayland}.desktop"
}
