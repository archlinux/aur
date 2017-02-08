# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=skympc-git
pkgver=1.6.2.r125.g776ab89
pkgrel=2
pkgdesc="A simple MPD (Music Player Daemon) client, powerd by Qt"
arch=('i686' 'x86_64')
url="http://www.soramimi.jp/skympc/index.html"
license=('GPL3')
depends=('mpd' 'qt5-svg')
makedepends=('git' 'ruby')
provides=('skympc')
conflicts=('skympc')
source=("git+https://github.com/soramimi/SkyMPC.git"
        'use-system-fonts-on-linux.patch')
sha256sums=('SKIP'
            '7c21787bbdc3882594d2cbf6bb8f74820e1a74c2527058c773bca53786a8ee79')

pkgver() {
  cd SkyMPC
  skympc_version=$(grep -oP 'SkyMPC_Version = "\K[^"]+' src/version.cpp)
  printf "%s.r%s.g%s" "$skympc_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd SkyMPC
  patch -p1 -i ../use-system-fonts-on-linux.patch
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
