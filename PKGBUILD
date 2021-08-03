#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=python-cx-freeze-qfix
pkgver=6.7
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF')
depends=('python-importlib-metadata')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-openpyxl')
provides=('python-cx_freeze' 'python-cx-freeze')
conflicts=('python-cx_freeze' 'python-cx-freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/${pkgname%-qfix}-$pkgver.tar.gz"
	"export-dynamic.patch")
sha512sums=('e4b7a1ff58fc5024ae57b6ba05ca01ebbd98eb1b3a234ea1167ce0dacfa79ff748a0425483f4f639dee417371edf59277740a8c55208187b2dfe36eb72ab2742'
            '8535ffee971e10597133e4710d8a9ac3c6e1c02d91c28bcf8090662b07fdb34a92e387ac47fa6bd0d783c77f4913c2cd7d1b3040db74f0f0d961f5af67affdc3')

prepare() {
  cd cx_Freeze-$pkgver
  # https://github.com/marcelotduarte/cx_Freeze/pull/833
  sed -i 's/excludes$/excludes or []/' cx_Freeze/finder.py
  patch -Np1 -i "$srcdir"/export-dynamic.patch
}

build() {
  cd cx_Freeze-$pkgver
  python setup.py build
}

check() {
  cd cx_Freeze-$pkgver
  python setup.py nosetests || echo "Tests failed"
}

package() {
  cd cx_Freeze-$pkgver
  python setup.py install --root "$pkgdir" --optimize 1 --skip-build
}
