# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: eDgar <eDgar [at/at] openmail.cc>
# Contributor: Nick Winovich <nw2190@gmail.com>
# Contributor: Sigvald Marholm <marholm@marebakken.com>
# Contributor: Georg S. Voelker <voelker@maibox.org>
# Based on dolfin-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com> and submitted by myles

pkgname=dolfin
pkgdesc="C++ interface of FEniCS"
pkgver=2019.1.0.post0
pkgrel=8
arch=('x86_64')
url="https://bitbucket.org/fenics-project/${pkgname}"
license=('LGPL3')
depends=('boost' 'cppunit' 'eigen' 'gl2ps' 'petsc' 'python-ffc' 'scotch' 'suitesparse')
optdepends=('slepc: eigenvalue problem solvers'
  'hdf5-openmpi: for reading/writing hdf5 files')
makedepends=('cmake')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::${url}/downloads/${pkgname}-${pkgver}.tar.gz
  pkg-config.patch::${url}/issues/attachments/1120/fenics-project/${pkgname}/1618190046.28/1120/0001-cmake-PETSc-SLEPc-match-lowercase-.pc-pkg-config-fil.patch
  endian.patch::${url}/issues/attachments/1116/fenics-project/dolfin/1602778118.04/1116/0001-Use-__BYTE_ORDER__-instead-of-removed-Boost-endian.h.patch
  catch.patch::https://salsa.debian.org/science-team/fenics/${pkgname}/-/raw/d132af60fe71343ad280966f8629132bc27899f2/debian/patches/catch_SIGSTKSZ_libc6_2.34.patch)
sha512sums=('0677245d2537d6e3b25bc8c47700a4d10690f35a49a544456456601505703e0b21ddec510f456146edef3d0beea366092a54a23ac29bd165c9c97cede6d6ca10'
  'cc0892fe899361e855ace1d831ca9f56761bc3b60d015107faa3f459dfc9c19ba7eaf9a7bdacd890763d66b7151b1be848704b8bdf82a0964239e0079548c182'
  '87013c1eb1770432d98f0934d3607d428d68f68e0ed1196c1c98070cdf764a930482b95a6996042b3b2e90a336d7404bb8c91a7d4ee6e940873ef4591482a772'
  'ad327c6d916ef120919f5d2a177e10da02d14941ce283d3bfbeddd2caadda3ab67a96c3f6ad937e4bc2add00974ba9115d8db3638a094ef2d9358c25ba2b06ae')

prepare() {
  # https://bitbucket.org/fenics-project/dolfin/issues/1128/ftbfs-min_element-is-not-a-member-of-std
  sed -i '20 a #include <algorithm>' ${pkgname}-${pkgver}/${pkgname}/geometry/IntersectionConstruction.cpp
  sed -i '26 a #include <algorithm>' ${pkgname}-${pkgver}/${pkgname}/mesh/MeshFunction.h
  # https://bitbucket.org/fenics-project/dolfin/pull-requests/540/fix-hdf5-and-boost-deprecation-errors
  sed -i 's/ \ \ \ \ \ \ \ \ \ \ \ lapl_id);/ \ \ \ \ \ \ \ \ \ \ \ H5O_INFO_BASIC, lapl_id);/' ${pkgname}-${pkgver}/${pkgname}/io/HDF5Interface.cpp
  # gcc 13 compatibility
  sed -i '25 a #include <cstdint>' ${pkgname}-${pkgver}/${pkgname}/mesh/MeshConnectivity.h
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../endian.patch
  patch -p1 -i ../pkg-config.patch
  patch -p1 -i ../catch.patch
}

build() {
  local py_interp=$(python -c "import os,sys; print(os.path.realpath(sys.executable))")

  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
  [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

  cmake -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=TRUE \
    -DPYTHON_EXECUTABLE="${py_interp}" \
    -DCMAKE_SKIP_BUILD_RPATH=TRUE \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DDOLFIN_ENABLE_TRILINOS=FALSE \
    -DDOLFIN_ENABLE_SUNDIALS=FALSE \
    -Wno-dev
  cmake --build build --target all
  # Build documentation
  # See Doxyfile
  # cd ${pkgname}-${pkgver}/doc
  # doxygen
  # cd latex
  # make
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  cmake --build build --target unittests
  LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/build/dolfin/" ./build/test/unit/cpp/unittests
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # install -d ${pkgdir}/usr/share/doc/${pkgname}
  # mv ${pkgname}-${pkgver}/doc/html ${pkgdir}/usr/share/doc/${pkgname}
  # install ${pkgname}-${pkgver}/doc/latex/refman.pdf ${pkgdir}/usr/share/doc/${pkgname}
}
