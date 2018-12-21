LANG=C
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>

pkgname=octave-hg
pkgrel=1
pkgver=6.0.0r26279.42437d6e4096
pkgdesc="A high-level language, primarily intended for numerical computations."
url="http://www.octave.org"
arch=('i686' 'x86_64')
license=('GPL')
# Some of these may be optional, e.g. arpack, lapack, qhull but if they
# are installed, octave will be linked against them.
depends=('fftw>=3.2.2' 'curl' 'fltk' 'hdf5' 'glpk' 'arpack' 'openmp'
	 'gl2ps' 'qhull' 'graphicsmagick' 'mesa' 'julia' 'libsndfile'
	 'suitesparse' 'java-environment' 'qscintilla-qt5' 'termcap'
	'qt5-tools' 'qrupdate' 'portaudio')
makedepends=('pcre' 'mercurial' 'gcc-fortran' 'gperf' 'rsync' 'gettext'
	     'transfig' 'epstool' 'texlive-core' 'icoutils' 'git')
optdepends=('texinfo: for help-support in octave'
	    'gnuplot: alternative plotting')
conflicts=('octave')
provides=("octave=$pkgver")
options=('!emptydirs')
source=(hg+https://hg.savannah.gnu.org/hgweb/octave git://git.sv.gnu.org/gnulib)
md5sums=('SKIP' 'SKIP')
_hgrepo=octave

pkgver() {
  cd "$srcdir"/${_hgrepo}
  _appver=$(awk -F", " '/bugs.html/ {print $2}' configure.ac|tr -d []|tr - _)
  printf "%sr%s.%s" "${_appver}" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  git submodule init
  git config submodule.gnulib.url gnulib
  git submodule update

  cd "$srcdir"/${_hgrepo}
  for i in config.sub config.guess
  do
    [[ -f $i ]] && rm build-aux/$i
  done
  
  ./bootstrap --gnulib-srcdir="$srcdir"/gnulib
  [[ -d build ]] || mkdir build
  cd build
  [[ $CARCH == "x86_64" ]] && _arch=amd64
  [[ $CARCH == "i686" ]] && _arch=i386

  ../configure QCOLLECTIONGENERATOR=qhelpgenerator-qt5 \
    --prefix=/usr --libexecdir=/usr/lib --enable-shared --disable-jit \
    --with-umfpack --enable-java --with-hdf5 \
    --with-java-homedir=/usr/lib/jvm/`archlinux-java get` \
    --with-java-includedir=/usr/lib/jvm/`archlinux-java get`/include \
    --with-java-libdir={/usr/lib/jvm/`archlinux-java get`/lib/${_arch}/server,/usr/lib/jvm/`archlinux-java get`/jre/lib/${_arch}/server}
  export CLASSPATH=.:$CLASSPATH
  make -j2
}

check() {
  cd "$srcdir"/${_hgrepo}/build
  make test || true
}

package() {
  cd "$srcdir"/${_hgrepo}/build
  make DESTDIR=${pkgdir} install
  # add octave library path to ld.so.conf.d
  _appver=$(awk -F", " '/bugs/ {print $2}' ../configure.ac|tr -d []|tr - _)
  install -d "$pkgdir"/etc/ld.so.conf.d
  echo "/usr/lib/${_hgrepo}/${_appver}" > "$pkgdir"/etc/ld.so.conf.d/${_hgrepo}.conf
}
