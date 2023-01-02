# Maintainer: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-git
pkgver=r14302.gbe828e6cf
pkgrel=1
epoch=1
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(gtk3 wxwidgets-gtk3 libid3tag lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio jack)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg nasm chrpath python portmidi)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(tenacity)
conflicts=(tenacity)
source=("git+https://codeberg.org/tenacityteam/tenacity.git")
sha256sums=('SKIP')

pkgver() {
  cd tenacity
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd tenacity/images/icons
  for i in *; do # fix for png icons not following hicolor category folders
    cd $i
    mkdir -p apps
    test -f tenacity.png && mv tenacity.png apps
    cd ..
  done
  cd ../..
  mkdir -p build
}

build() {
  cd tenacity/build
  CC=clang CXX=clang++ cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -Wno-dev \
    ..
  cmake --build .
  make .
}

package() {
  cd tenacity/build
  make DESTDIR="${pkgdir}" install
  test -f ${pkgdir}/usr/audacity && rm ${pkgdir}/usr/audacity # remove unused launch script

  mv "${pkgdir}/usr/share/mime/packages/audacity.xml" \
     "${pkgdir}/usr/share/mime/packages/tenacity.xml"

  mv "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-audacity-project.xpm" \
     "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm"

  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-basic-ui.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-components.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-exceptions.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-ffmpeg-support.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-files.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-math.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-preferences.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-registries.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-xml.so"
}
