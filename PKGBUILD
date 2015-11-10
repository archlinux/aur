# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=('python-tornado-401' 'python2-tornado-401')
conflicts=( 'python-tornado' 'python2-tornado' )

pkgver=4.0.1
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools (this package gives the old API for some applications)'
arch=( 'i686' 'x86_64' 'arm' )
url='http://www.tornadoweb.org/'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python2-backports.ssl_match_hostname' 'git' 'python-certifi' 'python2-certifi')
checkdepends=('python-pycurl' 'python2-pycurl' 'python-mock' 'python2-mock' 'python-twisted' 'python2-twisted')
source=("git+https://github.com/facebook/tornado.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a tornado{,-py2}

  # python -> python2 rename
  find tornado-py2 -name '*py' -exec sed -e 's_#!/usr/bin/env python_&2_' -i {} \;
}

build() {
  cd tornado
  python setup.py build

  cd ../tornado-py2
  python2 setup.py build
}

check() {
  cd tornado
  python -m tornado.test.runtests || warning "Tests failed"
  python -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop || warning "Tests with AsyncIO failed"
  python -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop || warning "Tests with SelectIO failed"
  python -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop || warning "Tests with TwistedIO failed"

  cd ../tornado-py2
  python2 -m tornado.test.runtests || warning "Tests failed"
  python2 -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop || warning "Tests with TwistedIO failed"
  python2 -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop || warning "Tests with SelectIO failed"
}

package_python-tornado-401() {
  depends=('python-certifi')

  cd tornado
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-tornado-401() {
  depends=('python2-certifi' 'python2-backports.ssl_match_hostname')

  cd tornado-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

