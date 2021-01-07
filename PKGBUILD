# Maintainer: Scott Gigante <scottgigante@gmail.com>

_name=torch_sparse
_fullname=py$_name
pkgbase=python-$_fullname
pkgname=("python-$_fullname" "python-$_fullname-cuda")
pkgver=0.6.8
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Autograd Sparse Matrix Operations'
arch=(any)
url="https://github.com/rusty1s/$_fullname"
license=(MIT)
depends=(python gcc cuda cmake python-scipy python-setuptools python-pytest python-pytest-cov python-pytorch python-pytorch_scatter)
_tarball="${_name}-${pkgver}.tar.gz"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('98f7ff1f0f9cd5031bc81c70c11970c3864545ae33677025a6efd2466a97e6f9')
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
    # skip test requiring compilation with METIS
    python setup.py test --addopts "-k 'not metis'"
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


package_python-pytorch_sparse() {
  _package
}


package_python-pytorch_sparse-cuda() {
  pkgdesc="PyTorch Extension Library of Optimized Autograd Sparse Matrix Operations (with CUDA)"
  depends+=(cuda cudnn python-pytorch-cuda python-pytorch_scatter-cuda)
  conflicts=(python-pytorch_sparse)
  provides=(python-pytorch_sparse)
  
  export CUDA_HOME=/opt/cuda
  export PATH=$CUDA_HOME/bin:$PATH
  export CPATH=$CUDA_HOME/include:$CPATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
  _package
}