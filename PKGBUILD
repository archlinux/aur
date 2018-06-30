# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=python-requests-ftp
pkgname=('python2-requests-ftp' 'python-requests-ftp')
pkgver=0.3.1
pkgrel=2
pkgdesc="FTP transport adapter for Requests"
arch=('any')
url="https://github.com/Lukasa/requests-ftp"
license=('Apache')
makedepends=('python-setuptools' 'python-requests'
             'python2-setuptools' 'python2-requests')
source=("https://github.com/Lukasa/requests-ftp/archive/v${pkgver}.tar.gz")
md5sums=('7466462ca84dc69cd602873f5808d32a')

prepare() {
  cd "$srcdir"
  cp -a requests-ftp-${pkgver} requests-ftp-py2-${pkgver}
  cd requests-ftp-py2-${pkgver}

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python2"
  cd "$srcdir"/requests-ftp-py2-${pkgver}
  python2 setup.py build_ext --inplace
  python2 setup.py build

  msg "Building Python3"
  cd "$srcdir"/requests-ftp-${pkgver}
  python setup.py build_ext --inplace
  python setup.py build
}

package_python2-requests-ftp() {
  depends=('python2-requests')

  cd "$srcdir"/requests-ftp-py2-${pkgver}

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}

package_python-requests-ftp() {
  depends=('python-requests')

  cd "$srcdir"/requests-ftp-${pkgver}

  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

