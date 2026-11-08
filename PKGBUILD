# Maintainer: Phillip Davies <philliptdavies@gmail.com>

pkgname=python-rich-click-1.9.9
_name=rich-click
pkgver=1.9.9
pkgrel=1
pkgdesc='Format click help output nicely with rich. (Updated to 1.9.9 for pros-cli)'
arch=(any)
url='https://github.com/ewels/rich-click'
depends=(
  python
  python-click
  python-typing_extensions
  python-rich
  python-importlib-metadata
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
  git
)
checkdepends=(
  python-pytest
  python-inline-snapshot
  ruff
  # Ignoring python-typer since this is why this package exists
)

provides=('python-rich-click')
conflicts=('python-rich-click')

license=(MIT)
source=(git+$url.git#tag=v$pkgver)
b2sums=('8ddb6506286b8f3ceecda72450fe307b181c94526aa5eab8cd359a68c4b8bc6470c7a4de647588a045e1a5296e9591539585f0fde67aac9a60f0948481287d02')

prepare() {
  cd "$_name"
  sed -i 's/--cov --cov-report term//' pyproject.toml
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest \
    --ignore=tests/typer_help
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
