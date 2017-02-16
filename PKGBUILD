# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>

_pkgname=scilab
pkgname=scilab-git
pkgver=6.0.0.beta.2.r789.g97b14661ee1
pkgrel=1
pkgdesc='A scientific software package for numerical computations'
arch=('i686' 'x86_64')
url="https://www.scilab.org/"
license=('custom:CeCILL' 'BSD')
depends=('suitesparse>=4.4.1'  'arpack' 'fftw' 'eigen'
         'hdf5'
         'libmatio' 'tk' 'curl'
         'java-runtime>=8'
         'apache-lucene>=6'
         'beanshell' 'eclipse-ecj' 'java-flexdock>=1.2.4' 'fop-hyph'
         'jeuclid-core' 'jgraphx>=2.0.0.1' 'javahelp2'
         'saxon-he' 'jlatexmath-fop>=1.0.3' 'jrosetta>=1.0.4' 'jgoodies-looks' 'java-qdox'
         'java-skinlf' 'java-testng' 'xalan-java' 'docbook-xsl'
         'jogl>=2.3.2' 'java-batik>=1.8')
makedepends=('apache-ant' 'git' 'ocaml' 'java-environment>=8' 'gcc-fortran')
provides=('scilab')
conflicts=('scilab')
source=("git://git.scilab.org/scilab"
        "${_pkgname}-jogl-2.3.2.patch"
        "${_pkgname}-LD_LIBRARY_PATH.patch"
        "${_pkgname}-strict-jar.patch"
        "${_pkgname}-lucene-6.patch"
        "${_pkgname}-hdf5-type.patch"
        "${_pkgname}-hdf5-1.8.10.patch")
sha256sums=('SKIP'
            'f19f173e989f72bd55bda35e271b3c180ecef4e29da964df3f230fce8b1330fc'
            '37f649fea0196b255e5a8576dd1e8c5fd219c6e8c600b703b35303fb90b6a7e0'
            '38aa094951338fa1d267dc6f397552e175213b0f8ba7b35727c178607861f6dd'
            'ba7969fff7f839562120534222fbb6421e204f6a382654d80bbab19e0c7a2c66'
            'c992a4f230dac60c3e217efee04b678c58d856f2aafa6173f742d4c5b050ab9d'
            '2dee1346c240d09ce7870bbbeb3318e0ac5d78f249d855df313e9cb7a2ef7fc0')

pkgver() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  # http://bugzilla.scilab.org/show_bug.cgi?id=14539
  patch -p1 < "${srcdir}"/${_pkgname}-hdf5-1.8.10.patch
  # https://codereview.scilab.org/#/c/17530/
  patch -p2 < "${srcdir}"/${_pkgname}-jogl-2.3.2.patch
  # Linked to: https://codereview.scilab.org/#/c/18089/
  patch < "${srcdir}"/${_pkgname}-strict-jar.patch
  # Fix to build with lucene >= 6
  patch -p0 < "${srcdir}"/${_pkgname}-lucene-6.patch
  # Fix hdf5 type
  patch -p0 < "${srcdir}"/${_pkgname}-hdf5-type.patch
  # Fix for LD_LIBRARY_PATH
  patch bin/scilab "${srcdir}"/${_pkgname}-LD_LIBRARY_PATH.patch
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --with-gcc \
    --with-gfortran \
    --with-mpi \
    --with-matio \
    --with-umfpack \
    --with-fftw \
    --without-modelica \
    --without-emf \
    --with-install-help-xml \
    --enable-build-help \
    --enable-build-localization \
    --disable-static-system-lib

  make
  #make doc
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}/COPYING-BSD" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-BSD"
}

# vim:set ts=2 sw=2 et:
