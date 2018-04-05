# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: s1gma,shirokuro

pkgbase=scapy-git
pkgname=('scapy-git' 'python-scapy-git' 'python2-scapy-git')
pkgver=2.4.0.dev43
pkgrel=1
pkgdesc='Powerful interactive packet manipulation program written in Python'
url='http://www.secdev.org/projects/scapy/'
makedepends=('git' 'tcpdump' 'python2' 'python')
checkdepends=('python2-cryptography' 'python2-pyx' 'python2-matplotlib'
              'python-cryptography' 'python-pyx' 'python-matplotlib'
              'graphviz' 'sox')
arch=('any')
license=('GPL2')
source=(${pkgbase}::git+https://github.com/secdev/scapy)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  PYTHONPATH=. python2 -c "print __import__('scapy').VERSION"
}

prepare() {
  cp -a ${pkgbase}{,-py2}
  cd ${pkgbase}-py2
  sed -e 's|env python|env python2|g' -i doc/scapy/*.rst scapy/contrib/*.py setup.py \
    run_scapy scapy/pipetool.py scapy/tools/check_asdis.py scapy/layers/*.py bin/*
}

build() {
  (cd ${pkgbase}-py2
    python2 setup.py build
  )
  (cd ${pkgbase}
    python setup.py build
  )
}

check() {
  # Run only main tests, without network access
  (cd ${pkgbase}-py2/test
    ./run_tests_py2 -K netaccess -F
  )
  (cd ${pkgbase}/test
    ./run_tests_py3 -K netaccess -F
  )
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

package_python2-scapy-git() {
  pkgdesc+=' (library)'
  depends=('tcpdump' 'python2')
  optdepends=('python2-cryptography: WEP, IPsec and SSL/TLS support'
              'python2-pyx: psdump() and pdfdump() functions'
              'python2-matplotlib: plotting support'
              'graphviz: conversations() method support'
              'sox: for VOIP support')
  provides=('python2-scapy')
  conflicts=('python2-scapy')
  cd ${pkgbase}-py2
  python2 setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
  install -Dm 644 doc/scapy/*.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -r "${pkgdir}"{/usr/bin,/usr/share/man}
}

# vim: ts=2 sw=2 et:
