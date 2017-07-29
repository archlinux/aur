# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>

pkgbase="python-torchvision-git"
pkgname=("python-torchvision-git" "python2-torchvision-git")
_pkgname="vision"
pkgver=0.1.8.r22.g85bb16a
pkgrel=1
pkgdesc="image and video datasets and models for torch deep learning"
arch=('x86_64')
url="https://github.com/pytorch/vision"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("git://github.com/pytorch/vision")
sha256sums=('SKIP')

pkgver () {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --tag 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//g'
  )
}


prepare() {
  cd "$srcdir/"

  cp -a "${_pkgname}" "${_pkgname}-py2"
  cd "${_pkgname}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py build

  msg "Building Python 3"
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

package_python2-torchvision-git() {
  conflicts=('python2-torchvision')
  provides=('python2-torchvision')
  depends=('python2-pytorch')
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-torchvision-git() {
  conflicts=('python-torchvision')
  provides=('python-torchvision')
  depends=('python-pytorch')
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
