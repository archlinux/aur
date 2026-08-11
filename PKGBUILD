# Maintainer: exu <aur _a_ frm01 _d_ net>
# Contributor: Dušan Mitrović <dusan@dusanmitrovic.xyz>

pkgname=supersonic-desktop
pkgver=0.22.1
pkgrel=1
pkgdesc="A lightweight cross-platform desktop client for Subsonic music servers"
_pkgname="${pkgname//-desktop/}"
arch=('x86_64')
url="https://github.com/supersonic-app/supersonic"
license=('GPL3')
depends=('glibc'
  'libglvnd'
  'libx11'
  'mpv'
  'libxinerama'
  'libxi')
optdepends=("libappindicator-gtk3: Systray indicator support"
  "org.freedesktop.secrets: Keyring password store support")
makedepends=('go>=1.17')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7d4d6012d7354373b69609ce55acd7933406363ba13802f756a2713b19f9c599")

build() {
  export GOPATH="$srcdir"/gopath

  pushd "$srcdir/${_pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw .

  popd
}

package() {
  pushd "$srcdir/${_pkgname}-${pkgver}"

  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-wayland}"
  install -Dm644 "./res/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-wayland}.png"
  install -Dm644 "./res/${pkgname%-wayland}.desktop" "$pkgdir/usr/share/applications/${pkgname%-wayland}.desktop"

  popd
}
