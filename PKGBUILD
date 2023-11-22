# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity
pkgver=1.3.3
_vcpkg_commit=4db549d1960563b4999b70303dd58d97ff55d5c3
_nyquist_commit=3678ee6bfff9e0edc721a1b8865ab625e40f9ce4
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
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/tenacityteam/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname-vcpkg-$_vcpkg_commit.tar.gz::https://codeberg.org/tenacityteam/vcpkg/archive/$_vcpkg_commit.tar.gz"
        "$pkgname-libnyquist-$_nyquist_commit.tar.gz::https://codeberg.org/tenacityteam/libnyquist/archive/$_nyquist_commit.tar.gz")
b2sums=('176fd7d62a864851576c6273cd6704a897dfd0a925266c02cd98ce2b1d981e5b8bad66f0b7124284329131c5c988b36cec23c2434f8e24b72ca6ded50bb18c07'
        '0b51356a0ead658c766d2294dfe19fb47d96eb1fbc3b749b0b229782e8625bd01ef2dedd8024dd4a1a33052d5f859caba410854f30642737715c3ebfa4d8ce92'
        '8c1e0fef8c243ec6c649f8481f764394c147d93abae2828812e53f949035cb79e8f8c7966adef9d70c0991108637b81811b42eb189c7a5cf5f4ec8c4f0dd695f')

prepare() {
  mv libnyquist tenacity/lib-src/
  mv vcpkg tenacity/

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
