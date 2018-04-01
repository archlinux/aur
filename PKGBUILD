# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare-git
pkgver=1.5.2.r8.g4659b28
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
source=("git+https://github.com/PhotoFlare/photoflare.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 installers/deb/DEBIAN/usr/share/applications/photoflare.desktop \
    "$pkgdir/usr/share/applications/photoflare.desktop"
  sed -i 's|Icon=PhotoFlare|Icon=/usr/share/pixmaps/PhotoFlare.png|' "$pkgdir/usr/share/applications/photoflare.desktop"
  install -Dm644 assets/pixmaps/logo.png "$pkgdir/usr/share/pixmaps/PhotoFlare.png"
}
