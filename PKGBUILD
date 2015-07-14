# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark' 'python2-pyshark')
pkgver=0.3.6
pkgrel=1
pkgdesc="Python wrapper for tshark, allowing python packet parsing using wireshark dissectors"
url="https://github.com/KimiNewt/pyshark"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=(
  'wireshark-cli'
  'python-mock' 'python-pytest' 'pypy3' 'python-lxml' 'python-trollius' 'python-logbook'
  'python2-mock' 'python2-pytest' 'pypy' 'python2-lxml' 'python2-trollius' 'python2-logbook'
)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/KimiNewt/${pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('3a6ffbbab3c0b4a7d395314d96dd126ab3af0f34d6cdd0ddd37ac0a921eab809ed3eb1e3c39049fc6146423f261958c0b6439563da2143f816de8c0b4da0c0d0')

check() {
  cd ${pkgbase}-${pkgver}
  if ! $(groups|grep '\bwireshark\b' >/dev/null); then
    error "Tests only work when the build user belongs to the 'wireshark' group!"
    exit 1
  fi
  ln -sf ../src/pyshark tests/pyshark
  py.test
  py.test2
}

package_python-pyshark() {
  depends=('wireshark-cli' 'pypy3' 'python-lxml' 'python-trollius' 'python-logbook')

  cd ${pkgbase}-${pkgver}/src
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pyshark() {
  depends=('wireshark-cli' 'pypy' 'python2-lxml' 'python2-trollius' 'python2-logbook')

  cd ${pkgbase}-${pkgver}/src
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
