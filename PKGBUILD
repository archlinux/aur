# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: s1gma,shirokuro

pkgbase=scapy-git
pkgname=('scapy-git' 'python-scapy-git')
pkgver=2.5.0.dev5
pkgrel=1
pkgdesc='Powerful interactive packet manipulation program written in Python'
url='http://www.secdev.org/projects/scapy/'
makedepends=('git' 'python')
checkdepends=('python-cryptography' 'python-pyx' 'python-matplotlib'
              'graphviz' 'sox' 'tcpdump')
arch=('any')
license=('GPL2')
source=(${pkgbase}::git+https://github.com/secdev/scapy)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  python setup.py --version
}

build() {
  cd ${pkgbase}
  python setup.py build
}

check() {
  # Run only main tests, without network access
  cd ${pkgbase}/test
  ./run_tests -3 -K netaccess -F
}

package_scapy-git() {
  depends=('python' 'python-scapy')
  pkgdesc+=' (tools)'
  provides=('scapy')
  conflicts=('scapy')
  cd ${pkgbase}
  python setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
  install -d "${pkgdir}/usr/share/doc"
  ln -sf /usr/share/doc/python-scapy "${pkgdir}/usr/share/doc/${pkgname}"
  rm -r "${pkgdir}/usr/lib"
}

package_python-scapy-git() {
  pkgdesc+=' (library)'
  depends=('tcpdump' 'python')
  optdepends=('python-cryptography: WEP, IPsec and SSL/TLS support'
              'python-pyx: psdump() and pdfdump() functions'
              'python-matplotlib: plotting support'
              'graphviz: conversations() method support'
              'sox: for VOIP support')
  provides=('python-scapy')
  conflicts=('python-scapy')
  cd ${pkgbase}
  python setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
  install -Dm 644 doc/scapy/*.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -r "${pkgdir}"{/usr/bin,/usr/share/man}
}

# vim: ts=2 sw=2 et:
