# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-tornado
pkgver=5.1.1
pkgrel=3
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('x86_64')
url='https://www.tornadoweb.org/'
license=('Apache')
depends=('python2-futures' 'python2-singledispatch' 'python2-backports-abc')
optdepends=('python2-monotonic: enable support for a monotonic clock'
            'python2-pycurl: for tornado.curl_httpclient'
            'python2-twisted: for tornado.platform.twisted')
            # 'python2-pycares: an alternative non-blocking DNS resolver'
makedepends=('python2-setuptools')
checkdepends=('python2-pycurl' 'python2-mock' 'python2-twisted'  'python2-trollius'
              'python2-monotonic')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz")
sha512sums=('b35fa0687ede6e672c35ca82fcc01dbb2ae9d8a7f2e4a65b6e07aa5a8eca861a22d775101172b7e33564951d193e5f11887021a3d762bee88668b9ac0069ab46')

export TORNADO_EXTENSION=1

prepare() {
  # python -> python2 rename
  find tornado-$pkgver -name '*py' -exec sed -e 's_#!/usr/bin/env python_&2_' -i {} \;
}

build() {
  cd tornado-$pkgver
  python2 setup.py build
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd tornado-$pkgver
    python2 setup.py install --root="$PWD/tmp_install" --optimize=1
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH"
    cd tmp_install
    python2 -m tornado.test.runtests
    python2 -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python2 -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python2 -m tornado.test.runtests --ioloop_time_monotonic
    python2 -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python2 -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python2 -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || echo "Tests failed"
}

package() {
  cd tornado-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
