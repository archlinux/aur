# Maintainer: Niklas <niklas@n1klas.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgbase=python-tornado-4.4
pkgname=('python-tornado-4.4' 'python2-tornado-4.4')
pkgver=4.4.3
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('i686' 'x86_64')
url='http://www.tornadoweb.org/'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pycurl' 'python2-pycurl' 'python-mock' 'python2-mock' 'python-twisted'
              'python2-twisted' 'python2-futures' 'python2-singledispatch' 'python2-backports-abc'
              'python2-trollius' 'python2-monotonic')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz"
        0001-use_system_ca_certificates.patch)
sha512sums=('280503bce6b3517beace3dcf55b3e671b74064dd022b7f846fd697335f720a8f445d7ba1ffe230dff612a9160a1ed48b333b77dda3249207fc7f3c5a30948d57'
            'a6422735bdce26246088d38aec55042627a1800329847aba54ca85453dcefcdde631519b57088dd441a42a4c341e7f07c73ab6b73d8404869b67ee4107bde912')

prepare() {
  cd tornado-$pkgver
  patch -p1 -i ../0001-use_system_ca_certificates.patch

  cd "$srcdir"
  cp -a tornado-$pkgver{,-py2}

  # python -> python2 rename
  find tornado-$pkgver-py2 -name '*py' -exec sed -e 's_#!/usr/bin/env python_&2_' -i {} \;

  export TORNADO_EXTENSION=1
}

build() {
  cd tornado-$pkgver
  python setup.py build

  cd ../tornado-$pkgver-py2
  python2 setup.py build
}

check() {
  (
    cd tornado-$pkgver
    python setup.py install --root="$PWD/tmp_install" --optimize=1
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python3.6/site-packages:$PYTHONPATH"
    cd tmp_install
    python -m tornado.test.runtests
    python -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python -m tornado.test.runtests --ioloop_time_monotonic
    python -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || warning "Tests failed"

  (
    cd tornado-$pkgver-py2
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
  )
}

package_python-tornado-4.4() {
  depends=('python')
  optdepends=('python-pycurl: for tornado.curl_httpclient'
              'python-twisted: for tornado.platform.twisted')
              # 'python-pycares: an alternative non-blocking DNS resolver'

  cd tornado-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-tornado-4.4() {
  depends=('python2-singledispatch' 'python2-backports-abc')
  optdepends=('python2-futures: recommended thread pool and for tornado.netutil.ThreadedResolver'
              'python2-monotonic: enable support for a monotonic clock'
              'python2-pycurl: for tornado.curl_httpclient'
              'python2-twisted: for tornado.platform.twisted')
              # 'python2-pycares: an alternative non-blocking DNS resolver'

  cd tornado-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
