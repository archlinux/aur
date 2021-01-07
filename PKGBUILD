# Maintainer: Scott Gigante <scottgigante@gmail.com>

_name=torch_cluster
_fullname=py$_name
pkgbase=python-$_fullname
pkgname=("python-$_fullname" "python-$_fullname-cuda")
pkgver=1.5.8
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Graph Cluster Algorithms'
arch=(any)
url="https://github.com/rusty1s/$_fullname"
license=(MIT)
depends=(python gcc cmake python-scipy python-setuptools python-pytest python-pytest-cov python-pytorch)

_tarball="${_name}-${pkgver}.tar.gz"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('95c6e81e9c4a6235e1b2152ab917021d2060ad995199f6bd7fb39986d37310f0')
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
    python setup.py test
    cd ..
}

_package() {
    cd $_srcdir
    python setup.py bdist_wheel
    local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
    mkdir -p "$site"
    unzip "$(ls -1 dist/${_name}-$pkgver-*.whl)" -d "$site"
    rm -r ${site}/test
    cd ..
}

package_python-pytorch_cluster() {
  _package
}


package_python-pytorch_cluster-cuda() {
  pkgdesc="PyTorch Extension Library of Optimized Graph Cluster Algorithms (with CUDA)"
  depends+=(cuda cudnn python-pytorch-cuda)
  conflicts=(python-pytorch_cluster)
  provides=(python-pytorch_cluster)
  
  export CUDA_HOME=/opt/cuda
  export PATH=$CUDA_HOME/bin:$PATH
  export CPATH=$CUDA_HOME/include:$CPATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
  _package
}
