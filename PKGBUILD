# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=skympc-git
pkgver=r123.8bd5664
pkgrel=1
pkgdesc="A simple MPD (Music Player Daemon) client, powerd by Qt"
arch=('i686' 'x86_64')
url="http://www.soramimi.jp/skympc/index.html"
license=('GPL3')
depends=('mpd' 'qt5-svg')
makedepends=('git' 'ruby')
provides=('skympc')
conflicts=('skympc')
source=("git+https://github.com/soramimi/SkyMPC.git")
md5sums=('SKIP')

pkgver() {
  cd SkyMPC
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd SkyMPC
  ruby prepare.rb
}

build() {
  cd SkyMPC
  qmake-qt5
  make
}

package() {
  cd SkyMPC
  install -Dm755 SkyMPC "${pkgdir}/usr/bin/SkyMPC"
  install -Dm644 SkyMPC.svg "${pkgdir}/usr/share/pixmaps/SkyMPC.svg"
  install -Dm644 LinuxDesktop/SkyMPC.desktop "${pkgdir}/usr/share/applications/SkyMPC.desktop"
  sed -i 's|Exec=/opt/SkyMPC|Exec=/usr/bin|' "${pkgdir}/usr/share/applications/SkyMPC.desktop"
  sed -i 's|Icon=/opt/SkyMPC|Icon=/usr/share/pixmaps|' "${pkgdir}/usr/share/applications/SkyMPC.desktop"
}
