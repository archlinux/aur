# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Thomas Conneely <tc116 at le dot ac dot uk>

pkgname='python2-bitstring'
_name="${pkgname#python2-}"
pkgver=3.1.9
pkgrel=1
pkgdesc='Simple construction, analysis and modification of binary data'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
options=('!emptydirs')
_tarname="${_name}-${pkgver}"
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('45823c4203d5c8c6bdd463dcd98b7244a759d5f781905cdf9162520cd7f051245154f95097c728c04f4b0ab353203b8a64ff9bf552c4002955737ef724705ee2')

prepare() {
  cd "${_tarname}"

  # Change hashbangs to python2
  sed -e 's|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')

  # get the license file
  python2 -c "import bitstring; print(bitstring.__licence__)" >> ${srcdir}/LICENSE

}

check() {
  cd "${_tarname}/test"
  python2 -m unittest discover
}

package() {
  cd "${_tarname}"

  # build
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # install license
  install -Dm 644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
