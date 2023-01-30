# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=xgboost
pkgname=python-$_pkgname
pkgver=1.7.3
pkgrel=4
pkgdesc='Gradient Boosting Library for Python'
arch=('x86_64')
url='https://xgboost.ai'
license=('Apache')
depends=('python-scikit-learn' 'python-pandas' 'python-matplotlib'
         'python-pyarrow' 'python-pytest')
makedepends=('cmake' 'python-setuptools')
optdepends=('apache-spark: Distributed XGBoost with PySpark'
            'cuda: GPU support')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname-git")
source=($_pkgname-$pkgver.tar.gz::"https://github.com/dmlc/xgboost/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('0b6aa86b93aec2b3e7ec6f53a696f8bbb23e21a03b369dc5a332c55ca57bc0c4')

prepare() {
  mkdir -p "$srcdir/build"

  # Checking if nvcc is in PATH
  if command -v nvcc &> /dev/null
  then
    _ACC=ON
    _CCPATH="/opt/cuda/bin"
    LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
    echo "GPU support is enabled"
  else
    _ACC=OFF
    _CCPATH="/usr/bin"
    echo "GPU support is disabled"
  fi
}

build() {
  cd "$srcdir/build"
  echo $_ACC
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_COMPILER="$_CCPATH/g++" \
    -DCMAKE_C_COMPILER="$_CCPATH/gcc" \
    -DPLUGIN_DENSE_PARSER=ON \
    -DPLUGIN_FEDERATED=ON \
    -DDMLC_HDFS_SHARED=ON \
    -DUSE_OPENMP=ON \
    -DUSE_CUDA=$_ACC \
    -DBUILD_WITH_CUDA_CUB=$_ACC
  make
}

package() {
  cd "$srcdir/$_pkgname/python-package"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1
}
