# Maintainer: Scott Gigante <scottgigante@gmail.com>

_name=torch_geometric
_fullname=py$_name
pkgbase=python-$_fullname
pkgname=("python-$_fullname" "python-$_fullname-cuda")
pkgver=1.6.3
pkgrel=1
pkgdesc='Geometric Deep Learning Extension Library for PyTorch'
arch=(any)
url="https://github.com/rusty1s/$_fullname"
license=(MIT)
depends=(python gcc cuda cmake python-setuptools python-pytest python-pytest-cov python-mock python-trimesh python-pytorch python-pytorch_scatter python-pytorch_cluster python-pytorch_spline_conv python-pytorch_sparse)
_tarball="${_name}-${pkgver}.tar.gz"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1907c0f5eb7ab8f6f79a7e43703579b39b514501dd956ed0fc3d33210bcbb4c2')
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
    # skip test requiring torchvision
    rm test/transforms/test_to_superpixels.py
    # skip test requiring gdist
    rm test/utils/test_geodesic.py
    # skip test requiring compilation with METIS
    rm test/data/test_cluster.py
    python setup.py test
    cd ..
}

_package() {
    cd $_srcdir
    python setup.py bdist_wheel
    local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
    mkdir -p "$site"
    unzip "$(ls -1 dist/${_name}-${pkgver}-*.whl)" -d "$site"
    cd ..
}


package_python-pytorch_geometric() {
  _package
}


package_python-pytorch_geometric-cuda() {
  pkgdesc="Geometric Deep Learning Extension Library for PyTorch (with CUDA)"
  depends+=(cuda cudnn python-pytorch-cuda python-pytorch_scatter-cuda python-pytorch_cluster-cuda python-pytorch_spline_conv-cuda python-pytorch_sparse-cuda)
  conflicts=(python-pytorch_geometric)
  provides=(python-pytorch_geometric)
  
  export CUDA_HOME=/opt/cuda
  export PATH=$CUDA_HOME/bin:$PATH
  export CPATH=$CUDA_HOME/include:$CPATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
  _package
}