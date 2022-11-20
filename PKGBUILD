# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python38-tornado
pkgver=6.2.0
pkgrel=2
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('x86_64')
url='https://www.tornadoweb.org/'
license=('Apache')
depends=('python38')
optdepends=('python38-pycurl: for tornado.curl_httpclient'
            'python38-twisted: for tornado.platform.twisted')
            # 'python38-pycares: an alternative non-blocking DNS resolver'
makedepends=('python38-setuptools')
checkdepends=('python38-pycurl' 'python38-twisted')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz")
sha512sums=('b8f98b76198f21bb3a13f44e8698397d7906a415e75621550dfeea8ae3a7e9405f5e314136a93b6714455062501051c145dfd32c71b433715fc8ed591fcb882b')

export TORNADO_EXTENSION=1

build() {
  cd tornado-$pkgver
  python3.8 setup.py build
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd tornado-$pkgver
    python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH"
    cd tmp_install
    python3.8 -m tornado.test.runtests
    python3.8 -m tornado.test.runtests --ioloop=tornado.platform.select.SelectIOLoop
    python3.8 -m tornado.test.runtests --httpclient=tornado.curl_httpclient.CurlAsyncHTTPClient
    python3.8 -m tornado.test.runtests --ioloop_time_monotonic
    python3.8 -m tornado.test.runtests --ioloop=tornado.platform.twisted.TwistedIOLoop
    python3.8 -m tornado.test.runtests --ioloop=tornado.platform.asyncio.AsyncIOLoop
    python3.8 -m tornado.test.runtests --resolver=tornado.netutil.ThreadedResolver
  ) || echo "Tests failed"
}

package() {
  cd tornado-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
