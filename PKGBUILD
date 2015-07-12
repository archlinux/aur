# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>

pkgname=octave-hg
pkgver=20150712.07dd8e602f4e
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations."
url="http://www.octave.org"
arch=('i686' 'x86_64')
license=('GPL')
# Some of these may be optional, e.g. arpack, lapack, qhull, but if they
# are installed, octave will be linked against them.
depends=('fftw>=3.2.2' 'curl' 'fltk' 'hdf5' 'glpk' 'arpack' 'gl2ps' 
	 'qrupdate' 'qscintilla' 'qhull' 'graphicsmagick' 'portaudio'
	 'mesa' 'suitesparse')
makedepends=('pcre' 'mercurial' 'gcc-fortran' 'gperf' 'rsync' 'gnuplot'
	     'suitesparse' 'transfig' 'epstool' 'texlive-core' 'icoutils')
optdepends=('texinfo: for help-support in octave'
	    'gnuplot: alternative plotting')
conflicts=('octave')
install=octave.install
options=('!emptydirs' '!makeflags')
_appver="4.1.0+"
provides=("octave=$_appver")
_hgroot=http://www.octave.org/hg/
_hgrepo=octave

pkgver() {
  # We didn't check out the repository yet, so we have no version information..
  printf "%s.%s" "$(date +%Y%m%d)" "$(hg identify -i http://hg.savannah.gnu.org/hgweb/octave)"
}

build() {
  cd $srcdir
  
  if [ -d ${_hgrepo} ]; then
      cd ${startdir}/src/${_hgrepo}
      hg pull -u
  else
    hg clone ${_hgroot}${_hgrepo}
  fi
 
  msg "Mercurial clone done or server timeout"
  msg "Starting make..."
 
  [[ -d $srcdir/${_hgrepo}-build ]] && rm -rf $srcdir/${_hgrepo}-build
  cp -rf $srcdir/${_hgrepo} $srcdir/${_hgrepo}-build
 
  cd $srcdir/${_hgrepo}-build
 
  ./bootstrap --bootstrap-sync 

  [[ $CARCH == "x86_64" ]] && _arch=amd64
  [[ $CARCH == "i686" ]] && _arch=i386
  CXX=g++ CC=gcc ./configure --prefix=/usr \
    --libexecdir=/usr/lib --enable-shared --enable-jit \
    --enable-qhull MOC=moc-qt4 UIC=uic-qt4 --with-umfpack \
    --with-quantum-depth=16 --enable-java \
    --with-java-homedir=/usr/lib/jvm/`archlinux-java get` \
    --with-java-includedir=/usr/lib/jvm/`archlinux-java get`/include \
    --with-java-libdir=/usr/lib/jvm/`archlinux-java get`/lib/${_arch}/server 

  CXXFLAGS+="-fexceptions `llvm-config --cxxflags`" make
}

package() {
  cd $srcdir/${_hgrepo}-build
  make DESTDIR=${pkgdir} install
  # add octave library path to ld.so.conf.d
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_hgrepo}/${_appver}" > "${pkgdir}/etc/ld.so.conf.d/${_hgrepo}.conf"
}
