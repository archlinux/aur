# -*- mode: Shell-script; eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser < git at msrd0 dot de >
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-poppler-static
pkgver=22.01.0
pkgrel=1
pkgdesc="PDF rendering library based on xpdf 3.0 (mingw-w64)"
arch=('any')
url="https://poppler.freedesktop.org"
license=('GPL')
depends=('mingw-w64-openjpeg2'
         'mingw-w64-cairo')
optdepends=('mingw-w64-glib2: libpoppler-glib'
            'mingw-w64-qt5-base: libpoppler-qt5')
makedepends=('mingw-w64-cmake'
             'mingw-w64-glib2'
             'mingw-w64-icu'
             'mingw-w64-curl'
             'ninja'
             'python')
provides=("mingw-w64-poppler=$pkgver")
conflicts=('mingw-w64-poppler')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://poppler.freedesktop.org/poppler-${pkgver}.tar.xz"
        'cmake-libs-harfbuzz.patch')
sha256sums=('7d3493056b5b86413e5c693c2cae02c5c06cd8e618d14c2c31e2c84b67b2313e'
            'e236e36067d056af8bb330065169ed503e855ac3fee42c176bf099b043d76752')

prepare() {
  cd "${srcdir}/poppler-${pkgver}"
  
  # they moved gstrndup() to copyString() but forgot pdftocairo-win32.cc
  sed -i 's|gstrndup|copyString|g' utils/pdftocairo-win32.cc

  patch -Np1 -i "$srcdir/cmake-libs-harfbuzz.patch"
}

build() {
  cd "${srcdir}/poppler-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "${_arch%%-*}" && pushd "${_arch%%-*}"
    ${_arch}-cmake \
      -G Ninja \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_MANUAL_TESTS=OFF \
      -DBUILD_CPP_TESTS=NO \
      -DBUILD_GTK_TESTS=NO \
      -DBUILD_QT5_TESTS=NO \
      -DENABLE_BOOST=OFF \
      -DENABLE_UTILS=OFF \
      -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
      ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/poppler-${pkgver}/${_arch%%-*}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.a' | xargs ${_arch}-strip -g
  done
}
