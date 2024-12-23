# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-calcpy-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.1.r265.gb3c1dc0
pkgrel=2
pkgdesc='Terminal calculator and advanced math solver using Python, IPython and SymPy (latest git commit)'
arch=('any')
url="https://github.com/idanpa/$_srcname"
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'ipython'
  'python'
  'python-antlr4'
  'python-dateparser'
  'python-matplotlib'
  'python-numpy'
  'python-pickleshare'
  'python-prompt_toolkit'
  'python-pyperclip'
  'python-requests'
  'python-sympy'
  'python-traitlets'
  'python-tzlocal'
)
source=("git+$url.git")
provides=("$_srcname" "$_pkgname" 'python-previewer')
conflicts=("$_srcname" "$_pkgname" 'python-previewer')
sha256sums=('SKIP')

prepare() {
  cd "$_srcname"

  sed -i 's/antlr4-python3-runtime==4.11/antlr4-python3-runtime==4.13/g' setup.py
}

pkgver() {
  cd "$_srcname"

  # There are no tags yet,
  # so let's use number of revisions since beginning of history
  printf '0.1.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/$pkgname/doc/README.md"
}

# eof
