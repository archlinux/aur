# Maintainer:
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Utsav <aur (a) utsav2 [.] dev>

_module="glean_parser"
_pkgname="python-${_module//_/-}"
pkgname="$_pkgname"
pkgver=19.0.0
pkgrel=1
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
url="https://github.com/mozilla/glean_parser"
license=('MPL-2.0')
arch=('any')

depends=(
  'python'
  'python-click'
  'python-diskcache' # AUR
  'python-jinja'
  'python-jsonschema'
  'python-platformdirs'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
_dl_url="https://files.pythonhosted.org/packages/source"
source=("$_pkgsrc.$_pkgext"::"$_dl_url/${_module::1}/$_module/$_pkgsrc.$_pkgext")
sha256sums=('bb2e0a4ab6be7e0daa704e4d4e9e34a2020f845a71dfc6c45366a917cbcbf4b3')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  python -m installer --destdir=fakeinstall dist/*.whl
  PYTHONPATH="$(find fakeinstall -type d -name site-packages -print -quit)" pytest
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
