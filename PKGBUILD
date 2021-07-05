# Maintainer: Vasiliy Stelmachenok <cabopust@yandex.ru>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audiocity-git
_gitname=audiocity
pkgver=3.0.2.r53.g8b90a1596
pkgrel=2
pkgdesc="Audacity fork without any non-free software or telemetry, as all GPL software should (git-version)"
arch=(i686 x86_64)
url="https://github.com/Binaergewitter/audiocity"
license=(GPL2)
groups=(pro-audio)
depends=(alsa-lib libx11 gtk3 expat libid3tag libogg libsndfile libvorbis
         lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr soundtouch)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg jack nasm conan)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(audacity audacity-git audiocity)
conflicts=(audacity audacity-git audiocity)
source=(
  "git+https://github.com/Binaergewitter/${_gitname}.git"
  "audacity.patch"
)

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare() {
  cd ${_gitname}
  patch --forward --strip=1 --input="../audacity.patch"
}

build() {
  mkdir ${_gitname}/build
  cd ${_gitname}/build
  CC=clang cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk3 \
    -Daudacity_use_wxwidgets=local \
    audacity_use_ffmpeg:STRING=loaded \
    ..
  cmake --build .
  make .
}

package() {
  cd ${_gitname}/build
  make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP'
            'c06c60a9ae17b9265840fcd619d2c7a5668f26a94cec80c8785c7997afd4bc96')
