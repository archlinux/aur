# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=supersonic-desktop
pkgver=0.4.0
pkgrel=2
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers"
_pkgname="${pkgname//-desktop/}"
arch=('x86_64')
url="https://github.com/dweymouth/supersonic"
license=('GPL3')
depends=(
    'glibc'
    'libglvnd'
    'libx11'
    'mpv'
)
optdepends=(
    "libappindicator-gtk3: Systray indicator support"
    "org.freedesktop.secrets: Keyring password store support"
)
provides=('supersonic-desktop')
conflicts=('supersonic-desktop')
makedepends=('go>=1.17')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/dweymouth/supersonic/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '7b84a1586745ee8790cb5719188f9934e2ad22a4256bd623b888aad8fda61e05'
)

build() {
  export GOPATH="$srcdir"/gopath

  cd "$srcdir/${_pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw .
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  _output="${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "${_output}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/res/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/res/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
