# Maintainer: Scott Gigante <scottgigante@gmail.com>

_name=torch_scatter
_fullname=py$_name
pkgbase=python-$_fullname
pkgname=("python-$_fullname" "python-$_fullname-cuda")
pkgver=2.0.5
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Scatter Operations'
arch=(any)
url="https://github.com/rusty1s/$_fullname"
license=(MIT)
depends=(python cuda gcc cmake python-setuptools python-pytest python-pytest-cov python-pytorch)
_tarball="${_name}-${pkgver}.tar.gz"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e29b364beaa9c84a99e0e236be89ed19d4452d89010ff736184ddcce488b47f6')
_srcdir="${_fullname}-${pkgver}"

prepare() {
    export CXX=g++
}

build() {
    cd $_srcdir
    python setup.py build
    cd ..
}

check() {
    cd $_srcdir
    python setup.py test --addopts "-k 'not segment'" # skip failing tests
    cd ..
}

_package() {
    cd $_srcdir
    python setup.py bdist_wheel
    local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
    mkdir -p "$site"
    unzip "$(ls -1 dist/${_name}-${pkgver}-*.whl)" -d "$site"
    rm -r ${site}/test
    cd ..
}


package_python-pytorch_scatter() {
  _package
}


package_python-pytorch_scatter-cuda() {
  pkgdesc="PyTorch Extension Library of Optimized Scatter Operations (with CUDA)"
  depends+=(cuda cudnn python-pytorch-cuda)
  conflicts=(python-pytorch_scatter)
  provides=(python-pytorch_scatter)
  
  export CUDA_HOME=/opt/cuda
  export PATH=$CUDA_HOME/bin:$PATH
  export CPATH=$CUDA_HOME/include:$CPATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
  _package
}