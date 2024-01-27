#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-laspy
pkgdesc="Pythonic interface for .LAS LIDAR files"
url="https://github.com/laspy/laspy"
pkgver=2.5.3
pkgrel=1
arch=('any')
license=('BSD-2-Clause')
changelog='CHANGELOG.md'

depends=('python-numpy' 'python-rich' 'python-typer')
optdepends=(
  'python-lazrs: LAZ and COPC support'
  'python-laszip: LAZ support'
  'python-pyproj: CRS support'
  'python-requests: COPC support over HTTPS'
)
makedepends=(
  'git'
  'python-myst-parser'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx'
)
checkdepends=('python-pytest')

_pyname=laspy
_commit=45b9202a3
source=(
  "git+$url#commit=$_commit?signed"
  'modify_doc_conf.patch'
)
sha256sums=(
  'SKIP'
  '6da3d9fff0c082f310380a862e7d4eb2de7735bf5078768bf846703564b153db'
)
validpgpkeys=('44B238524D21C5064D7081BD5022EF94BE848C51')

prepare() {
  cd "$_pyname"

  # Use myst_parser instead of m2r2 and disable the custom HTML theme.
  patch -p0 -i "$srcdir/modify_doc_conf.patch"

  # Replace the RST (which used an m2r2 directive) with a copy of the markdown.
  cd docs
  rm changelog.rst
  ln -sf ../CHANGELOG.md changelog.md
}

build() {
  cd "$_pyname"
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd "$_pyname"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$_pyname"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 docs/_build/man/laspy.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
