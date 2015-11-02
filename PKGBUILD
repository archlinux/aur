# Maintainer: William Penton <william@penton.us> -> https://github.com/thenexxuz

pkgname=sneedacity
pkgver=3.0.2.r71.g0cb639c92
pkgrel=1
pkgdesc="Sneedacity (formerly Audacity) is a program that lets you manipulate digital audio waveforms"
arch=(i686 x86_64)
url="https://github.com/Sneeds-Feed-and-Seed/sneedacity/"
license=(GPL2)
groups=(pro-audio)
depends=(alsa-lib libx11 gtk3 expat libid3tag libogg libsndfile
         libvorbis lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr soundtouch)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg jack nasm conan)
# can't find system lame portmidi
optdepends=('ffmpeg: additional import/export capabilities')
provides=(sneedacity)
replaces=(audacity)
conflicts=(audacity)
source=(
  "git+https://github.com/Sneeds-Feed-and-Seed/sneedacity.git"
  "sneedacity.patch"
)
sha256sums=('SKIP'
            '6a1e16d7fd72cfffed920fb8318ddc1d544fcde4c4a23811cef807d4058f1b64')

pkgver() {
  cd sneedacity
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare() {
  cd sneedacity
  patch --forward --strip=1 --input="${srcdir}/sneedacity.patch"
}

build() {
  mkdir sneedacity/build
  cd sneedacity/build
  CC=clang cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk3 \
    -Dsneedacity_use_wxwidgets=local \
    sneedacity_use_ffmpeg:STRING=loaded \
    ..
  cmake --build .
  make .
}

package() {
  cd sneedacity/build
  make DESTDIR="${pkgdir}" install
}
