# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=faustlive
pkgver=2.5.15
pkgrel=1
pkgdesc='Faust prototyping environment'
arch=(x86_64 aarch64)
url='https://github.com/grame-cncm/faustlive'
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme qt6-base)
makedepends=(alsa-lib cmake faust jack libmicrohttpd libsndfile)
source=("$pkgname-$pkgver.tar.gz::https://github.com/grame-cncm/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        'faustlive-pr-54.patch::https://github.com/grame-cncm/faustlive/pull/54.patch'
        'faustlive-pr-55.patch::https://github.com/grame-cncm/faustlive/pull/55.patch')
sha256sums=('5ba5af7b19fa050cb8ccb1d6b3875af4907dfef62b810e171d6467641d6b944c'
            '3bd6054a3592159a3fda6905e3b55db35337167c112f947446a5981b40693504'
            'cba20f34a18aef76baa83bf3a11f534dc5026fbbac7b9524ae9cb8e7bcdd6ef3')

prepare() {
  # use libraries from faust package instead of submodule
  cd $pkgname-$pkgver
  rm -r Resources/Libs
  ln -s /usr/share/faust Resources/Libs
  patch -p1 -N -r - -i "$srcdir"/faustlive-pr-54.patch
  patch -p1 -N -r - -i "$srcdir"/faustlive-pr-55.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver/Build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON \
    -Wno-dev
  cmake --build build
}

package() {
  depends+=(libasound.so libcurl.so libfaust.so libHTTPDFaust.so libjack.so libmicrohttpd.so
    libOSCFaust.so libsndfile.so)
  DESTDIR="$pkgdir" cmake --install build
}
