# Maintainer: Dmitry Popov <ixaphire@gmail.com>

_with_r=false
_with_cuda=false

_name=xgboost
pkgbase=xgboost-git
pkgname=('xgboost-git'
         'python-xgboost-git')
if $_with_r; then
  pkgname+=('r-xgboost-git')
fi
pkgver=r6119.b05abfc49
pkgrel=1
url='https://github.com/dmlc/xgboost'
license=('APACHE')
source=('git+https://github.com/dmlc/xgboost.git'
        'git+https://github.com/dmlc/dmlc-core'
        'git+https://github.com/dmlc/rabit'
        'git+https://github.com/NVlabs/cub'
        'python_no_libs.patch')
makedepends=('python-setuptools')
if $_with_r; then
  makedepends+=('r' 'r-stringi' 'r-magrittr' 'r-data.table')
fi
if $_with_cuda; then
  makedepends+=('cuda')
fi
arch=('x86_64')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
  local cmake_args=()

  cd "${_name}"
  mkdir build && cd build

  if $_with_r; then
    cmake_args+=('-DR_LIB=ON')
  fi
  if $_with_cuda; then
    cmake_args+=('-DUSE_CUDA=ON' '-DBUILD_WITH_CUDA_CUB=ON')
    if [ -n "$_compute_ver" ]; then
      cmake_args+=("-DGPU_COMPUTE_VER=$_compute_ver")
    fi
  fi

  if $_with_cuda; then
    CC=/opt/cuda/bin/gcc CXX=/opt/cuda/bin/g++ cmake .. ${cmake_args[@]}
  else
    cmake .. ${cmake_args[@]}
  fi

  make

  if $_with_r; then
    mv ../lib/{,lib}xgboost.so
    # based on xgboost/cmake/Utils.cmake:setup_rpackage_install_target:
    rm -r R-package
    cp -r ../R-package .
    rm -r R-package/{src,configure}
    mkdir R-package/src
    cp ../lib/libxgboost.so R-package/src/xgboost.so
    echo "all:" > R-package/src/Makevars

    mkdir "${srcdir}/R-${_name}"
    R CMD INSTALL --no-multiarch --build R-package -l "${srcdir}/R-${_name}"
  fi
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

if $_with_r; then

package_r-xgboost-git() {
  pkgdesc='XGBoost R wrapper'
  depends=('r'
           'r-stringi'
           'r-magrittr'
           'r-data.table')
  conflicts=('r-xgboost')
  provides=('r-xgboost')

  cd "${_name}/build"

  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${srcdir}/R-${_name}/${_name}" "${pkgdir}/usr/lib/R/library"
}

fi

# vim:set ts=2 sw=2 et:
