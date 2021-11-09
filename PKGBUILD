# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Philipp A. <flying-sheep@web.de>

_pkgname=aiohttp
pkgname=python-${_pkgname}-git
pkgver=4.0.0a1.r857.gac0398a4
pkgrel=1
pkgdesc='HTTP client/server for asyncio'
url='https://aiohttp.readthedocs.io'
arch=('x86_64')
license=('Apache')
depends=('python' 'python-chardet' 'python-multidict' 'python-async-timeout'
         'python-yarl' 'python-attrs')
makedepends=('cython' 'python-setuptools' 'python-pip' 'git' 'cmake' 'ts-node' 'npm')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock'
              'python-pytest-timeout' 'python-async_generator' 'python-brotli'
              'python-pytest-xdist' 'python-pytest-forked' 'python-pytest-cov'
              'python-trustme' 'python-freezegun' 'gunicorn' 'python-re-assert')
optdepends=('gunicorn: to deploy using Gunicorn'
            'python-aiodns: for fast DNS resolving'
            'python-cchardet: for faster encoding detection'
            'python-brotli: for Brotli transfer-encodings support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${_pkgname}::"git+https://github.com/aio-libs/aiohttp")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  git submodule init
  git submodule update --recursive
  sed 's|.install-cython ||' -i Makefile
}

build() {
  cd ${_pkgname}
  
  pushd "vendor/llhttp"
  npm install
  make release
  cmake -B build -S release \
    -DBUILD_SHARED_LIBS=on \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
  popd
  
  make cythonize
  python setup.py build
}

check() {
  cd ${_pkgname}
  python setup.py test
}

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
