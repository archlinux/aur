# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark' 'python2-pyshark')
pkgver=0.3.6.2
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
makedepends=('wireshark-cli'
             'python-setuptools' 'python-mock' 'python-pytest' 'pypy3' 'python-lxml' 'python-trollius' 'python-logbook'
             'python2-setuptools' 'python2-mock' 'python2-pytest' 'pypy' 'python2-lxml' 'python2-trollius' 'python2-logbook')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/KimiNewt/pyshark/archive/v${pkgver}.tar.gz)
sha512sums=('41b5d045c8cdfff42b560e502639c778e7ee57917acb580424b40ca34a717d5eb6e4461864396dbe0b3e143fd68f38ef65e4424a25b725af7a6a9bb916bac268')

check() {
  cd ${pkgbase}-${pkgver}
  if ! $(groups|grep '\bwireshark\b' >/dev/null); then
    warning "Tests only work when the build user belongs to the 'wireshark' group!"
    return
  fi
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
