# Maintainer: Dmitry Popov <ixaphire@gmail.com>

_name=xgboost
pkgbase=xgboost-git
pkgname=('xgboost-git'
         'python-xgboost-git')
pkgver=r4049.911a90283
pkgrel=1
url='https://github.com/dmlc/xgboost'
license=('APACHE')
source=('git+https://github.com/dmlc/xgboost.git'
        'git+https://github.com/dmlc/dmlc-core'
        'git+https://github.com/dmlc/rabit'
        'git+https://github.com/NVlabs/cub'
        'python_no_libs.patch')
makedepends=('python-setuptools')
arch=('x86_64')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4940b84afffe9c2be646d0f77bcfb0d8d36aadcabc4a83b40113e1d97ae917b5')

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_name}"
  git submodule init
  git config submodule.dmlc-core.url "${srcdir}/dmlc-core"
  git config submodule.rabit.url "${srcdir}/rabit"
  git config submodule.cub.url "${srcdir}/cub"
  git submodule update
  patch -p1 < "${srcdir}/python_no_libs.patch"
}

build() {
  cd "${_name}"
  mkdir build
  cd build
  cmake .. # -DUSE_CUDA=ON
  make
}

package_xgboost-git() {
  pkgdesc='An optimized distributed gradient boosting library designed to be highly efficient, flexible and portable'
  provides=('xgboost')
  conflicts=('xgboost')
  optdepends=('python-xgboost-git: Python 3 Wrapper')

  cd "${_name}"

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install main executable
  install -Dm755 "xgboost" "${pkgdir}/usr/bin/xgboost"

  # Install shared libraries
  mkdir -p "${pkgdir}/usr/lib"
  install -Dm644 lib/*.so "${pkgdir}/usr/lib"

  # Install includes
  mkdir -p "${pkgdir}/usr/include"
  cp -r include/xgboost "${pkgdir}/usr/include"
  cp -r dmlc-core/include/dmlc "${pkgdir}/usr/include"
  cp -r rabit/include/rabit "${pkgdir}/usr/include"

  # Copy the demos to opt/xgboost
  mkdir -p "${pkgdir}"/opt/xgboost
  cp -r demo "${pkgdir}"/opt/xgboost
}

package_python-xgboost-git() {
  pkgdesc='XGBoost Python 3 wrapper'
  depends=('xgboost'
           'python'
           'python-numpy'
           'python-scipy')
  conflicts=('python-xgboost')
  provides=('python-xgboost')

  cd "${_name}/python-package"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
