# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-pytablewriter-altrow-theme
_pkgname="${pkgname#python-}"
pkgver=0.0.3
pkgrel=2
pkgdesc='pytablewriter plugin to provide a theme that colors rows alternatively'
arch=('any')
url='https://github.com/thombashi/pytablewriter-altrow-theme'
license=('MIT')
depends=('python-pytablewriter' 'python-tcolorpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytz' 'python-dateutil')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('3f24b65fb6cfc2b1fd170c8b0cf6ed74e7836d8a81cfd7aa5d0fe509be605b77'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367') ## Tsuyoshi Hombashi

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  cd "$_pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/${_pkgname//-/_}-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
