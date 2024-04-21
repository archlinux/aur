# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=supersonic-desktop-wayland
pkgver=0.10.1
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
sha256sums=('b59b2841f508d6be7f3695a468c8de41f0d78987ef920b206574169b706a98d9')

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
