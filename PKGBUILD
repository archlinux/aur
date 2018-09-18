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
depends=('fftw' 'curl' 'glpk' 'hdf5' 'qhull' 'arpack' 'glu' 'ghostscript'
         'suitesparse' 'gl2ps' 'libsndfile' 'qrupdate')
makedepends=('gcc-fortran' 'texlive-core' 'suitesparse' 'texinfo' 'gnuplot' 'fltk' 'portaudio' 'jdk8-openjdk')
optdepends=('texinfo: for help-support in octave'
            'gnuplot: alternative plotting'
            'portaudio: audio support'
            'java-runtime: java support'
            'fltk: FLTK GUI')
source=(ftp://ftp.gnu.org/gnu/octave/octave-$pkgver.tar.gz{,.sig})
options=('!emptydirs')
validpgpkeys=('DBD9C84E39FE1AAE99F04446B05F05B75D36644B')  # John W. Eaton
sha512sums=('21a1f13e2145fa530f2169254d19442b572745d65b91453ba1f552f6eda6aecfead57dbe0260b3293a29db0aa0f27cfd4f26df332e6d640848a822b20c1232f8'
            'SKIP')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  ./configure --prefix=/usr --libexecdir=/usr/lib \
  --enable-shared --disable-static \
  --with-quantum-depth=16 \
  --without-qscintilla \
  --without-qt \
  --with-umfpack="-lumfpack -lsuitesparseconfig"
# https://mailman.cae.wisc.edu/pipermail/help-octave/2012-September/053991.html

  LANG=C make
}

package(){
  cd "${srcdir}/${_name}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # add octave library path to ld.so.conf.d
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_name}/${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${_name}.conf"
}
