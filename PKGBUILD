# Maintainer: Scott Gigante <scottgigante@gmail.com>

_name=torch_spline_conv
_fullname=py$_name
pkgbase=python-$_fullname
pkgname=("python-$_fullname" "python-$_fullname-cuda")
pkgver=1.2.0
pkgrel=1
pkgdesc='Implementation of the Spline-Based Convolution Operator of SplineCNN in PyTorch'
arch=(any)
url="https://github.com/rusty1s/$_fullname"
license=(MIT)
depends=(python gcc cuda cmake python-setuptools python-pytest python-pytest-cov python-pytorch)
_tarball="${_name}-${pkgver}.tar.gz"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ab8da41357c8a4785662366655bb6dc5e84fd0e938008194955409aefe535009')
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
    unzip "$(ls -1 dist/${_name}-${pkgver}-*.whl)" -d "$site"
    rm -r ${site}/test
    cd ..
}


package_python-pytorch_spline_conv() {
  _package
}


package_python-pytorch_spline_conv-cuda() {
  pkgdesc="Implementation of the Spline-Based Convolution Operator of SplineCNN in PyTorch (with CUDA)"
  depends+=(cuda cudnn python-pytorch-cuda)
  conflicts=(python-pytorch_spline_conv)
  provides=(python-pytorch_spline_conv)
  
  export CUDA_HOME=/opt/cuda
  export PATH=$CUDA_HOME/bin:$PATH
  export CPATH=$CUDA_HOME/include:$CPATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
  _package
}