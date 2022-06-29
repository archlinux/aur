# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-tornado
_name="${pkgname#python2-}"
pkgver=5.1.1
pkgrel=5
pkgdesc='Web framework and asynchronous networking library (legacy Python 2 version)'
arch=('x86_64')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
  'glibc'
  'python2'
  'python2-backports-abc'
  'python2-futures'
  'python2-singledispatch'
)
optdepends=(
  'python2-monotonic: enable support for a monotonic clock'
  'python2-pycurl: for tornado.curl_httpclient'
  'python2-twisted: for tornado.platform.twisted'
# 'python2-pycares: an alternative non-blocking DNS resolver'
)
makedepends=('python2-setuptools')
checkdepends=(
  'python2-mock'
  'python2-monotonic'
  'python2-pycurl'
  'python2-trollius'
  'python2-twisted'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz")
sha512sums=('b35fa0687ede6e672c35ca82fcc01dbb2ae9d8a7f2e4a65b6e07aa5a8eca861a22d775101172b7e33564951d193e5f11887021a3d762bee88668b9ac0069ab46')

export TORNADO_EXTENSION=1

prepare() {
  # python -> python2 rename
  find "${_tarname}" -name '*py' -exec sed -e 's_#!/usr/bin/env python_&2_' -i {} \;
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  (
    cd "${_tarname}"
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
  ) || warning "Tests failed"
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
