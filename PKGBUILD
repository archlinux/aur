# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: s1gma,shirokuro

pkgname=scapy-git
pkgver=2.3.3.dev519
pkgrel=1
pkgdesc="A powerful interactive packet manipulation program written in Python"
url="http://www.secdev.org/projects/scapy/"
depends=('tcpdump' 'python2')
optdepends=('python2-cryptography: WEP, IPsec and SSL/TLS support'
            'python2-pyx: psdump() and pdfdump() functions'
            'python2-matplotlib: plotting support'
            'graphviz: conversations() method support'
            'sox: for VOIP support')
makedepends=('git')
checkdepends=('python2-cryptography' 'python2-pyx' 'python2-matplotlib' 'graphviz' 'sox')
arch=('any')
license=('GPL2')
provides=('scapy')
conflicts=('scapy')
source=(${pkgname}::git+https://github.com/secdev/scapy)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  PYTHONPATH=. python2 -c "print __import__('scapy').VERSION"
}

prepare() {
  cd ${pkgname}
  sed -e 's|env python|env python2|g' -i doc/scapy/*.rst scapy/contrib/*.py setup.py \
    run_scapy scapy/pipetool.py scapy/tools/check_asdis.py scapy/layers/inet6.py
  sed -e 's/exec python/exec python2/g' -i run_scapy setup.py test/run_tests
}

build() {
  cd ${pkgname}
  python2 setup.py build
}

check() {
  cd ${pkgname}/test
  # Run only main tests, without network access
  ./run_tests -K netaccess -F
}

package() {
  cd ${pkgname}
  python2 setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
  install -Dm 644 doc/scapy/*.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
