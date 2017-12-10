# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-storage
pkgname=python-$_name
pkgver=0.37.1
pkgrel=1
pkgdesc="Microsoft Azure Storage Library for Python"
arch=('any')
url="https://github.com/Azure/azure-storage-python"
license=('Apache')
makedepends=('python-setuptools')
source=("https://github.com/Azure/azure-storage-python/archive/v${pkgver}-common.tar.gz"
        "setup.patch")
md5sums=('4256e38c4b6520790b1a6351fea1b404'
         '3529e82ae379ecaa14a938fda53275a1')

_packages=('azure-storage-common' 'azure-storage-blob'
           'azure-storage-file' 'azure-storage-queue')
build() {
  patch -p0 < setup.patch
  cd "$_name-python-$pkgver-common"

  for package in $_packages;
  do
    cd $package
    python setup.py build
    cd ..
  done
}

package() {
  cd "$_name-python-$pkgver-common"

  for package in $_packages;
  do
    cd $package
    python setup.py install --root="$pkgdir" --optimize=1
    cd ..
  done
    
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
}
