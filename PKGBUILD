# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.0~beta
pkgver_=3.0.0-beta
pkgrel=1
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask.mpie.de'
license=('AGPL3')
makedepends=('cmake' 'python-setuptools'
             'petsc<3.21' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml'
             'python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
optdepends=('paraview: post-processing')
source=(https://damask.mpie.de/download/damask-${pkgver_}.tar.xz)

sha512sums=('5ecf85c9e51f55275eec27a3ef369a71970d3ad9b4daaab5890861b769bee2f985d86d075eea5bdd9664e45107e427ee127d1857a5f38eb4edeb9974b842eef4')


build() {
  cmake -S ${pkgbase}-${pkgver_} \
        -B build-test \
        -D DAMASK_SOLVER:STRING=test \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-test

  cmake -S ${pkgbase}-${pkgver_} \
        -B build-grid \
        -D DAMASK_SOLVER:STRING=grid \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-grid

  cmake -S ${pkgbase}-${pkgver_} \
        -B build-mesh \
        -D DAMASK_SOLVER:STRING=mesh \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-mesh

  cd ${pkgbase}-${pkgver_}/python
  python -m build --wheel --no-isolation
}

check() {
  mpirun -np 2 build-test/src/DAMASK_test

  example_dir=$(pwd)/${pkgbase}-${pkgver_}/examples/grid
  mpirun -np 2 build-grid/src/DAMASK_grid \
         -l ${example_dir}/tensionX.yaml \
         -g ${example_dir}/20grains16x16x16.vti \
         -m ${example_dir}/material.yaml \
         -w $(mktemp -d)

  example_dir=$(pwd)/${pkgbase}-${pkgver_}/examples/mesh
  mpirun -np 2 build-mesh/src/DAMASK_mesh \
         -l ${example_dir}/tensionY_mono.yaml \
         -g ${example_dir}/monocrystal.msh \
         -m ${example_dir}/material.yaml \
         -w $(mktemp -d)

  PYTHONPATH=${pkgbase}-${pkgver_}/python:${PYTHONPATH}
  python -c "import damask;print(damask.__version__)"
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=('petsc<3.21' 'openmpi' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml')
  optdepends=('dream3d: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/grid/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc<3.21' 'openmpi' 'hdf5-openmpi' 'libfyaml')
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
