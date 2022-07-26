# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=xandikos-git
pkgver=0.2.8.r63.g0b948e6
pkgrel=1
pkgdesc='Lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository'
arch=('any')
url=https://www.xandikos.org
license=('GPL3')
depends=('python-aiohttp' 'python-defusedxml' 'python-dulwich'
         'python-icalendar' 'python-jinja' 'python-multidict' 'python-vobject')
makedepends=('git' 'python-setuptools')
optdepends=('python-aiohttp-openmetrics: for metrics with the standalone server'
            'uwsgi-plugin-python: for the WSGI interface')
provides=('xandikos')
conflicts=('xandikos')
source=('git+https://github.com/jelmer/xandikos.git')
b2sums=('SKIP')

pkgver() {
  cd xandikos
  git describe --long --tags --match v\* | sed 's/v//;s/-/.r/;s/-/./'
}

build() {
  cd xandikos
  python setup.py build
}

check() {
  cd xandikos
  python -m unittest xandikos.tests.test_suite
}

package() {
  cd xandikos
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/doc/xandikos README.rst
  install -Dm644 -t "$pkgdir"/usr/share/doc/xandikos/examples examples/*
  install -Dm644 -t "$pkgdir"/usr/share/man/man8 man/xandikos.8
}
