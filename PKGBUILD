# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor : shining <shiningxc.at.gmail.com>
# Contributor : cyberdune <cyberdune@gmail.com>

pkgname=octave-nogui
_name=octave
provides=(octave)
pkgver=4.4.1
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations."
arch=('x86_64')
url="http://www.octave.org"
license=('GPL')
depends=(
  'fftw'
  'curl'
  'glpk'
  'hdf5'
  'qhull'
  'arpack'
  'glu'
  'ghostscript'
  'suitesparse'
  'gl2ps'
  'libsndfile'
  'qrupdate'
  'blas'
  'sundials'
)
makedepends=(
  'gcc-fortran'
  'suitesparse'
  'gnuplot'
  'fltk'
  'portaudio'
  'jdk8-openjdk'
  'cblas'
  'gperf'
  'graphicsmagick'
  'lapack'
  # 'llvm' # will be used when jit compilation will be possible to be enabled - see https://savannah.gnu.org/bugs/?func=detailitem&item_id=52414
)
optdepends=(
  'gnuplot: alternative plotting'
  'portaudio: audio support'
  'java-runtime: java support'
  'fltk: FLTK GUI'
)
source=(ftp://ftp.gnu.org/gnu/octave/octave-$pkgver.tar.gz{,.sig})
options=('!emptydirs')
validpgpkeys=('DBD9C84E39FE1AAE99F04446B05F05B75D36644B')  # John W. Eaton
sha512sums=('21a1f13e2145fa530f2169254d19442b572745d65b91453ba1f552f6eda6aecfead57dbe0260b3293a29db0aa0f27cfd4f26df332e6d640848a822b20c1232f8'
            'SKIP')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"

  ./configure --prefix=/usr --libexecdir=/usr/lib \
  --enable-shared --disable-static \
  --without-qscintilla \
  --without-qt \
  --disable-jit \
  --with-blas=/usr/include \
  --with-suitesparse \
  --with-umfpack="-lumfpack -lsuitesparseconfig"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  LANG=C make
}

package(){
  cd "${srcdir}/${_name}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # add octave library path to ld.so.conf.d
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_name}/${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${_name}.conf"
}
