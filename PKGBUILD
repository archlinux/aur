# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
# based on
#   David Runge's community/python-xvfbwrapper
# and
#   Bryce Guinta's previous aur/python{,2}-xvfbwrapper

_name=xvfbwrapper
pkgname=python2-xvfbwrapper
pkgver=0.2.9
pkgrel=1
pkgdesc="Manage headless displays with Xvfb (X virtual framebuffer)"
arch=('any')
url="https://github.com/cgoldberg/xvfbwrapper"
license=('MIT')
depends=('python2' 'xorg-server-xvfb')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('800f3489b2e1bbc884d7651e344ed73783d6c00856f3ab7ccfa6b9058dd6d3bb98d38f11172ba89dff5773d6c5b773bc000786c1f6c6aae5a27179b37017851e')

prepare() {
  mv -v "${srcdir}/${_name}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
  find "${srcdir}/${pkgname}-${pkgver}" \
    -type f -name '*.py' \
    -exec sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' {} +
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHONPATH="${srcdir}/${pkgname}-${pkgver}/build:${PYTHONPATH}" py.test2
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --root="${pkgdir}/"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
