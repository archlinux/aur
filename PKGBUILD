# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-wxgtk3-git
pkgver=r13926.g0665614b8
pkgrel=1
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity - stable wxgtk3"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(wxgtk3 libid3tag lilv portsmf suil libmad twolame vamp-plugin-sdk libsoxr
         soundtouch portaudio portmidi lame jack sdl2)
makedepends=(git cmake clang libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg4.4 nasm chrpath expat gcc-libs gdk-pixbuf2 glibc
             flac libogg libsndfile libvorbis ffmpeg)
optdepends=('ffmpeg4.4: additional import/export capabilities')
provides=(tenacity)
conflicts=(tenacity)
source=("git+https://git.sr.ht/~tenacity/tenacity")
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
  export WX_CONFIG=/usr/bin/wx-config-gtk3
  CC=clang CXX=clang++ cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWX_CONFIG=/usr/bin/wx-config-gtk3 \
    audacity_use_ffmpeg:STRING=loaded \
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
