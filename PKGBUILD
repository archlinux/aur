# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: bartus <scilab-aur@bartus.33mail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Kurnevsky Evgeny <kurnevsky@gmail.com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>
pkgname=scilab
pkgver=2026.0.0
pkgrel=1
pkgdesc="A scientific software package for numerical computations"
arch=(i686 x86_64)
url="https://www.${pkgname}.org"
license=(GPL-2.0-or-later BSD-3-Clause CECILL-2.1)
depends=(blas-openblas arpack bwidget eigen fftw hdf5-openmpi libmatio suitesparse)
# 'jogl>=2.5.0' 'java-flexdock>=1.2.4' jaf-api jaxb-api
# jgoodies-looks jgoodies-common 'jrosetta>=1.0.4'
# 'apache-lucene>=8.4.0' java-skinlf inetutils beanshell eclipse-ecj
# fop-hyph jeuclid-core 'jgraphx>=1.4.0' javahelp2 saxon-he
# 'jlatexmath-fop>=1.0.3' java-qdox xalan-java docbook-xsl 'java-batik>=1.8'
# 'java-xmlgraphics-commons>=2.0.1')
# checkstyle java-commons-beanutils junit java-hamcrest cobertura
makedepends=(ant curl gcc-fortran libxml2 ocaml-num ocaml-findlib pcre pkgconf rapidjson time tk)
source=(https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
  local://${pkgname}-num.patch
  local://libxml.patch) # hdf5-api.patch ${pkgname}-strict-jar.patch
sha512sums=('c9a92aea842f2c2a12655e8e008dd62a70e998691758ec49c384912290d1a27d72638114516b8c0b5a9d8a6cb59d0e718d7c3c9a0a7d307db375a5c992491d93'
            '6d2e2548e2d33e830dba4a479787cd3f642afa63439d56cee650c50c49d980af9b50b4090732d9ca536322a6ff4a6763d015344f693d7e1d487e37dfb73d9605'
            'dc067645fd1712733e9283585107191bb787cec3888109707a9ae146c27dca2be5e14790d84dd778705cad78d3d5def869a69628caf1c40059126f4c62b9dfee')

prepare() {
  # Fix path, to avoid the following error:
  # An error has been detected while loading /usr/share/scilab//modules/functions/.libs/libscifunctions.so: /usr/share/scilab//modules/functions/.libs/libscifunctions.so: cannot open shared object file: No such file or directory
  sed -i '693 a \ \ \ \ LD_LIBRARY_PATH=/usr/lib/scilab${LD_LIBRARY_PATH+:$LD_LIBRARY_PATH}' "${srcdir}"/${pkgname}-${pkgver}/${pkgname}/bin/scilab
  patch -p0 <"${srcdir}"/${pkgname}-num.patch
  patch -p0 <"${srcdir}"/libxml.patch
  # Linked to: https://codereview.scilab.org/#/c/18089
  # patch <"${srcdir}"/${pkgname}-strict-jar.patch
  # Jakarta
  # patch -p0 <"${srcdir}"/jar_names_in_configure.patch
  # sed -i 's/gluegen_rt/gluegen2_rt/' configure.ac
  # sed -i 's/gluegen_rt/gluegen2_rt/' modules/gui/src/java/org/scilab/modules/gui/SwingView.java
  # patch -p1 -i ../hdf5-api.patch
}
# --with-xcos \
# --without-modelica \
# --with-jdk=/usr/lib/jvm/java-17-openjdk \
# --without-emf \
# --with-openmp \
# --enable-build-localization \
# --without-install-help-xml \
build() {
  cd ${pkgname}-${pkgver}/${pkgname}
  ./configure \
    --prefix=/usr \
    --with-fftw \
    --with-arpack-ng \
    --with-arpack-library=/usr/lib \
    --with-gcc \
    --with-gfortran \
    --with-tk \
    --with-umfpack \
    --with-umfpack-include=/usr/include/suitesparse \
    --with-umfpack-library=/usr/lib \
    --with-mpi \
    --with-matio \
    --with-hdf5-include=/usr/include \
    --with-hdf5-library=/usr/lib \
    --with-x \
    --without-xcos \
    --without-gui \
    --without-javasci \
    --without-jdk \
    --disable-build-doxygen \
    --disable-build-help \
    --disable-debug-java \
    --disable-static-system-lib \
    FFLAGS="-fallow-argument-mismatch" \
    CFLAGS="$CFLAGS -fcommon -std=gnu11" \
    CXXFLAGS="$CXXFLAGS -fcommon" # -DH5_USE_18_API -Wno-incompatible-pointer-types
  make
  make doc
}

package() {
  cd ${pkgname}-${pkgver}/${pkgname}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-data install-html
  install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}"/usr/include/nvector
  rm -r "${pkgdir}"/usr/include/sundials
  rm -r "${pkgdir}"/usr/include/sunmatrix
}
