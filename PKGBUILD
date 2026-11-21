# Maintainer: Josh Forer <banana-bred@posteo.net>
pkgname=openmolcas
pkgver=26.10
pkgrel=1
pkgdesc="Multiconfigurational quantum chemistry package"
arch=('x86_64')
url="https://gitlab.com/Molcas/OpenMolcas"
license=('LGPL-2.1-only')
depends=('hdf5' 'openblas64' 'python' 'python-pyparsing' 'libxc')
options=('!lto')
makedepends=('cmake' 'gcc-fortran' 'git')
optdepends=('python-h5py: reading HDF5 output from Python'
            'python-lxml: input validation in pymolcas')
source=("git+https://gitlab.com/Molcas/OpenMolcas.git#tag=v${pkgver}")
sha512sums=('bca294db7f6bba937e8ff48216d53c2345834add8394c2db717a0f303b214e35e0942b0e3368fc54c6576ced003d5de4cadc8df88b6474335a8ff3504e58bbc4')

_pfx=/opt/openmolcas

build() {

  cmake -B build -S OpenMolcas \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX="${_pfx}" \
    -D LINALG=Manual \
    -D LINALG_LIBRARIES=/usr/lib/libopenblas64_.so \
    -D OPENMP=ON \
    -D MPI=OFF \
    -D HDF5=ON \
    -D EXTERNAL_LIBXC=/usr \
    -D BUILD_TESTING=ON
    # -D CMAKE_BUILD_TYPE=Release \
  cmake --build build
}

check() {
  cd build

  # -- fortran tests
  ctest --output-on-failure

  # -- other simple tests
  export MOLCAS="${PWD}"
  export MOLCAS_WORKDIR="${srcdir}/molcas-tmp"
  export OMP_NUM_THREADS=1
  mkdir -p "${MOLCAS_WORKDIR}"
  ./pymolcas verify -j "$(nproc)" 000 core

  # -- full test suite
  #    The above tests are quick and not worth skipping
  #    IMO, but the full suite should probably not be the
  #    default for a system package. Uncomment the test
  #    below if you want to run it as a test for this package.
  #    What probably makes more sense is to just run the test
  #    on your own after the installation with
  #
  #       MOLCAS_WORKDIR=/tmp/molcas pymolcas verify
  #
  #    Anyway: here's what you would uncomment:
  #./pymolcas verify -j "$(nproc)"

}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 OpenMolcas/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # -- put a pymolcas wrapper in /usr/bin that finds the /opt install
  install -dm755 "${pkgdir}/usr/bin"

  cat > "${pkgdir}/usr/bin/pymolcas" <<script
#!/bin/sh
export MOLCAS=${_pfx}
exec ${_pfx}/pymolcas "\$@"
script

  chmod 755 "${pkgdir}/usr/bin/pymolcas"

}
