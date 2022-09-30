# Maintainer: Martin Diehl <martin.diehl@kuleuven.be>
pkgbase=damask
pkgname=('damask' 'damask-grid' 'damask-mesh' 'python-damask')
pkgver=3.0.0~alpha6
pkgver_=3.0.0-alpha6
pkgrel=3
pkgdesc='DAMASK - The Duesseldorf Advanced Material Simulation Kit'
arch=('x86_64')
url='https://damask.mpie.de'
license=('AGPL3')
makedepends=('cmake' 'python-setuptools'
             'petsc' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml'
             'python-matplotlib' 'python-scipy' 'python-pandas' 'python-h5py' 'python-pyaml')
optdepends=('paraview: post-processing')
source=(https://damask3.mpie.de/download/damask-${pkgver_}.tar.xz
        0001-PETSc-3.17.1-backport.patch)

sha256sums=('de6748c285558dec8f730c4301bfa56b4078c130ff80e3095faf76202f8d2109'
            'd810807b097512c275ff43f66873117f54a190ab9cd2696c24f6c6cb1792ae1c')

prepare() {
    cd "$pkgname-$pkgver_"
    patch --forward --strip=1 --input="${srcdir}/0001-PETSc-3.17.1-backport.patch"
}

build() {
  cmake -S ${pkgbase}-${pkgver_} -B build-grid -DDAMASK_SOLVER=grid -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-grid

  cmake -S ${pkgbase}-${pkgver_} -B build-mesh -DDAMASK_SOLVER=mesh -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Performance
  cmake --build build-mesh

  cd ${pkgbase}-${pkgver_}/python
  python setup.py build_ext --inplace
  python setup.py build
}

package_damask-grid() {
  pkgdesc='Grid solver for DAMASK'
  depends=('petsc' 'hdf5-openmpi' 'fftw' 'zlib' 'libfyaml')
  optdepends=('dream3d: pre-processing')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/grid/* ${pkgdir}/usr/share/doc/${pkgname}/

  DESTDIR=${pkgdir} cmake --install build-grid
}

package_damask-mesh() {
  pkgdesc='Mesh solver for DAMASK'
  depends=('petsc' 'hdf5-openmpi' 'libfyaml')
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

  cd ${pkgbase}-${pkgver_}/python
  python setup.py install --skip-build --root=${pkgdir} --optimize=1
}

package_damask() {
  depends=('python-damask' 'damask-grid' 'damask-mesh')

  install -Dm644 ${pkgbase}-${pkgver_}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -r ${pkgbase}-${pkgver_}/examples/config/* ${pkgdir}/usr/share/doc/${pkgname}/

}
