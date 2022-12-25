# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avxsynth-git
pkgname=('avxsynth-git'
         'avxedit-git'
         )
pkgver=20150407.80dcb7e
pkgrel=5
pkgdesc="Linux Port of AviSynth. (Git version)"
arch=('x86_64')
url='http://www.avxsynth.org'
license=('GPL2')
makedepends=('git'
             'yasm'
             'python'
             'qt5-base'
             'qt5-tools'
#              'mplayer'
             'log4cpp'
             'pango'
             'libjpeg-turbo'
             'sdl12-compat'
             )
source=('git+https://github.com/avxsynth/avxsynth.git'
        'https://ffmpeg.org/releases/ffmpeg-4.4.3.tar.bz2'
        'https://github.com/FFMS/ffms2/archive/refs/tags/2.23.tar.gz'
        'https://patch-diff.githubusercontent.com/raw/avxsynth/avxsynth/pull/120.diff'
        'https://patch-diff.githubusercontent.com/raw/avxsynth/avxsynth/pull/121.diff'
        'https://patch-diff.githubusercontent.com/raw/avxsynth/avxsynth/pull/122.diff'
        'https://patch-diff.githubusercontent.com/raw/avxsynth/avxsynth/pull/126.diff'
        'c++11_fix.patch'
        'qt5.patch'
        )
sha256sums=('SKIP'
            '33b8c2dbcd530fe1db5710415345609b4ca227bd0da1e3a9332dbb0f11fd273a'
            'b09b2aa2b1c6f87f94a0a0dd8284b3c791cbe77f0f3df57af99ddebcd15273ed'
            '87952a30be26f6db89e5b1d89c9bdb9c9567654bdaa2ce80503ce28f8f0a272a'
            '6534ae6c2e09b3c13ca4d9c47e1d3a4c8895575d3202b0d3ab80b25504bff94d'
            'a2cf0517db8368c53912cde5cbd81d6f29cf0c4a5db5a25483284fe0b38012cb'
            'f6a825b6b5da58d7ebdb67252885262908bda86edf248b78771c8ffaef3e00b9'
            'ac83efa3a3a78ed4c1935ea47dafbdb46b9c6b03c1f4ab214850eda708ee0cc6'
            'fb155fc2dbdb2450c3761781c571ec4335d1fa5169bd1fb2332386eb047c6d8a'
            )

pkgver() {
  cd avxsynth
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  mkdir -p build build-ffmpeg build-ffms2

  cd avxsynth

  patch -p1 -i "${srcdir}/120.diff"
  patch -p1 -i "${srcdir}/121.diff"
  patch -p1 -i "${srcdir}/122.diff"
  patch -p1 -i "${srcdir}/126.diff"
  sed 's|STATUS_NO_MEMORY|(unsigned)STATUS_NO_MEMORY|g' -i avxsynth/core/src/core/parser/expression.cpp

  # error: invalid suffix on literal; C++11 requires a space between literal and string macro [-Werror=literal-suffix]
  patch -p1 -i "${srcdir}/c++11_fix.patch"

  # Build on Qt5
  patch -p1 -i "${srcdir}/qt5.patch"

}

build() {
  CXXFLAGS+=" -std=c++11"
  LDFLAGS+=" -Wl,--allow-multiple-definition"
  export PYTHON=python

  cd "${srcdir}/build-ffmpeg"
  ../ffmpeg-4.4.3/configure \
    --prefix="${srcdir}/fakeroot" \
    --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,programs,doc,vdpau,vaapi,cuda,cuvid,nvenc} \
    --enable-pic \
    --enable-avisynth \
    --enable-avresample \
    --enable-gpl

  make install

  export PKG_CONFIG_LIBDIR="${srcdir}/fakeroot/lib/pkgconfig"
  export PKG_CONFIG_PATH="${PKG_CONFIG_LIBDIR}:/usr/lib/pkgconfig:/usr/share/pkgconfig"

  cd "${srcdir}/build-ffms2"
  ../ffms2-2.23/configure \
    --prefix="${srcdir}/fakeroot" \
    --enable-shared=no \
    --with-pic

  make install-libLTLIBRARIES install-pkgconfigDATA install-includeHEADERS

  cd "${srcdir}/avxsynth"
  autoreconf -if

  cd "${srcdir}/build"
  ffms2_CFLAGS="-I${srcdir}/fakeroot" \
  ../avxsynth/configure \
    --prefix=/usr \
    --enable-silent-rules \
    --with-pic

  make
}

package_avxsynth-git() {
  pkgdesc="Linux Port of AviSynth. (Git version)"
  depends=('log4cpp'
           'libpango-1.0.so'
           'libpangocairo-1.0.so'
           'libpangoft2-1.0.so'
           'sdl12-compat'
           'libjpeg.so'
           )
  provides=('avxsynth')
  conflicts=('avxsynth')

  make -C build DESTDIR="${pkgdir}" install
  make -C build/apps/AVXEdit DESTDIR="${pkgdir}" uninstall
}

package_avxedit-git() {
  pkgdesc="Simple Qt frontend for create/edit/test AvxSynth scripts. (Git version)"
  depends=('qt5-base'
           'avxsynth-git'
           )
  provides=('avxedit')
  conflicts=('avxedit')

  make -C build/apps/AVXEdit DESTDIR="${pkgdir}" install
}
