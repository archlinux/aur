# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154

pkgname=python-findpython
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc="A utility to find python versions on your system."
arch=("any")
url="https://github.com/frostming/findpython.git"
license=("MIT")
depends=("python>=3.7" "python-packaging>=20.0")
makedepends=("python-build" "python-installer" "python-pdm-pep517")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('ad073bab732fb9941ec6604afe848c162e54acdd85019734a2583a817727f383a9f495e64c485d0618d2a099c4d7c8f992b1f62270ef4dd9590751686d9ffc62')
b2sums=('79efeedbdfd3bdbe5d03082a2f302c67e5d03ac0cf4c885b37b4aaa4c1cfb3c6258aa39b96abee24a3265a3828325be153a917dc414f474842f7cfb63dd5fdc2')

build() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  pytest -vvv tests
}

package() {
  cd "$srcdir/${_name}-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/${_name//-/_}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm 644 "$srcdir/${_name}-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname/README.md"
}
