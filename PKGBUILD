# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>

_pkgname=aiohttp
pkgname=python38-aiohttp
_gitcommit=30b7a4e99677b4014dda2372504343bb05fc983e
pkgver=3.8.3
pkgrel=1
pkgdesc='HTTP client/server for asyncio'
url='https://aiohttp.readthedocs.io'
arch=('x86_64')
license=('Apache')
depends=('python38' 'python38-chardet' 'python38-multidict' 'python38-async-timeout'
         'python38-yarl' 'python38-attrs' 'python38-charset-normalizer'
         'python38-aiosignal' 'python38-frozenlist')
makedepends=('git' 'python38-cython' 'npm' 'python38-build' 'python38-installer'
             'python38-setuptools' 'python38-wheel')
checkdepends=('python38-pytest' 'python38-pytest-runner' 'python38-pytest-mock'
              'python38-pytest-timeout' 'python38-async_generator' 'python38-brotli'
              'python38-pytest-xdist' 'python38-pytest-forked' 'python38-pytest-cov'
              'python38-trustme' 'python38-freezegun' 'gunicorn' 'python38-re-assert'
              'python38-proxy.py')
optdepends=('gunicorn: to deploy using Gunicorn'
            'python38-aiodns: for fast DNS resolving'
            'python38-cchardet: for faster encoding detection'
            'python38-brotli: for Brotli transfer-encodings support')
source=(${pkgname}::"git+https://github.com/aio-libs/aiohttp#commit=${_gitcommit}"
        git+https://github.com/nodejs/llhttp.git)
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule."vendor/llhttp".url "${srcdir}/llhttp"
  git submodule update --recursive
  sed 's|.install-cython ||' -i Makefile

  # This test calls the Python interpreter, we need to make sure that the path
  # for the C extensions is correct there as well
  sed -i "s/import {import_path!s}/import sys; sys.path.insert(0, '{os.environ['PYTHONPATH']}'); &/" \
      tests/test_circular_imports.py
}

build() {
  cd ${pkgname}
  make generate-llhttp cythonize
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}
  local _python_version=$(python3.8 -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${_python_version}" pytest
}

package() {
  cd ${pkgname}
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
