#!/hint/bash
# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>

_pkgname=scilab
_fragment="#branch=master"
pkgname=${_pkgname}-git
pkgver=6.0.0.r296.g2f851190556
pkgrel=1
pkgdesc='A scientific software package for numerical computations.'
arch=('i686' 'x86_64')
url='https://www.scilab.org'
license=('BSD' 'custom:CeCILL' 'GPL2')
depends=('suitesparse>=4.4.1' 'arpack' 'fftw' 'eigen'
         'hdf5' 'libmatio'
         'tk' 'bwidget'
         'curl' 'inetutils'
         'java-runtime>=8'
         'beanshell' 'eclipse-ecj' 'java-flexdock>=1.2.4' 'fop-hyph'
         'jeuclid-core' 'jgraphx-jre8' 'javahelp2'
         'saxon-he' 'jlatexmath-fop>=1.0.3' 'jrosetta>=1.0.4' 'jgoodies-looks' 'java-qdox'
         'java-skinlf' 'java-testng' 'xalan-java' 'docbook-xsl'
         'jogl>=2.3.2' 'apache-lucene>=7'
         'java-batik>=1.8' 'java-xmlgraphics-commons>=2.0.1')
makedepends=('java-environment=8' 'ant>=1.9.0'
             'ocaml-findlib' 'ocaml-num' 'gcc-fortran'
             'time' 'git')
provides=('scilab')
conflicts=('scilab')
source=("git://git.scilab.org/scilab${_fragment}"
        "${_pkgname}-jogl-2.3.2.patch"
        "${_pkgname}-strict-jar.patch"
        "${_pkgname}-LD_LIBRARY_PATH.patch"
        "${_pkgname}-0004-Fix-build-with-ocaml-4.0.4.patch"
        "${_pkgname}-num.patch"
        "libxml.patch"
        "hdf5_18_api.patch"
         )
sha256sums=('SKIP'
            '7b7b5609ee36b6f8d801eeb3899cd62cc889c2038e0e1616b7640f9b8a0424b0'
            '38aa094951338fa1d267dc6f397552e175213b0f8ba7b35727c178607861f6dd'
            'a39277cb8cfc3d7929c73ce6d707dc24e3df4b8d8f2d587f075efebda79ff4db'
            '6712c6db2f3ba365d150e1feb1c71bf691f8aa3b45d5a872b05a42f0daf23392'
            '31e757bdb2086e08e2477118fceddcdd50f3c2fcad5c86cf5de8ec06009f34ed'
            'c04114c4ef63d76bf898808e90c892de093fcc400a2371c7aa287b76c0c5d041'
            'f781c2919a0c14be5deed3a8b8866addd8de1171a06aacb96ef1e19535d0988e')

pkgver() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  # https://codereview.scilab.org/#/c/17530/
  patch -p2 < "${srcdir}"/${_pkgname}-jogl-2.3.2.patch
  # Linked to: https://codereview.scilab.org/#/c/18089/
  patch < "${srcdir}"/${_pkgname}-strict-jar.patch
  # Fix path, to avoid the following error:
  # An error has been detected while loading /usr/share/scilab//modules/functions/.libs/libscifunctions.so: /usr/share/scilab//modules/functions/.libs/libscifunctions.so: cannot open shared object file: No such file or directory
  patch -p0 < "${srcdir}"/${_pkgname}-LD_LIBRARY_PATH.patch
  # OCaml
  patch -p0 < "${srcdir}"/${_pkgname}-0004-Fix-build-with-ocaml-4.0.4.patch
  patch -p0 < "${srcdir}"/${_pkgname}-num.patch
  # libxml
  patch -p1 < "${srcdir}"/libxml.patch
  # hdf5_18_api
  patch -p1 < "${srcdir}"/hdf5_18_api.patch
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
    --disable-static-system-lib \
    --with-jdk=/usr/lib/jvm/java-8-openjdk/ \
    FFLAGS="-fallow-argument-mismatch" \

  make -j1
  make doc
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 COPYING-BSD "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-BSD"
}

# vim:set ts=2 sw=2 et:
