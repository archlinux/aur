# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=xandikos
pkgname=xandikos-git
pkgver=0.2.8.r178.g7816c4f
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org
license=('GPL3')
depends=('python-aiohttp' 'python-defusedxml' 'python-dulwich'
         'python-icalendar' 'python-jinja' 'python-multidict' 'python-vobject')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
optdepends=('python-aiohttp-openmetrics: for metrics with the standalone server'
            'uwsgi-plugin-python: for the WSGI interface')
provides=("$_name")
conflicts=("$_name")
source=('git+https://github.com/jelmer/xandikos.git')
b2sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags --match v\* | sed 's/v//;s/-/.r/;s/-/./'
}

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m unittest xandikos.tests.test_suite
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/doc/$_name README.rst
  install -Dm644 -t "$pkgdir"/usr/share/doc/$_name/examples examples/*
  install -Dm644 -t "$pkgdir"/usr/share/man/man8 man/xandikos.8
}
