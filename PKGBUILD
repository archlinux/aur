# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.0~alpha7
pkgver_=3.0.0-alpha7
pkgrel=3
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask.mpie.de'
license=('AGPL3')
makedepends=('cmake' 'python-setuptools'
             'petsc<3.20' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml'
             'python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
optdepends=('paraview: post-processing')
source=(https://damask.mpie.de/download/damask-${pkgver_}.tar.xz
        CMakeLists.patch
        setup.patch)

sha256sums=('442b06b824441293e72ff91b211a555c5d497aedf62be1c4332c426558b848a4'
            '296d2401fdbab78083a68366bfd0c9ac0ace096305ea9acbed0581d265be4f87'
            'c98b009ac98952528d3d50a0844d433b8635206df3e0525a8018ad68c6fad947')

prepare() {
    sed -i '24s/18/19/g' ${pkgname}-${pkgver_}/src/CLI.f90
    sed -i '14s/19/20/g' ${pkgname}-${pkgver_}/CMakeLists.txt
    sed -i '73d;75d;77d' ${pkgname}-${pkgver_}/src/mesh/discretization_mesh.f90
    sed -i '92i    DMAddField, &' ${pkgname}-${pkgver_}/src/mesh/mesh_mech_FEM.f90
    patch ${pkgname}-${pkgver_}/src/CMakeLists.txt "${srcdir}/CMakeLists.patch"
    patch ${pkgname}-${pkgver_}/python/setup.cfg "${srcdir}/setup.patch"
}

build() {
  cmake -S ${pkgbase}-${pkgver_} -B build-grid -DDAMASK_SOLVER=grid -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-grid --parallel

  cmake -S ${pkgbase}-${pkgver_} -B build-mesh -DDAMASK_SOLVER=mesh -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-mesh --parallel

  cd ${pkgbase}-${pkgver_}/python
  python -m build --wheel --no-isolation
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=('petsc<3.20' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml')
  optdepends=('dream3d: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/grid/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc<3.20' 'hdf5-openmpi' 'libfyaml')
  optdepends=('neper: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/mesh/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-mesh
}

package_python-damask() {
  pkgdesc='Pre- and post-processing tools for DAMASK'
  depends=('python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
  optdepends=('python-seaborn: post-processing'
              'jupyterlab: comfortable shell'
              'ipython: comfortable shell')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  python -m installer --destdir=${pkgdir} ${pkgbase}-${pkgver_}/python/dist/*.whl
}

package_damask() {
  depends=('python-damask' 'damask-grid' 'damask-mesh')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/config/* ${pkgdir}/usr/share/doc/${pkgname}/

}
