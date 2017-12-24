# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare-git
pkgver=1.5.0.r338.g5db4cf2
pkgrel=1
pkgdesc="Quick, simple but powerful Cross Platform image editor."
arch=('i686' 'x86_64')
url="http://photoflare.io/"
license=('GPL3')
depends=('desktop-file-utils' 'graphicsmagick' 'qt5-base')
makedepends=('git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
replaces=('photofiltrelx')
source=("git+https://github.com/PhotoFlare/photoflare.git"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            'b8d8a66f80b744efbd4bd30126dcce4c791662fbd831549d908aa047136240fb')

pkgver() {
  cd "${pkgname%-*}"
  ver="$(grep 'Version' src/main.cpp | awk -F '"' '{print $2}')"
  printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i '1 s/^/#/' "${pkgname%-*}"/PhotoFlare.pro
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PhotoFlare.pro
  make
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 PhotoFlare "$pkgdir/usr/bin/PhotoFlare"
  install -Dm644 ../photoflare.desktop "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
  install -Dm644 pixmaps/logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"
}
