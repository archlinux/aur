# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>

pkgname=octave-hg
pkgver=4.1.0+21637.59ebef9680ef
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations."
url="http://www.octave.org"
arch=('i686' 'x86_64')
license=('GPL')
# Some of these may be optional, e.g. arpack, lapack, qhull, cblas but if they
# are installed, octave will be linked against them.
depends=('fftw>=3.2.2' 'curl' 'fltk' 'hdf5' 'glpk' 'arpack' 'gl2ps' 
	 'qscintilla' 'qhull' 'graphicsmagick' 'portaudio' 'mesa'
	 'suitesparse' 'java-environment' 'cblas') 
makedepends=('pcre' 'mercurial' 'gcc-fortran' 'gperf' 'rsync' 'gnuplot'
	     'gettext' 'suitesparse' 'transfig' 'epstool' 'texlive-core'
	     'icoutils')
optdepends=('texinfo: for help-support in octave'
	    'gnuplot: alternative plotting')
conflicts=('octave')
provides=("octave=4.1.0")
install=octave.install
source=('java-slackware.patch')
md5sums=('cb5a497834876e68ad28160751afe4c1')
options=('!emptydirs' '!makeflags')
_hgroot=http://hg.savannah.gnu.org/hgweb/
_hgrepo=octave

pkgver() {
  cd "$srcdir"
  if [ -d ${_hgrepo} ]; then
      cd ${_hgrepo}
      hg pull -u
  else
    hg clone ${_hgroot}${_hgrepo}
  fi > /dev/null 2>&1
  cd "$srcdir/$_hgrepo"
  _appver=$(awk -F", " '/bugs/ {print $2}' configure.ac|tr -d [])
  echo ${_appver}$(hg identify -n).$(hg identify -i)
}
  
build() {
  cd "$srcdir"
  [[ -d "$srcdir"/${_hgrepo}-build ]] && rm -rf $srcdir/${_hgrepo}-build
  cp -rf "$srcdir"/${_hgrepo} $srcdir/${_hgrepo}-build
 
  cd "$srcdir"/${_hgrepo}-build
   ./bootstrap --bootstrap-sync 
  [[ $CARCH == "x86_64" ]] && _arch=amd64
  [[ $CARCH == "i686" ]] && _arch=i386
  export LD_PRELOAD=/usr/lib/libGL.so
  
  MOC=moc-qt4 UIC=uic-qt4 ./configure \
    --prefix=/usr --libexecdir=/usr/lib --enable-shared --disable-jit \
    --with-umfpack --enable-java \
    --with-java-homedir=/usr/lib/jvm/`archlinux-java get` \
    --with-java-includedir=/usr/lib/jvm/`archlinux-java get`/include \
    --with-java-libdir={/usr/lib/jvm/`archlinux-java get`/lib/${_arch}/server,/usr/lib/jvm/`archlinux-java get`/jre/lib/${_arch}/server} 
  make
}

package() {
  cd "$srcdir"/${_hgrepo}-build
  make DESTDIR=${pkgdir} install
  # add octave library path to ld.so.conf.d
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_hgrepo}/${_appver}" > "${pkgdir}/etc/ld.so.conf.d/${_hgrepo}.conf"
}
