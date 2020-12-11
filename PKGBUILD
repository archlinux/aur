# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgbase=thundersvm
_pkgbase=thundersvm
pkgname=('thundersvm' 'python-thundersvm')
pkgver=0.3.4
pkgrel=3
pkgdesc="A Fast SVM Library on GPUs and CPUs"
url="https://github.com/Xtra-Computing/thundersvm"
license=('APL')
makedepends=(cuda cmake python-wheel python-setuptools chrpath)
arch=('x86_64')
source=("https://github.com/Xtra-Computing/${_pkgbase}/archive/v${pkgver}.tar.gz"
        "kernelmatrix_kernel.cu.patch")
sha256sums=('c8b4f7ece312a51ab72ef72e550f7ca3973f5328bc128df64158fe6e3b3b8c0e'
            'c2d9d6891f77268ee1c8de832b17d9cadf8fcc7008ce94ba9c1e04d70b3aa396')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  rm -rf build
  sed -i 's/c++11/c++14/g; s/CXX_STANDARD 11/CXX_STANDARD 14/g' CMakeLists.txt
  patch src/thundersvm/kernel/kernelmatrix_kernel.cu ../kernelmatrix_kernel.cu.patch
  mkdir build
  cd build
  cmake -DUSE_CUDA=ON ..
  make -j12
  cd ../python
  BUILD_TAG= python setup.py build
}

package_thundersvm() {
  provides=(thundersvm)
  depends=(cuda)
  conflicts=(thundersvm-cpu thundersvm-git)
  cd "$srcdir/$_pkgbase-$pkgver/build"
  chrpath -d bin/thundersvm-predict
  chrpath -d bin/thundersvm-train
  install -Dm755 bin/thundersvm-predict "$pkgdir/usr/bin/thundersvm-predict"
  install -Dm755 bin/thundersvm-train "$pkgdir/usr/bin/thundersvm-train"
  install -Dm755 lib/libthundersvm.so "$pkgdir/usr/lib/libthundersvm.so"
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-thundersvm() {
  provides=(python-thundersvm)
  depends=(thundersvm)
  conflicts=(python-thundersvm-cpu)
  cd "$srcdir/$_pkgbase-$pkgver/python"
  BUILD_TAG= python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
