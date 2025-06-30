# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=mwparserfromhell
pkgname=python-mwparserfromhell-git
pkgver=0.7.1
pkgrel=1
pkgdesc="A Python parser for MediaWiki wikicode"
arch=(x86_64)
url="https://github.com/earwig/mwparserfromhell"
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git}=${pkgver})
source=(
  git+https://github.com/earwig/mwparserfromhell.git
)
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --tags --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
