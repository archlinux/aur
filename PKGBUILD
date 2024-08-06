# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=ftfy
pkgver=6.2.3
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('6711dbe9750db6bc25c57d5d600d1db52eff6f22caa7ff89c06615bbd7dd612cca56f9e9a35c633648747c421f2e710a6e24ee1f9a6d6df0ac6f6049a5189e8e')

prepare() {
  # Keep the build backend from including `CHANGELOG.md` and `README.md`
  # in the `site-packages` folder directly. Upstream PR pending.
  sed -i -e '/^include =/d' "$_name-$pkgver/pyproject.toml"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" CHANGELOG.md README.md
}
