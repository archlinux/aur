# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor : Ronald van Haren <ronald.archlinux.org>
# Contributor : shining <shiningxc.at.gmail.com>
# Contributor : cyberdune <cyberdune@gmail.com>

pkgname=octave40
_pkgname=octave
pkgver=4.0.3
pkgrel=3
pkgdesc="A high-level language, primarily intended for numerical computations."
arch=('i686' 'x86_64')
url="http://www.octave.org"
license=('GPL')
depends=('fftw' 'curl' 'graphicsmagick' 'glpk' 'hdf5' 'qhull' 'fltk' 'arpack'
	 'ghostscript' 'suitesparse' 'gl2ps' 'qt4' 'qscintilla'
	 'libsndfile' 'portaudio')
makedepends=('gcc-fortran' 'texlive-core' 'suitesparse' 'texinfo' 'gnuplot'
	     'qscintilla')
optdepends=('texinfo: for help-support in octave'
            'gnuplot: alternative plotting'
            'java-environment: Java support')
provides=('octave')
conflicts=('octave')
source=(ftp://ftp.gnu.org/gnu/octave/$_pkgname-$pkgver.tar.xz
	octave-gcc6.patch octave-gnulib-fixes.diff)
options=('!emptydirs')
sha1sums=('c798346a8271e0141d9dbe5610584dabb8311277'
          '646a285266faf054ae72b1897e575f08da779d6e'
          '99ade424bf4f866e4b7e9b948711f120e9960671')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # ag: fix various compile issues (mostly gnulib)
  patch -p1 -i ../octave-gnulib-fixes.diff
  # Fix build with GCC 6 (Fedora)
  patch -p1 -i ../octave-gcc6.patch
  find -name \*.cc -o -name \*.h -o -name \*.yy | xargs sed -i -e 's/#include <c\(math\|stdlib\)>/#include <\1.h>/'
  find -name \*.h -o -name \*.cc | xargs sed -i -e 's/<config.h>/"config.h"/' -e 's/<base-list.h>/"base-list.h"/'
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  autoreconf -vfi

  ./configure --prefix=/usr --libexecdir=/usr/lib \
  --enable-shared --disable-static \
  --with-quantum-depth=16 \
  --with-umfpack="-lumfpack -lsuitesparseconfig"  \
  MOC=moc-qt4 UIC=uic-qt4
# https://mailman.cae.wisc.edu/pipermail/help-octave/2012-September/053991.html 

  LANG=C make
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # add octave library path to ld.so.conf.d
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}/${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"
}
