# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=skympc-git
pkgver=1.6.5.0.r150.g1ba975a
pkgrel=1
pkgdesc="A simple MPD (Music Player Daemon) client, powerd by Qt"
arch=('x86_64')
url="http://www.soramimi.jp/skympc/index.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'mpd' 'qt5-svg')
makedepends=('git' 'ruby')
provides=('skympc')
conflicts=('skympc')
source=("git+https://github.com/soramimi/SkyMPC.git")
sha256sums=('SKIP')

pkgver() {
  cd SkyMPC
  a=$(grep 'version_a =' version.rb | awk '{print $3}')
  b=$(grep 'version_b =' version.rb | awk '{print $3}')
  c=$(grep 'version_c =' version.rb | awk '{print $3}')
  d=$(grep 'version_d =' version.rb | awk '{print $3}')
  printf "%s.r%s.g%s" "$a"."$b"."$c"."$d" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd SkyMPC
  qmake-qt5 SkyMPC.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd SkyMPC
  install -Dm755 _bin/SkyMPC "${pkgdir}/usr/bin/SkyMPC"
  install -Dm644 image/appicon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/SkyMPC.svg"
  install -Dm644 image/appicon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/SkyMPC.png"
  install -Dm644 LinuxDesktop/SkyMPC.desktop "${pkgdir}/usr/share/applications/SkyMPC.desktop"
  sed -i 's|Exec=/opt/SkyMPC/SkyMPC|Exec=SkyMPC|' "${pkgdir}/usr/share/applications/SkyMPC.desktop"
  sed -i 's|Icon=/opt/SkyMPC/SkyMPC.svg|Icon=SkyMPC|' "${pkgdir}/usr/share/applications/SkyMPC.desktop"
  echo 'Categories=Qt;AudioVideo;Audio;Player;' >> "${pkgdir}/usr/share/applications/SkyMPC.desktop"
}
