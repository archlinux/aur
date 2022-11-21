# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=python38-netaddr
_pyname=netaddr
pkgver=0.8.0
pkgrel=5
pkgdesc='Pure Python network address representation and manipulation library'
url='https://github.com/drkjam/netaddr'
arch=('any')
license=('BSD')
depends=('python38')
makedepends=('python38-sphinx')
checkdepends=('python38-pytest' 'python38-pytest-cov')
optdepends=('python38-ipython: netaddr interractive command support')
options=('!makeflags')
source=(https://github.com/drkjam/${_pyname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0b518ef240b81af425a5aaa6f087b10dece3f352c0c67cde8553ac00daa9d1890637c05d16740e2c23b30ae068c1b4c409ca8291e02093699fafd638701b9069')
b2sums=('c0a361c100490c17203aad14eb14a3e09c63f5a6ce2f4b7e85bc57942329ac4603a1d4b3a09a9ab964a775dfb50a8746f6dd4a05d2f9bba01674624a7d7b46c1')

prepare() {
  cd ${_pyname}-${pkgver}
  sed -r 's|#!/usr/bin/env python3.8||g' -i netaddr/eui/ieee.py netaddr/ip/iana.py
}

build() {
  cd ${_pyname}-${pkgver}
  python3.8 setup.py build
  make -C docs man text
}

check() {
  cd ${_pyname}-${pkgver}
  LC_ALL='en_US.UTF-8' py.test
}

package_python38-netaddr() {
  cd ${_pyname}-${pkgver}
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/build/man/netaddr.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
