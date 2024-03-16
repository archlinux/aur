# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
_name=ftfy
pkgver=6.2.0
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('31724b3f65936a146f567a493988b3a3ce5ba87ac7578b97a64f0946cc20d09fcab040964cec9bcf3fbac1f79cad0b67c5e74aaa871a7d6c856f5939e7a30529')

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
