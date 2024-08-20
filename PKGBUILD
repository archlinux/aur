# Maintainer: Dušan Mitrović <dusan@dusanmitrovic.xyz>
pkgname=supersonic-desktop
pkgver=0.13.1
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
    "80fa4b34b41be73dffd330656f10803515ce3cd662c9c72c66208963cbbb8b4a"
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
