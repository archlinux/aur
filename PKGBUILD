# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: bartus <scilab-aur@bartus.33mail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Kurnevsky Evgeny <kurnevsky@gmail.com>
# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>
pkgname=scilab
pkgver=2025.0.0
pkgrel=1
pkgdesc="A scientific software package for numerical computations"
arch=(i686 x86_64)
url="https://www.${pkgname}.org"
license=(GPL-2.0-or-later BSD-3-Clause CECILL-2.1)
depends=(arpack bwidget eigen fftw hdf5-openmpi libmatio suitesparse)
# 'jogl>=2.5.0' 'java-flexdock>=1.2.4' jaf-api jaxb-api
# jgoodies-looks jgoodies-common 'jrosetta>=1.0.4'
# 'apache-lucene>=8.4.0' java-skinlf inetutils beanshell eclipse-ecj
# fop-hyph jeuclid-core 'jgraphx>=1.4.0' javahelp2 saxon-he
# 'jlatexmath-fop>=1.0.3' java-qdox xalan-java docbook-xsl 'java-batik>=1.8'
# 'java-xmlgraphics-commons>=2.0.1')
# checkstyle java-commons-beanutils junit java-hamcrest cobertura
makedepends=(ant
  curl
  gcc-fortran
  libxml2
  ocaml-num
  pcre
  pkgconf
  time
  tk
)
source=(https://gitlab.com/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
# hdf5-api.patch ${pkgname}-strict-jar.patch ${pkgname}-LD_LIBRARY_PATH.patch ${pkgname}-num.patch
sha512sums=('b8733b9b9e96769c393f26481811cfa7e7ea52c91726b5e6fd8dbe8b8bc8052e807a5e0a6edcce591575a9cd92008273c90957a65aebf8ec6ec5995eaf1d1ce5')

# prepare() {
#   cd ${pkgname}-${pkgver}
# Linked to: https://codereview.scilab.org/#/c/18089
# patch <"${srcdir}"/${pkgname}-strict-jar.patch
# Fix path, to avoid the following error:
# An error has been detected while loading /usr/share/scilab//modules/functions/.libs/libscifunctions.so: /usr/share/scilab//modules/functions/.libs/libscifunctions.so: cannot open shared object file: No such file or directory
# patch -p0 <"${srcdir}"/${pkgname}-LD_LIBRARY_PATH.patch
# OCaml
# patch -p0 <"${srcdir}"/${pkgname}-num.patch
# # Jakarta
# patch -p0 <"${srcdir}"/jar_names_in_configure.patch
# sed -i 's/gluegen_rt/gluegen2_rt/' configure.ac
# sed -i 's/gluegen_rt/gluegen2_rt/' modules/gui/src/java/org/scilab/modules/gui/SwingView.java
# patch -p1 -i ../hdf5-api.patch
# }

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
    --without-gui \
    --without-javasci \
    --without-jdk \
    --disable-build-doxygen \
    --disable-build-help \
    --disable-debug-java \
    --disable-static-system-lib \
    FFLAGS="-fallow-argument-mismatch" \
    CFLAGS="$CFLAGS -fcommon" \
    CXXFLAGS="$CXXFLAGS -fcommon" # -DH5_USE_18_API
  make
  make doc
}

package() {
  cd ${pkgname}-${pkgver}/${pkgname}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-data install-html
  install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
