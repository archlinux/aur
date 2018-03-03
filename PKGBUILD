# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-storage
pkgname=python2-$_name
pkgver=1.1.0
pkgrel=2
pkgdesc="Microsoft Azure Storage Library for Python"
arch=('any')
url="https://github.com/Azure/azure-storage-python"
license=('Apache')
makedepends=('python2-setuptools')
source=("https://github.com/Azure/azure-storage-python/archive/v${pkgver}-common.tar.gz"
        "setup.patch")
md5sums=('4e7833d17443e6552a2e0b2d9f1e5657'
         '3529e82ae379ecaa14a938fda53275a1')

_packages=('azure-storage-common' 'azure-storage-blob'
           'azure-storage-file' 'azure-storage-queue')
build() {
  cd "$_name-python-${pkgver}-common"
  patch -p1 < ../setup.patch

  for package in ${_packages[@]}
  do
    cd $package
    python2 setup.py build
    cd ..
  done
}

package() {
  cd "$_name-python-${pkgver}-common"

  for package in ${_packages[@]}
  do
    cd $package
    python2 setup.py install --root="$pkgdir" --optimize=1
    cd ..
  done
    
  rm "$pkgdir"/usr/lib/python2.?/site-packages/azure/__init__.*
}
