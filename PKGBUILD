#!/hint/bash
# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>

_pkgname=scilab
pkgname=scilab-git
pkgver=6.0.0.r296.g2f851190556
pkgrel=1
pkgdesc='A scientific software package for numerical computations'
arch=('i686' 'x86_64')
url="https://www.scilab.org/"
license=('custom:CeCILL' 'BSD')
depends=('suitesparse>=4.4.1'  'arpack' 'fftw' 'eigen'
         'hdf5'
         'libmatio' 'tk' 'curl'
         'java-runtime>=8'
         'apache-lucene>=7'
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
        "${_pkgname}-lucene.patch"
        "${_pkgname}-hdf5-type.patch"
        "${_pkgname}-hdf5-1.8.10.patch"
        "${_pkgname}-batik-1.9.patch"
        "${_pkgname}-type.patch")

sha256sums=('SKIP'
            'f19f173e989f72bd55bda35e271b3c180ecef4e29da964df3f230fce8b1330fc'
            '37f649fea0196b255e5a8576dd1e8c5fd219c6e8c600b703b35303fb90b6a7e0'
            '38aa094951338fa1d267dc6f397552e175213b0f8ba7b35727c178607861f6dd'
            'b1fb3e4b08b3c17f267c213d954c704cb95225cf1445cf92892e205a4ca14d76'
            'c992a4f230dac60c3e217efee04b678c58d856f2aafa6173f742d4c5b050ab9d'
            '2dee1346c240d09ce7870bbbeb3318e0ac5d78f249d855df313e9cb7a2ef7fc0'
            'cc9bde7008ef078af3382e09867700c0f98779b4af39e21bb96e4bf9e020084a'
            '93597034c6866c3a4aaa7ef92b4588d2753383545ed3366be6cdb404edf949bd')

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
  # Fix to build with lucene >= 7
  patch -p0 < "${srcdir}"/${_pkgname}-lucene.patch
  # Fix hdf5 type
  patch -p0 < "${srcdir}"/${_pkgname}-hdf5-type.patch
  # Fix for LD_LIBRARY_PATH
  patch bin/scilab "${srcdir}"/${_pkgname}-LD_LIBRARY_PATH.patch
  # Fix version for batik
  patch -p0 < "${srcdir}"/${_pkgname}-batik-1.9.patch
  # Fix type
  patch -p0 < "${srcdir}"/${_pkgname}-type.patch
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
    --with-modelica \
    --without-emf \
    --with-install-help-xml \
    --enable-build-help \
    --enable-build-localization \
    --disable-static-system-lib

  make -j1
  make doc
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
