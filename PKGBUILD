# Mantainer: Alexandros Theodotou <alex at zrythm dot org>

_pkgbase=rubberband
MINGW_PACKAGE_PREFIX=mingw-w64
pkgname=$MINGW_PACKAGE_PREFIX-$_pkgbase
pkgver=1.8.2
pkgrel=1
pkgdesc="Time-stretching and pitch-shifting audio library and utility"
arch=('any')
url="https://www.gnome.org"
license=("LGPL")
options=('!buildflags' 'strip' 'staticlibs')
makedepends=("${MINGW_PACKAGE_PREFIX}-meson")
depends=("${MINGW_PACKAGE_PREFIX}-fftw"
  "${MINGW_PACKAGE_PREFIX}-libsamplerate"
  "${MINGW_PACKAGE_PREFIX}-ladspa-sdk"
  "${MINGW_PACKAGE_PREFIX}-vamp-plugin-sdk")
source=("$pkgname-$pkgver.tar.gz::https://github.com/breakfastquay/rubberband/archive/v$pkgver.tar.gz")
sha512sums=('b70e41fb1f68487d67b3935682100138ba898adeec9c8e7f8caa30f7bc94389c847d72a1b0b04f042d16d4b57019cc82c0fe79c8f302c3174e603e9bd0289abf')
_architectures=('x86_64-w64-mingw32')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  CFLAGS+="-I${srcdir}/${_pkgbase}-${pkgver} -I${srcdir}/${_pkgbase}-${pkgver}/src"
  CXXFLAGS+="-I${srcdir}/${_pkgbase}-${pkgver} -I${srcdir}/${_pkgbase}-${pkgver}/src"
   for _arch in "${_architectures[@]}"; do
    # mkdir -p build-${_arch} && pushd build-${_arch}
    ./configure \
      --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 --build="$CHOST" \
      --prefix=/usr/x86_64-w64-mingw32 --libdir=/usr/x86_64-w64-mingw32/lib --includedir=/usr/x86_64-w64-mingw32/include \
      --enable-shared --enable-static
      make
    done
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  sed -i -e 's|bin/rubberband|bin/rubberband.exe|' Makefile
  sed -i -e 's|:= .so|:= .dll|' Makefile
  sed -i -e '186s|cp -f|#|' Makefile
  for _arch in "${_architectures[@]}"; do
    DESTDIR="${pkgdir}" ${_arch}-make install
    cp ${pkgdir}/usr/x86_64-w64-mingw32/lib/*.dll \
      ${pkgdir}/usr/x86_64-w64-mingw32/bin/
  done
}
