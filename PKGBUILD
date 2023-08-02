# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity
_vertag=1.3-beta3-1
pkgver=1.3b3
pkgrel=2
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(gcc-libs glibc flac gtk3 wxwidgets-gtk3 wxwidgets-common libid3tag lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio jack portmidi libebml libmatroska)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg nasm chrpath python)
optdepends=('ffmpeg: additional import/export capabilities')
source=("$pkgname-$_vertag.tar.gz::https://codeberg.org/tenacityteam/$pkgname/archive/v$_vertag.tar.gz")
b2sums=('bf8cca8ccb3a056872133ae27b9208b093858ba67a1605dd1994026da675bf7cdac1403b46a66717cdc890f97a2caea01bd836582224d3054a7f94bc64ef6cc0')

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
