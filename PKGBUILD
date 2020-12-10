# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgbase=thundersvm-cpu
_pkgbase=thundersvm
pkgname=('thundersvm-cpu' 'python-thundersvm-cpu')
pkgver=0.3.4
pkgrel=2
pkgdesc="A Fast SVM Library on GPUs and CPUs"
url="https://github.com/Xtra-Computing/thundersvm"
license=('APL')
makedepends=(eigen cmake python-wheel python-setuptools chrpath)
arch=('x86_64')
source=("https://github.com/Xtra-Computing/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('c8b4f7ece312a51ab72ef72e550f7ca3973f5328bc128df64158fe6e3b3b8c0e')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  rm -rf build
  mkdir build
  cd build
  cmake -E env CXXFLAGS="-I/usr/include/eigen3" cmake -DUSE_CUDA=OFF -DUSE_EIGEN=ON ..
  make -j12
  cd ../python
  BUILD_TAG= python setup.py build
}

package_thundersvm-cpu() {
  provides=(thundersvm)
  depends=(eigen)
  conflicts=(thundersvm thundersvm-git)
  cd "$srcdir/$_pkgbase-$pkgver/build"
  chrpath -d bin/thundersvm-predict
  chrpath -d bin/thundersvm-train
  install -Dm755 bin/thundersvm-predict "$pkgdir/usr/bin/thundersvm-predict"
  install -Dm755 bin/thundersvm-train "$pkgdir/usr/bin/thundersvm-train"
  install -Dm755 lib/libthundersvm.so "$pkgdir/usr/lib/libthundersvm.so"
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-thundersvm-cpu() {
  provides=(python-thundersvm)
  depends=(thundersvm-cpu)
  conflicts=(python-thundersvm)
  cd "$srcdir/$_pkgbase-$pkgver/python"
  BUILD_TAG= python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
