# $Id$
# Maintainer: NebulaNeko <chfsefefgesfen foxmail>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-tornado-453
pkgver=4.5.3
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools (v4.5.3)'
arch=('x86_64')
url='http://www.tornadoweb.org/'
license=('Apache')
provides=(python2-tornado=4.5.3)
makedepends=('python2-setuptools')
checkdepends=('python2-pycurl' 'python2-mock'
              'python2-twisted' 'python2-futures' 'python2-singledispatch' 'python2-backports-abc'
              'python2-trollius' 'python2-monotonic')
depends=('python2-singledispatch' 'python2-backports-abc')
optdepends=('python2-futures: recommended thread pool and for tornado.netutil.ThreadedResolver'
            'python2-monotonic: enable support for a monotonic clock'
            'python2-pycurl: for tornado.curl_httpclient'
            'python2-twisted: for tornado.platform.twisted')
            # 'python2-pycares: an alternative non-blocking DNS resolver'
source=("$pkgname-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz"
        0001-use_system_ca_certificates.patch)
sha512sums=('d0d0ba53e64254c5d3e78f11d77eb95174a14a78b9207bf3af63c050ad15f814381aaa777b6817cb4635ab5f03e63e95f0c99e8aec045e96a04b0e233447975e'
            'a6422735bdce26246088d38aec55042627a1800329847aba54ca85453dcefcdde631519b57088dd441a42a4c341e7f07c73ab6b73d8404869b67ee4107bde912')

prepare() {
  cd tornado-$pkgver
  patch -p1 -i ../0001-use_system_ca_certificates.patch

  cd "$srcdir"

  # python -> python2 rename
  find -name '*py' -exec sed -e 's_#!/usr/bin/env python_&2_' -i {} \;

  export TORNADO_EXTENSION=1
}

build() {
  cd "$srcdir"/tornado-$pkgver
  python2 setup.py build
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd tornado-$pkgver
    python2 setup.py install --root="$PWD/tmp_install" --optimize=1
    export PYTHON2PATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH"
    cd tmp_install
    python2 -m tornado.test.runtests
    python2 -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python2 -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python2 -m tornado.test.runtests --ioloop_time_monotonic
    python2 -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python2 -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python2 -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || warning "Tests failed"
}

package() {
  cd tornado-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
