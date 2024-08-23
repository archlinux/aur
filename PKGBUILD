# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.0
pkgrel=2
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask-multiphysics.org'
license=('AGPL-3.0-or-later')
makedepends=('cmake' 'python-setuptools'
             'petsc<3.22' 'hdf5-openmpi' 'fftw-openmpi' 'zlib' 'libfyaml'
             'python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
optdepends=('paraview: post-processing')
source=(https://damask-multiphysics.org/download/damask-${pkgver}.tar.xz)

sha512sums=('f8e2f398c558f90ed4cac8fa60d57bd179a98f1d437ed0b5a5bd9801354cf74f12dba40551dbeabe00ad6e53709bd2daa3b64f759f3170c4766d8795d3f76483')

build() {
  cmake -S ${pkgbase}-${pkgver} \
        -B build-test \
        -D DAMASK_SOLVER:STRING=test \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-test

  cmake -S ${pkgbase}-${pkgver} \
        -B build-grid \
        -D DAMASK_SOLVER:STRING=grid \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-grid

  cmake -S ${pkgbase}-${pkgver} \
        -B build-mesh \
        -D DAMASK_SOLVER:STRING=mesh \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-mesh

  cd ${pkgbase}-${pkgver}/python
  python -m build --wheel --no-isolation
}

check() {
  mpirun -np 2 build-test/src/DAMASK_test

  example_dir=$(pwd)/${pkgbase}-${pkgver}/examples/grid
  mpirun -np 2 build-grid/src/DAMASK_grid \
         -l ${example_dir}/tensionX.yaml \
         -g ${example_dir}/20grains16x16x16.vti \
         -m ${example_dir}/material.yaml \
         -w $(mktemp -d)

  example_dir=$(pwd)/${pkgbase}-${pkgver}/examples/mesh
  mpirun -np 2 build-mesh/src/DAMASK_mesh \
         -l ${example_dir}/tensionY_mono.yaml \
         -g ${example_dir}/monocrystal.msh \
         -m ${example_dir}/material.yaml \
         -w $(mktemp -d)

  PYTHONPATH=${pkgbase}-${pkgver}/python:${PYTHONPATH}
  python -c "import damask;print(damask.__version__)"
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=('petsc<3.22' 'openmpi' 'hdf5-openmpi' 'libfyaml' 'zlib' 'fftw-openmpi')
  optdepends=('dream3d: pre-processing')

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver}/examples/grid/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc<3.22' 'openmpi' 'hdf5-openmpi' 'libfyaml')
  optdepends=('neper: pre-processing')

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver}/examples/mesh/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-mesh
}

package_python-damask() {
  pkgdesc='Pre- and post-processing tools for DAMASK'
  depends=('python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
  optdepends=('python-seaborn: post-processing'
              'jupyterlab: comfortable shell'
              'ipython: comfortable shell')

  python -m installer --destdir=${pkgdir} ${pkgbase}-${pkgver}/python/dist/*.whl
}

package_damask() {
  depends=('python-damask' 'damask-grid' 'damask-mesh')

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver}/examples/config/* ${pkgdir}/usr/share/doc/${pkgname}/

}
