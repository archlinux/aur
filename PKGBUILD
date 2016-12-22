# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=python-eventlet-git
pkgname=('python-eventlet-git' 'python2-eventlet-git')
pkgver=0.20.0+6+ge1bb2fe
pkgrel=1
pkgdesc='Highly concurrent networking library'
url='http://eventlet.net'
arch=('any')
license=('MIT')
makedepends=('python2-pip' 'python-greenlet' 'python-setuptools' 'python-sphinx' 'python2-greenlet' 'python2-setuptools' 'python2-sphinx' 'python2-subprocess32' 'git')
#TODO: add 'python-dnspython' if test is fixed
checkdepends=('python-psycopg2' 'python-nose' 'python-pyopenssl' 'python-httplib2' 'python-mock' 'python-pyzmq'
              'python2-psycopg2' 'python2-nose' 'python2-pyopenssl' 'python2-httplib2' 'python2-mock' 'python2-pyzmq' 'python2-dnspython')
source=(${pkgbase}::git+https://github.com/eventlet/eventlet)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v?(.+)|\1|g'
}

prepare() {
  (cd ${pkgbase}
    sed -r 's|(check_idle_cpu_usage\(.*,) .*\)|\1 0.8\)|g' -i tests/*_test.py
  )
  cp -a ${pkgbase}{,-py2}
  sed 's|python|python2|' -i ${pkgbase}-py2/examples/*
}

build() {
  (cd ${pkgbase}
    python setup.py build
    make -C doc text
  )
  (cd ${pkgbase}-py2
    python2 setup.py build
    make -C doc text
  )
}

check() {
  (cd ${pkgbase}
    nosetests -sv tests
  )
  (cd ${pkgbase}-py2
    nosetests2 -sv tests
  )
}

package_python-eventlet-git() {
  depends=('python' 'python-greenlet')
  optdepends=('python-psycopg2: non-blocking PostgreSQL support'
              'python-pyopenssl: non-blocking SSL support'
              'python-httplib2: non-blocking HTTP support'
              'python-pyzmq: non-blocking ZeroMQ support'
              'python-dnspython: non-blocking DNS support')
  provides=('python-eventlet')
  conflicts=('python-eventlet')

  cd ${pkgbase}
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/_build/text "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python2-eventlet-git() {
  depends=('python2' 'python2-greenlet' 'python2-subprocess32')
  optdepends=('python2-psycopg2: non-blocking PostgreSQL support'
              'python2-pyopenssl: non-blocking SSL support'
              'python2-httplib2: non-blocking HTTP support'
              'python2-pyzmq: non-blocking ZeroMQ support'
              'python2-dnspython: non-blocking DNS support')
  provides=('python2-eventlet')
  conflicts=('python2-eventlet')

  cd ${pkgbase}-py2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" -O1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/_build/text "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
