# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=scilab-git
pkgver=5.5.1.270.g5598095
pkgrel=1
pkgdesc='A scientific software package for numerical computations'
arch=('i686' 'x86_64')
url="http://www.scilab.org/"
license=('custom:CeCILL' 'BSD')
makedepends=('apache-ant' 'git' 'ocaml')
depends=(
'gcc-fortran'
'libxml2' 'pcre' 'hdf5' 'curl'
'blas'
'lapack'
'arpack'
'java-runtime' 'java-flexdock' 'scirenderer' 'jrosetta' 'java-commons-logging' 'javahelp2' 'jlatexmath' 'jlatexmath-fop' 'jgraphx' 'fop' 'fop-hyph' 'jeuclid-core' 'java-xmlgraphics-commons'
'jogl2.2.4'
'java-batik1.7'
'tcl' 'tk'
'saxon-he'
'gettext' 'pvm' 'fftw' 'libmatio' 'umfpack'

'ncurses' 'zlib' 'java-skinlf' 'jgoodies-looks' 'eigen' 'bwidget' 'java-freehep-vectorgraphics'
'java-testng' 'docbook-xsl-saxon' 'java-qdox' 'jing' 'java-commons-beanutils' 'bsh' 'xalan-java' 'eclipse-ecj')
# This last line above is things that are in prerequirements tarball
# but not mentioned in documentation for building this package.
# So these may or may not be only build time dependencies.
optdepends=(
'libcanberra')
#'umfpack: Sparse computations '
#'libmatio: Read/write Matlab binary files'
#'pvm: Parallel Virtual Machine'
#'fftw: Fast Fourier Transform')
provides=('scilab')
conflicts=('scilab')
source=("git://git.scilab.org/scilab")
md5sums=('SKIP')

pkgver() {
  cd scilab
  git describe --tags --long --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/scilab"
  rm -rf .git/
  cd scilab/
  ./configure \
    --prefix=/usr \
    --with-umfpack \
    --with-fftw \
    --with-modelica \
    --enable-build-localization \
    --with-external-scirenderer=/usr/share/java/scirenderer/scirenderer.jar \
    --disable-static-system-lib \
    --with-gfortran  # Needed for 64 bits, don't hurt for 32 bits
  make all doc
}

package() {
  cd "${srcdir}/scilab/scilab"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/scilab/scilab/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "$srcdir/scilab/scilab/COPYING-FR" "$pkgdir/usr/share/licenses/${pkgname}/COPYING-FR"
  install -Dm644 "$srcdir/scilab/scilab/COPYING-BSD" "$pkgdir/usr/share/licenses/${pkgname}/COPYING-BSD"
}

# vim:set ts=2 sw=2 et:
