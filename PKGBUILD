# Maintainer: Christopher Arndt <chris at chrisarndt.de>

pkgbase='python-mido'
pkgname=('python-mido' 'python2-mido')
_name='mido'
pkgver='1.2.9'
pkgrel=1
pkgdesc="A Python library for working with MIDI messages and ports"
url="https://mido.readthedocs.io/"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('portmidi: for PortMidi support')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('bec86e55a19f5bfdd5a3546c7cdc418a')

prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-mido() {
  depends+=('python-rtmidi')
  optdepends+=('python-pygame: for PortMidi support')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-mido() {
  depends+=('python2-rtmidi')
  optdepends+=('python2-pygame: for PortMidi support')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  for prog in connect play ports serve; do
    mv "${pkgdir}/usr/bin/mido-${prog}" "${pkgdir}/usr/bin/mido-${prog}2.7"
  done
  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
