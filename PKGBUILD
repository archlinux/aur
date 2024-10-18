# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.1
pkgrel=1
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask-multiphysics.org'
license=('AGPL-3.0-or-later')
makedepends=('cmake' 'python-setuptools'
             'petsc<3.23' 'hdf5-openmpi' 'fftw-openmpi' 'zlib' 'libfyaml'
             'python-pandas' 'python-numpy' 'python-scipy' 'python-h5py' 'vtk' 'python-matplotlib' 'python-pyaml')
optdepends=('paraview: post-processing')
source=(https://damask-multiphysics.org/download/damask-${pkgver}.tar.xz
       'DAMASK_grid.1'
       'DAMASK_mesh.1')

sha512sums=('d1cfad44877925be3c497c6decb9c453d5598e9aebbf41641d230467666c25aa88a6cd1af2dc7f1c9abfd958340ddae880edab788d8c7e49d911a732f60b9728'
            '9f0a5afc8c535bca3378082e8b854d15add575b4797711b86eb526547aca8c7436c41fe0704a85a5b62073f227ee8df66ff9c62db2a78c53ed9fb1da489e1ef5'
            '9399544369ca0900664d7b8a5b99e350121715f5990fd50a1f5eee766e65303806fb3b116439547741155ac97918f002703eadbd53a9db55ff8b137cc8c97141')

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
  depends=('petsc<3.22' 'openmpi' 'hdf5-openmpi' 'libfyaml' 'zlib' 'fftw-openmpi')
  optdepends=('dream3d: pre-processing')

  install -m 644 -D ${pkgbase}-${pkgver}/examples/grid/* -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m 644 -D DAMASK_grid.1 -t "${pkgdir}"/usr/share/man/man1/

  DESTDIR="${pkgdir}" cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc<3.22' 'openmpi' 'hdf5-openmpi' 'libfyaml')
  optdepends=('neper: pre-processing')

  install -m 644 -D ${pkgbase}-${pkgver}/examples/mesh/* -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m 644 -D DAMASK_mesh.1 -t "${pkgdir}"/usr/share/man/man1/

  DESTDIR="${pkgdir}" cmake --install build-mesh
}

package_python-damask() {
  pkgdesc='Pre- and post-processing tools for DAMASK'
  depends=('python-pandas' 'python-numpy' 'python-scipy' 'python-h5py' 'vtk' 'python-matplotlib' 'python-pyaml')
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
