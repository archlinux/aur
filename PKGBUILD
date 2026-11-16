# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
pkgdesc='Python library for cross-platform desktop notifications'
pkgver=6.2.0
pkgrel=1
url='https://github.com/SamSchott/desktop-notifier'
arch=(any)
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx-autoapi'
  'python-sphinx-furo'
  'python-sphinx_mdinclude'
  'python-wheel'
)
depends=(
  'python'
  'python-bidict'
  'python-certifi'
  'python-charset-normalizer'
  'python-dbus-fast'
  'python-packaging'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('06089ff50acfc46d82a8c2c33d91e24d1c3ab22c1c76d1e312e08f4f22d5d44a51f92dd0eebc17757cc54d4f8acbef1b00d5341d99fea0ffe3a0d8b7b44066dc')

build() {
  cd "desktop-notifier-${pkgver}"

  python -m build --wheel --no-isolation
  sphinx-build -b html docs docs/_build/html
}

package() {
  cd "desktop-notifier-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE

  cd docs/_build/html
  find . -type f -not -path '*/.*' \
    -exec install -vD -m644 {} -T "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
