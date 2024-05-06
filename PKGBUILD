# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkgname=mwparserfromhell
pkgname=python-mwparserfromhell-git
pkgdesc="A Python parser for MediaWiki wikicode"
pkgver=0.6.6.r4.g4e73af2
pkgrel=1
arch=(x86_64)
url="https://github.com/earwig/mwparserfromhell"
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=('git+https://github.com/earwig/mwparserfromhell.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --always | sed 's|^v||;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
