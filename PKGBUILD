# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgbase=python-pyhdf
pkgname=('python-pyhdf')
pkgver=0.11.6
pkgrel=1
pkgdesc='Python bindings for the HDF4 library'
arch=('x86_64')
license=('MIT')
url='https://github.com/fhs/pyhdf'
depends=('python' 'python-numpy' 'hdf4')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://pypi.io/packages/source/p/pyhdf/pyhdf-${pkgver}.tar.gz"
        "hdfext_wrap_comp_type_cast.patch")
sha256sums=('9f6de3dd0a9651581e11e9a20f33ba16f4c79fb316c76082060ab33aeef98c5a'
            '8bfad2a6906ec2d2769749f6780a849c70110250ba00067649280ff0af7e5203')

prepare() {
  cd ${srcdir}/pyhdf-${pkgver}
  patch -Np1 -i ../hdfext_wrap_comp_type_cast.patch
}

build() {
  export INCLUDE_DIRS="/opt/hdf4/include"
  export LIBRARY_DIRS="/opt/hdf4/lib"

  cd $srcdir/pyhdf-$pkgver
  python -m build --wheel --no-isolation
}

package_python-pyhdf() {
  depends=('python' 'python-numpy' 'hdf4')

  cd $srcdir/pyhdf-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
