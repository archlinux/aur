# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.2
pkgrel=1
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask-multiphysics.org'
license=('AGPL-3.0-or-later')
makedepends=('gcc-fortran' 'cmake'
             'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
             'petsc<3.24' 'hdf5-openmpi' 'fftw-openmpi' 'zlib' 'libfyaml'
             'python-pandas' 'python-numpy' 'python-scipy' 'python-h5py-openmpi' 'python-matplotlib' 'python-pyaml'
             'vtk' 'fmt' 'verdict')
optdepends=('paraview: post-processing')
source=(https://damask-multiphysics.org/download/damask-${pkgver}.tar.xz
       'DAMASK_grid.1'
       'DAMASK_mesh.1')

sha512sums=('b1e5970560e95f23766f8bfe660da5da401eb3f57123c53687153cf5e56d3c41be62729431b7f5f1e6a6a5f7269e9eafd317fb5f975e0efd4edf33b361665dd6'
            'e492860add4f7b4b94f53e02f45ef059abacae0deb44c8946c583aedd77df8cc8ba4bd062449c979049b8e08d604c06601c871c5f5f09d8bf5b4fac4acb381ea'
            'a361a5c2edeb9186ca1073c93feae5fa34d1a7b4106745be8568be658f86de466b1974ead6a67a88c84e8752421662116e20ea8e4ca89e36fdcb304f8cfb619c')

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

  example_dir="$(pwd)"/${pkgbase}-${pkgver}/examples/grid
  mpirun -np 2 build-grid/src/DAMASK_grid \
         -l "${example_dir}"/tensionX.yaml \
         -g "${example_dir}"/20grains16x16x16.vti \
         -m "${example_dir}"/material.yaml \
         -w $(mktemp -d)

  example_dir="$(pwd)"/${pkgbase}-${pkgver}/examples/mesh
  mpirun -np 2 build-mesh/src/DAMASK_mesh \
         -l "${example_dir}"/tensionY_mono.yaml \
         -g "${example_dir}"/monocrystal.msh \
         -m "${example_dir}"/material.yaml \
         -w $(mktemp -d)

  PYTHONPATH=${pkgbase}-${pkgver}/python:"${PYTHONPATH}"
  python -c "import damask;print(damask.__version__)"
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=('petsc<3.24' 'openmpi' 'hdf5-openmpi' 'libfyaml' 'zlib' 'fftw-openmpi')
  optdepends=('dream3d: pre-processing')

  install -m 644 -D ${pkgbase}-${pkgver}/examples/grid/* -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m 644 -D DAMASK_grid.1 -t "${pkgdir}"/usr/share/man/man1/

  DESTDIR="${pkgdir}" cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc<3.24' 'openmpi' 'hdf5-openmpi' 'libfyaml')
  optdepends=('neper: pre-processing')

  install -m 644 -D ${pkgbase}-${pkgver}/examples/mesh/* -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m 644 -D DAMASK_mesh.1 -t "${pkgdir}"/usr/share/man/man1/

  DESTDIR="${pkgdir}" cmake --install build-mesh
}

package_python-damask() {
  pkgdesc='Pre- and post-processing tools for DAMASK'
  depends=('python-pandas' 'python-numpy' 'python-scipy' 'python-h5py-openmpi' 'vtk' 'python-matplotlib' 'python-pyaml')
  optdepends=('python-seaborn: post-processing'
              'jupyterlab: comfortable shell'
              'ipython: comfortable shell')

  python -m installer --destdir="${pkgdir}" ${pkgbase}-${pkgver}/python/dist/*.whl
}

package_damask() {
  depends=('python-damask' 'damask-grid' 'damask-mesh')

  install -m 755 -d "${pkgdir}"/usr/share/doc/${pkgname}/
  cp -r ${pkgbase}-${pkgver}/examples/config/* ${pkgdir}/usr/share/doc/${pkgname}/

}
