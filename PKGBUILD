# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='isd-git'
pkgdesc='Interactive TUI for systemd units (development version)'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.6.3.r0.gda51e79
pkgrel=1
url='https://github.com/isd-project/isd'
arch=('any')
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'python-build'
  'python-editables'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
depends=(
  'hicolor-icon-theme'  # needed for hicolor theme hierarchy
  'python'
  'python-pfzy'
  'python-pydantic-settings'
  'python-textual'
  'python-types-pyyaml'
  'python-xdg-base-dirs'
  'systemd'
)
provides=("$_pkgname"{,-tui})
conflicts=("${provides[@]}")
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cd "$pkgdir/usr/share/doc" && ln -sr "$pkgname" "$_pkgname"
}

# eof
