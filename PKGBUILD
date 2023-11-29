# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.0~alpha8
pkgver_=3.0.0-alpha8
pkgrel=2
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask.mpie.de'
license=('AGPL3')
makedepends=('cmake' 'python-setuptools'
             'petsc<3.21' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml'
             'python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
optdepends=('paraview: post-processing')
source=(https://damask.mpie.de/download/damask-${pkgver_}.tar.xz)

sha256sums=('f62c38123213d1c1fe2eb8910b0ffbdc1cac56273c2520f3b64a553363190b9d')


build() {
  cmake -S ${pkgbase}-${pkgver_} -B build-test -DDAMASK_SOLVER=test -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-test --parallel

  cmake -S ${pkgbase}-${pkgver_} -B build-grid -DDAMASK_SOLVER=grid -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-grid --parallel

  cmake -S ${pkgbase}-${pkgver_} -B build-mesh -DDAMASK_SOLVER=mesh -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-mesh --parallel

  cd ${pkgbase}-${pkgver_}/python
  python -m build --wheel --no-isolation
}

check() {
  mpirun -np 2 build-test/src/DAMASK_test

  example_dir=${pkgbase}-${pkgver_}/examples/grid
  mpirun -np 2 build-grid/src/DAMASK_grid -l ${example_dir}/tensionX.yaml -m ${example_dir}/material.yaml -g ${example_dir}/20grains16x16x16.vti

  PYTHONPATH=${pkgbase}-${pkgver_}/python:${PYTHONPATH}
  python -c "import damask;print(damask.__version__)"
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=('petsc<3.21' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml')
  optdepends=('dream3d: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/grid/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc<3.21' 'hdf5-openmpi' 'libfyaml')
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
