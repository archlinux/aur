# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=supersonic-desktop-wayland
pkgver=0.18.1
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
provides=('supersonic-desktop')
conflicts=('supersonic-desktop')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('abd2bcad8f3050d8fb6b236237cee35da87964e4b8f50a282195cc9f5e65b68c')

build() {
  export GOPATH="$srcdir"/gopath

  pushd "$srcdir/${_pkgname}-${pkgver}"

  go build -mod=readonly -modcacherw -tags=wayland .

  popd
}

package() {
  pushd "$srcdir/${_pkgname}-${pkgver}"

  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-wayland}"
  install -Dm644 "./res/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-wayland}.png"
  install -Dm644 "./res/${pkgname%-wayland}.desktop" "$pkgdir/usr/share/applications/${pkgname%-wayland}.desktop"

  popd
}
