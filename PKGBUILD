# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
pkgdesc='Python library for cross-platform desktop notifications'
pkgver=6.1.1
pkgrel=2
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
b2sums=('04837aa94c32b7cb869272791ae14790c92f7b3f83f9442be793e05e7dcc7dba627e1ec36442488080c2d8c8987b3acf1a4b7f3e10453756157f832daf46ebae')

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
