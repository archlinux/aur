# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.1.0
pkgrel=1
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask-multiphysics.org'
license=('AGPL-3.0-or-later')
petsc_excluded='3.26' # next PETSc release (exclude because API changes are expected)
makedepends=('gcc-fortran' 'cmake'
             'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
             "petsc<${petsc_excluded}" 'hdf5-openmpi' 'fftw-openmpi' 'zlib' 'libfyaml'
             'python-pandas' 'python-numpy' 'python-scipy' 'python-h5py-openmpi' 'python-matplotlib' 'python-pyaml'
             'vtk' 'fmt' 'verdict')
optdepends=('paraview: post-processing')
source=(https://damask-multiphysics.org/download/damask-${pkgver}.tar.xz
       'DAMASK_grid.1'
       'DAMASK_mesh.1')

sha512sums=('7e00d655601ab1c097505e4202713f0708bd6137b01fc5e47b162d788399fb95669c39f6df79bb699ede87fce502011f94cec37839cd774fb54a8b7dd1a5aeab'
            'd41eaae25bfb428661cb121ff89b80c6f146c997df40e1bd8736381c1ae73c0535d0886d6586edf34bb55d47629efa27d23058a044363c33f383f9ab097b91a4'
            '5ed3d30432a3999894f137da0eeed73985c3ba7155458b3c25dbda2b91b44c23a821da880881c71cd224945133ed8290da04ee1caa079533e746b6d0070e46be')

prepare() {
  sed -i 's#fs_case_sensitive(${CMAKE_INSTALL_PREFIX}/bin fs_is_case_sensitive)#set(fs_is_case_sensitive BOOL TRUE)#g' ${pkgname}-${pkgver}/src/CMakeLists.txt
}

build() {
  cmake -S ${pkgbase}-${pkgver} \
        -B build-test \
        -D TEST=ON \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-test

  cmake -S ${pkgbase}-${pkgver} \
        -B build-grid \
        -D GRID=ON \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Performance
  make -C build-grid

  cmake -S ${pkgbase}-${pkgver} \
        -B build-mesh \
        -D MESH=ON \
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
  ./build-mesh/src/DAMASK_mesh \
         -l "${example_dir}"/tensionZ_3g.yaml \
         -g "${example_dir}"/cube_3grains.msh \
         -m "${example_dir}"/material.yaml \
         -w $(mktemp -d)

  PYTHONPATH=${pkgbase}-${pkgver}/python:"${PYTHONPATH}"
  python -c "import damask;print(damask.__version__)"
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=("petsc<${petsc_excluded}" 'openmpi' 'hdf5-openmpi' 'libfyaml' 'zlib' 'fftw-openmpi')
  optdepends=('dream3d: pre-processing')

  install -m 644 -D ${pkgbase}-${pkgver}/examples/grid/* -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m 644 -D DAMASK_grid.1 -t "${pkgdir}"/usr/share/man/man1/
  install -m 644 -D DAMASK_grid.1 -T "${pkgdir}"/usr/share/man/man1/damask_grid.1
  install -m 644 -D  ${pkgbase}-${pkgver}/env/damask_grid -t "${pkgdir}"/usr/share/bash-completion/completions/
  install -m 644 -D  ${pkgbase}-${pkgver}/env/_damask_grid -t "${pkgdir}"/usr/share/zsh/site-functions/

  DESTDIR="${pkgdir}" cmake --install build-grid
  ln -s DAMASK_grid "${pkgdir}"/usr/bin/damask_grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=("petsc<${petsc_excluded}" 'openmpi' 'hdf5-openmpi' 'libfyaml')
  optdepends=('neper: pre-processing')

  install -m 644 -D ${pkgbase}-${pkgver}/examples/mesh/* -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m 644 -D DAMASK_mesh.1 -t "${pkgdir}"/usr/share/man/man1/
  install -m 644 -D DAMASK_mesh.1 -T "${pkgdir}"/usr/share/man/man1/damask_mesh.1
  install -m 644 -D  ${pkgbase}-${pkgver}/env/damask_mesh -t "${pkgdir}"/usr/share/bash-completion/completions/
  install -m 644 -D  ${pkgbase}-${pkgver}/env/_damask_mesh -t "${pkgdir}"/usr/share/zsh/site-functions/

  DESTDIR="${pkgdir}" cmake --install build-mesh
  ln -s DAMASK_mesh "${pkgdir}"/usr/bin/damask_mesh
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
