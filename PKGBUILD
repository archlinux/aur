# Maintainer: Jingbei Li <i@jingbei.li>
pkgbase=python-pypandoc-git
pkgname=(python-pypandoc-git python2-pypandoc-git)
_pkgname=pypandoc
pkgver=1.4.r11.gffe8264
pkgrel=1
pkgdesc="Thin wrapper for pandoc"
arch=('any')
url="http://librosa.github.io/librosa"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
depends=('pandoc')
source=('git+https://github.com/bebraw/pypandoc')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --tag 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//g'
  )
}

prepare() {
  cd "$srcdir/"
  cp -a "${_pkgname}" "${_pkgname}-py2"
  cd "${_pkgname}-py2"
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

package_python2-pypandoc-git() {
  depends+=('python2')
  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-pypandoc-git() {
  depends+=('python')
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
