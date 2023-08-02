# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity
pkgver=1.3.1
pkgrel=1
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(gcc-libs glibc flac gtk3 wxwidgets-gtk3 wxwidgets-common libid3tag lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio jack portmidi libebml libmatroska)
makedepends=(cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg nasm chrpath python)
optdepends=('ffmpeg: additional import/export capabilities')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/tenacityteam/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('2094a2945138063d7164d4498d9c48241ac5c88dd2a78d536ad12d5f73dc2538b469f89ec0b2a4773f74fc5d38d1f5976d3d5b5132bae48f7f842ebec794b5b9')

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
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
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
  test -f ${pkgdir}/usr/tenacity && rm ${pkgdir}/usr/tenacity # remove unused launch script

  mv "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-audacity-project.xpm" \
     "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm"

  chrpath --delete "${pkgdir}"/usr/lib/tenacity/*.so
  chrpath --delete "${pkgdir}"/usr/lib/tenacity/modules/*.so
}
