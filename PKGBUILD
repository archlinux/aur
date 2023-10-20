# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity
pkgver=1.3.2
_nyquist_commit=3678ee6bfff9e0edc721a1b8865ab625e40f9ce4
pkgrel=2
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
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/tenacityteam/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-libnyquist-$_nyquist_commit.tar.gz::https://codeberg.org/tenacityteam/libnyquist/archive/$_nyquist_commit.tar.gz")
b2sums=('ac84043ac48bd6113747ba4b26ecde08c2830ca9f62c0348cf35e9990ce98da587fed2de3ea756f7e01f6fee02540a297546f2ac28a119d5913e4c393982f623'
        '8c1e0fef8c243ec6c649f8481f764394c147d93abae2828812e53f949035cb79e8f8c7966adef9d70c0991108637b81811b42eb189c7a5cf5f4ec8c4f0dd695f')

prepare() {
  mv libnyquist tenacity/lib-src/

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
