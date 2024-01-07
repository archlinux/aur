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
pkgrel=3
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
b2sums=('89a9bc6f377f94d90f1f3556d29d12434d20beefd040dcbc4aa201b0f0c2212ced8b4532697e7437b89619b6c4e1c118a8f22f755dcdcdb134a2a9e2ec56c2b3'
        'b154af9ac2c855e4a014caafe1944c1210c8756d43a9e6125a7097f795164d183179070616b5e670a977d5ef8719db562b680ba9d2e1872bc4ddf1777938f545'
        '33ea64eaeaf588ae3c6a7ea963f95adb7f06b502d41e0d309dd51e333130bc07975503bc8c0b059d20a9f7fe09a169ee02113a2575ea0beb34a8050d8f2cca64')

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
