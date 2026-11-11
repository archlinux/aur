# Maintainer: YoungCrescent <youngcrescent@proton.me>
pkgname=opalx
pkgver=2024.1.0
pkgrel=1
pkgdesc='Object Oriented Parallel Accelerator Library (OPAL X): charged particle beam dynamics and tracking simulation'
arch=('x86_64')
url='https://github.com/OPALX-project/OPAL'
license=('GPL-3.0-or-later')
depends=('boost-libs' 'gcc-libs' 'glibc' 'gsl' 'hdf5-openmpi' 'openmpi' 'zlib')
makedepends=('autoconf' 'automake' 'boost' 'cmake' 'hdf5-openmpi' 'libtool' 'openmpi')
_h5hutver=2.0.0rc7
source=("${url}/releases/download/OPAL-${pkgver}/OPAL-${pkgver}.tar.xz"
        "https://github.com/H5hut/H5hut/archive/refs/tags/H5hut-${_h5hutver}.tar.gz"
        'opal-2024.1.0-build.patch')
sha256sums=('f0b3d3fa1567a26ef42d3575b652256ddb9c9907d5bca4948b48c306294f406d'
            '02f009cdedabb55cc99fac96b9ee1c82c65650e9a82980ba2c77001d8725003d'
            'ae4f120223d4a02fc759c57e22e92e770bc4b64c2f431d7bdb5525c4570bb80f')

prepare() {
  cd "OPAL-${pkgver}"

  # The patch
  #   - drops -Werror (recent GCC releases emit new warnings),
  #   - fixes two constructs that newer GCC versions reject
  #     (TransportFun::put() referred to a non-existent member and
  #     FFTBase::write() mixed up two unrelated std::map iterator types),
  #   - does not enable the Fortran language unless AMR is requested,
  #     because HDF5's CMake package then looks for an MPI Fortran compiler,
  #   - links against the shared HDF5/Boost libraries shipped by the
  #     distribution instead of requiring static ones,
  #   - replaces the hardcoded ${CMAKE_INSTALL_PREFIX} in the install()
  #     destinations (which defeats DESTDIR) and moves the headers below
  #     /usr/include/opalx so that generic names such as "Field", "Index"
  #     or "Particle" are not dropped straight into /usr/include.
  patch -Np1 -i "${srcdir}/opal-${pkgver}-build.patch"
}

build() {
  # H5Hut is mandatory for OPAL but missing from the official repositories.
  # The AUR package "h5hut" is orphaned and still points to the defunct
  # gitlab.psi.ch URL, so the library is built here and linked statically.
  cd "H5hut-${_h5hutver}"
  ./autogen.sh
  CC=mpicc CXX=mpicxx ./configure \
    --prefix="${srcdir}/h5hut" \
    --enable-parallel \
    --enable-static \
    --disable-shared
  make -j"$(nproc)"
  make install

  cd "${srcdir}/OPAL-${pkgver}"
  export H5HUT_PREFIX="${srcdir}/h5hut"
  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DMPI_C_COMPILER=mpicc \
    -DMPI_CXX_COMPILER=mpicxx
  cmake --build build -j"$(nproc)"
}

package() {
  cd "OPAL-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSES/OPAL/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
