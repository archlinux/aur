# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-wxgtk3-git
pkgver=r14126.gef91e7c8d
pkgrel=5
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity - repo wxgtk3"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(wxwidgets-gtk3 wxwidgets-common libid3tag lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio portmidi lame jack libsbsms)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg4.4 nasm chrpath python)
optdepends=('ffmpeg4.4: additional import/export capabilities')
provides=(tenacity)
conflicts=(tenacity)
source=("git+https://codeberg.org/tenacityteam/tenacity.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/tenacity
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/tenacity/images/icons
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
  cd $srcdir/tenacity/build
  export WX_CONFIG=/usr/bin/wx-config
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  CC=clang CXX=clang++ cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DwxWidgets_LIBRARIES=/usr/lib \
    -DwxWidgets_INCLUDE_DIRS=/usr/include/wx-3.2 \
    -Wno-dev \
    ..
  cmake --build .
  make .
}

package() {
  cd $srcdir/tenacity/build
  make DESTDIR="${pkgdir}" install
  test -f ${pkgdir}/usr/tenacity && rm ${pkgdir}/usr/tenacity # remove unused launch script
  test -f ${pkgdir}/usr/audacity && rm ${pkgdir}/usr/audacity # remove unused launch script

  mv "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-audacity-project.xpm" \
     "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm"

  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-strings.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-string-utils.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-utility.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/modules/mod-script-pipe.so"
}
