# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.0~alpha5
pkgver_=3.0.0-alpha5
pkgrel=2
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask.mpie.de'
license=('GPL3')
makedepends=('cmake' 'python-setuptools')
optdepends=('paraview: post-processing')
source=(https://damask3.mpie.de/download/damask-${pkgver_}.tar.xz)
sha256sums=('2d2b10901959c26a5bb5c52327cdafc7943bc1b36b77b515b0371221703249ae')


build() {
  cmake -S ${pkgbase}-${pkgver_} -B build-grid -DDAMASK_SOLVER=grid -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-grid

  cmake -S ${pkgbase}-${pkgver_} -B build-mesh -DDAMASK_SOLVER=mesh -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-mesh

  cd ${pkgbase}-${pkgver_}/python
  python setup.py build_ext --inplace
  python setup.py build
}

package_damask-grid() {
  depends=('petsc' 'hdf5-openmpi' 'fftw')
  optdepends=('dream3d: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/grid/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-grid
}

package_damask-mesh() {
  depends=('petsc' 'hdf5-openmpi')
  optdepends=('neper: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/mesh/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-mesh
}

package_python-damask() {
  depends=('python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
  optdepends=('python-seaborn: post-processing'
              'jupyterlab: comfortable shell'
              'ipython: comfortable shell')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd ${pkgbase}-${pkgver_}/python
  python setup.py install --skip-build --root=${pkgdir} --optimize=1
}

package_damask() {
  depends=('python-damask' 'damask-grid' 'damask-mesh')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/config/* ${pkgdir}/usr/share/doc/${pkgname}/

}
