# Maintainer: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-git
pkgver=r13941.g9b4b96d98
pkgrel=1
epoch=1
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(gtk3 wxgtk3-3.1.5 libid3tag lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio portmidi lame jack)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg4.4 nasm chrpath)
optdepends=('ffmpeg4.4: additional import/export capabilities')
provides=(tenacity)
conflicts=(tenacity)
source=("git+https://github.com/tenacityteam/tenacity.git")
sha256sums=('SKIP')

pkgver() {
  cd tenacity
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

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
    -DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-3.1.5/bin/wx-config-gtk3 \
    -DwxWidgets_INCLUDE_DIRS=/opt/wxgtk-3.1.5/include/wx-3.1 \
    -DwxWidgets_LIBRARIES=/opt/wxgtk-3.1.5/lib \
    -Daudacity_use_ffmpeg:STRING=loaded \
    -Wno-dev \
    ..
  cmake --build .
  make .
}

package() {
  cd tenacity/build
  make DESTDIR="${pkgdir}" install
  test -f ${pkgdir}/usr/tenacity && rm ${pkgdir}/usr/tenacity # remove unused launch script

  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-strings.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-string-utils.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/lib-utility.so"
  chrpath --delete "${pkgdir}/usr/lib/tenacity/modules/mod-script-pipe.so"
}
