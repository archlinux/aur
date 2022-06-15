# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>

pkgname=octave-hg
epoch=6
pkgrel=1
pkgver=8.0.0.r31096.b6aeea949531
pkgdesc="A high-level language, primarily intended for numerical computations."
url="http://www.octave.org"
arch=('i686' 'x86_64')
license=('GPL')
# Some of these may be optional, e.g. arpack, lapack, qhull but if they
# are installed, octave will be linked against them.
depends=('fftw' 'curl' 'fltk' 'hdf5' 'glpk' 'arpack' 'openmp'
	 'gl2ps' 'qhull' 'graphicsmagick' 'mesa' 'julia' 'libsndfile'
	 'suitesparse' 'qscintilla-qt5' 'termcap' 'qt5-tools'
	 'qrupdate' 'portaudio' 'glu' 'sundials')
makedepends=('pcre' 'mercurial' 'gcc-fortran' 'gperf' 'rsync' 'gettext'
	     'fig2dev' 'epstool' 'texlive-core' 'icoutils' 'git')
optdepends=('texinfo: for help-support in octave'
	    'gnuplot: alternative plotting')
conflicts=('octave')
provides=("octave=$pkgver")
options=('!emptydirs')
source=(hg+https://hg.savannah.gnu.org/hgweb/octave git://git.sv.gnu.org/gnulib)
md5sums=('SKIP'
         'SKIP')
_hgrepo=octave

pkgver() {
  cd ${_hgrepo}
  _appver=$(awk -F", " '/bugs.html/ {print $2}' configure.ac|tr -d []|tr - _)
  printf "%s.r%s.%s" "${_appver}" "$(hg identify -n)" "$(hg identify -i)"
}

prepare () {
  git submodule init
  git config submodule.gnulib.url gnulib
  git submodule update

  cd ${_hgrepo}
  for i in config.sub config.guess texinfo.tex
  do
    [[ -f $i ]] && rm build-aux/$i
  done
  install -Dm644 /usr/share/automake-1.16/texinfo.tex build-aux/
}

build() {
  cd ${_hgrepo}
  ./bootstrap --gnulib-srcdir="$srcdir"/gnulib

  ./configure QCOLLECTIONGENERATOR=qhelpgenerator-qt5 CXXFLAGS="$CXXFLAGS -fcommon" \
	       --prefix=/usr --libexecdir=/usr/lib --enable-shared --disable-jit \
	       --with-umfpack --disable-java --with-hdf5 --disable-docs 
  make
}

package() {
  cd ${_hgrepo}
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-pdf
  
  # add octave library path to ld.so.conf.d
  _appver=$(awk -F", " '/bugs/ {print $2}' configure.ac|tr -d []|tr - _)
  install -d "$pkgdir"/etc/ld.so.conf.d
  echo "/usr/lib/${_hgrepo}/${_appver}" > "$pkgdir"/etc/ld.so.conf.d/${_hgrepo}.conf
}
