# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-storage
pkgname=python-$_name
pkgver=1.4.0
pkgrel=1
pkgdesc="Microsoft Azure Storage Library for Python"
arch=('any')
url="https://github.com/Azure/azure-storage-python"
license=('Apache')
makedepends=('python-setuptools')
source=("https://github.com/Azure/azure-storage-python/archive/v${pkgver}-common.tar.gz"
        "setup.patch")
sha256sums=('effa2add41ce2c5a9aadd1f2616cee56944b53c56ae4120d28c501217b063747'
      		  'c2e32536788108b22416f61a852515a0f0016087371f09c16b4c3fc635db497a')

_packages=('azure-storage-common' 'azure-storage-blob'
           'azure-storage-file' 'azure-storage-queue')
build() {
  cd "$_name-python-${pkgver}-common"
  patch -p1 < ../setup.patch

  for package in ${_packages[@]}
  do
    cd $package
    python setup.py build
    cd ..
  done
}

package() {
  cd "$_name-python-${pkgver}-common"

  for package in ${_packages[@]}
  do
    cd $package
    python setup.py install --root="$pkgdir" --optimize=1
    cd ..
  done
    
  #rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  #rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
}
