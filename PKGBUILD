# Maintainer: Dmitry Popov <ixaphire@gmail.com>

_name=xgboost
pkgbase=xgboost-git
pkgname=('xgboost-git'
         'python-xgboost-git'
         'python2-xgboost-git')
pkgver=r2737.c9a73fe
pkgrel=1
url='https://github.com/dmlc/xgboost'
license=('APACHE')
source=('git+https://github.com/dmlc/xgboost.git'
        'git+https://github.com/dmlc/dmlc-core'
        'git+https://github.com/dmlc/rabit'
        'python_no_libs.patch'
        'xgboost_fix_missing_include.patch')
makedepends=('python2-setuptools' 'python-setuptools')
arch=('x86_64')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'fd317b9708da75b4e2e304b5c2eacbb4b766bb38044e3a26ce55d077c2e13048'
            '5c22abd1a58f0b6da16687e3083a3dbbb961f30f0de359c5637cdbc1948459af')

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_name}"
  git submodule init
  git config submodule.dmlc-core.url "${srcdir}/dmlc-core"
  git config submodule.rabit.url "${srcdir}/rabit"
  git submodule update
  patch -p1 < "${srcdir}/python_no_libs.patch"
  grep -qF '<cmath>' src/tree/param.h || patch -p1 < "${srcdir}/xgboost_fix_missing_include.patch"
}

build() {
  cd "${_name}"
  make
}

package_xgboost-git() {
  pkgdesc='An optimized distributed gradient boosting library designed to be highly efficient, flexible and portable'
  provides=('xgboost')
  conflicts=('xgboost')
  optdepends=('python-xgboost-git: Python 3 Wrapper'
              'python2-xgboost-git: Python 2 Wrapper')

  cd "${_name}"

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install main executable
  install -Dm755 "xgboost" "${pkgdir}/usr/bin/xgboost"

  # Install shared libraries
  mkdir -p "${pkgdir}/usr/lib"
  install -Dm644 lib/*.a "${pkgdir}/usr/lib"
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

package_python2-xgboost-git() {
  pkgdesc='XGBoost Python 2 wrapper'
  depends=('xgboost'
           'python2'
           'python2-numpy'
           'python2-scipy')
  conflicts=('python2-xgboost')
  provides=('python2-xgboost')

  cd "${_name}/python-package"

  python2 setup.py install --root="${pkgdir}" --optimize=1
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
