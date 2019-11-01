# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-tornado-4
pkgver=4.5.3
pkgrel=2
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('x86_64')
url='https://www.tornadoweb.org/'
license=('Apache')
depends=('python')
optdepends=('python-pycurl: for tornado.curl_httpclient'
            'python-twisted: for tornado.platform.twisted')
            # 'python-pycares: an alternative non-blocking DNS resolver'
makedepends=('python-setuptools')
checkdepends=('python-pycurl' 'python-mock' 'python-twisted')
provides=('python-tornado=4')
conflicts=('python-tornado')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz")
sha512sums=('d0d0ba53e64254c5d3e78f11d77eb95174a14a78b9207bf3af63c050ad15f814381aaa777b6817cb4635ab5f03e63e95f0c99e8aec045e96a04b0e233447975e')

export TORNADO_EXTENSION=1

build() {
  cd tornado-$pkgver
  python setup.py build
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd tornado-$pkgver
    python setup.py install --root="$PWD/tmp_install" --optimize=1
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH"
    cd tmp_install
    python -m tornado.test.runtests
    python -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python -m tornado.test.runtests --ioloop_time_monotonic
    python -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || warning "Tests failed"
}

package() {
  cd tornado-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
