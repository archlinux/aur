# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor : shining <shiningxc.at.gmail.com>
# Contributor : cyberdune <cyberdune@gmail.com>

pkgname=octave-nogui
_name=octave
provides=(octave)
pkgver=4.4.0
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
source=(ftp://ftp.gnu.org/gnu/octave/octave-$pkgver.tar.gz{,.sig}
        octave-qt5.11.patch::"https://hg.savannah.gnu.org/hgweb/octave/raw-rev/cdaa884568b1")
options=('!emptydirs')
validpgpkeys=('DBD9C84E39FE1AAE99F04446B05F05B75D36644B')  # John W. Eaton
sha512sums=('6a167a4a6a2f6ae70511f13b14feea0ce3efcc964227c93f3195adb3a1f1f28dda56f86a2e1c7c5e9f54891d2846fb96972092387e3da41f2e04cb700606ffc2'
            'SKIP'
            '5bbd5e54ac94ce57407714593aed0b65befa823be914376944f400c7dc18692d679df87ac90867c7adc8bd91c73855a13066e4b197e78fd89cb060d50dede69f')

prepare() {
  cd $_name-$pkgver
  patch -p1 -i ../octave-qt5.11.patch # Fix build with Qt 5.11
}

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
