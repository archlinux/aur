# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-wxgtk3-git
pkgver=r13942.g91f8b4340
pkgrel=3
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity - stable wxgtk3"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(wxwidgets-gtk3 libid3tag lilv portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio portmidi lame jack sdl2 glibc)
makedepends=(git cmake clang libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg4.4 nasm chrpath expat gcc-libs gdk-pixbuf2
             flac libogg libsndfile libvorbis ffmpeg)
optdepends=('ffmpeg4.4: additional import/export capabilities')
provides=(tenacity)
conflicts=(tenacity)
source=("git+https://github.com/tenacityteam/tenacity"
        wxwidgets-gtk3-3.1.6-plus.patch)
sha256sums=('SKIP'
            '13cafd71700a4c8802fab3d8dc7dfbfa7a612124bfaf3dddf1bfef98ee609591')

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
  patch -tp1 <../wxwidgets-gtk3-3.1.6-plus.patch
  mkdir -p build
}

build() {
  cd tenacity/build
  export WX_CONFIG=/usr/bin/wx-config
  CC=clang CXX=clang++ cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWX_CONFIG=/usr/bin/wx-config \
    -Daudacity_use_ffmpeg:STRING=loaded \
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
