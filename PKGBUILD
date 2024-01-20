# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-ssort-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.12.1.r0.g3d87560
pkgrel=3
pkgdesc='Tool for automatically sorting python statements within a module (built from latest commit)'
arch=('any')
url="https://github.com/bwhmather/$_srcname"
license=('MIT')
makedepends=(
  'awk'
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-pathspec'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  _version=$(git describe --long --tags | awk -F- '{print $1}')
  printf 'VERSION = "%s"\n' "$_version" > "src/$_srcname/_version.py"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcname/src/$_srcname"

  sed -i -E 's/from ssort\.(.+) import/from .\1 import/' *.py
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# eof
