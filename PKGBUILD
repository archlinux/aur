# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=supersonic-desktop
pkgver=0.18.0
pkgrel=1
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
    'libxinerama'
    'libxi'
)
optdepends=(
    "libappindicator-gtk3: Systray indicator support"
    "org.freedesktop.secrets: Keyring password store support"
)
makedepends=('go>=1.17')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    "9b6c5d177be77ef165f6a286d13c00d497488f44c503d83bf1bdb75b51373a5b"
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
