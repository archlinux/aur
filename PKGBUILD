# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgbase=pyshark
pkgname=('python-pyshark' 'python2-pyshark')
pkgver=0.3.4
pkgrel=2
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
sha512sums=('6c7a11a9dbb1e00a7a38eb7da304af80be431697eed9e10d6dcf7cff7c8c15396b30caf1fb8d5fe369d1fed1416b731f6a820d0230c9146507788a456b497b58')

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
