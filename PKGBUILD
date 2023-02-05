# Maintainer: XLWZ <xlwzforever@xlwz.moe>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sl1pkn07 <sl1pkn07@gmail.com>
# Contributor: jackoneill <cantabile.desu@gmail.com>

pkgname=vapoursynth-classic
pkgver=R57.A7
pkgrel=1
pkgdesc='A video processing framework with the future in mind with classic API compatibility'
arch=(x86_64)
url=https://github.com/AmusementClub/vapoursynth-classic
license=(
  LGPL3
  custom:OFL
)
depends=(
  libass.so
  libavcodec.so
  libavformat.so
  libavutil.so
  libmagick
  libzimg.so
  python
  tesseract
)
makedepends=(
  cython
  git
  python-sphinx
)
provides=(vapoursynth)
conflicts=(vapoursynth)

source=(
  git+https://github.com/AmusementClub/vapoursynth-classic.git#tag=${pkgver}
  vapoursynth.xml
)
sha256sums=(
  SKIP
  8e51579547d20cd7cb9618a47b3ac508423d09d76649bf038d0ab9acb850b068
)

pkgver() {
  cd vapoursynth-classic

  git describe --tags
}

prepare() {
  cd vapoursynth-classic

  sed -e 's|python-$PYTHON_VERSION|python-$PYTHON_VERSION-embed|' -i configure.ac # Fix linking with python 3.8
  ./autogen.sh
}

build() {
  cd vapoursynth-classic

  export LDFLAGS="$LDFLAGS -lpthread"

  ./configure \
    --prefix=/usr \
    --enable-imwri \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd vapoursynth-classic

  make DESTDIR="${pkgdir}" install

  install -Dm 644 src/core/ter-116n.ofl.txt -t "${pkgdir}"/usr/share/licenses/vapoursynth-classic/
  install -Dm 644 ../vapoursynth.xml -t "${pkgdir}"/usr/share/mime/packages/
}

# vim: ts=2 sw=2 et:
