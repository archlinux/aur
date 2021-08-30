#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-taichi
_name=${pkgname#python-}
_py=cp39
pkgver=0.7.30
pkgrel=1
pkgdesc='Productive & portable programming language for high-performance, sparse & differentiable computing on CPUs & GPUs'
url='https://github.com/taichi-dev/taichi'
arch=('x86_64')
license=('MIT')
depends=(
  'python'
  'python-astor'
  'python-numpy'
  'pybind11'
  'python-pillow'
  'python-dill'
  'ncurses5-compat-libs'
  'libx11'
)
optdepends=(
  'python-autograd'
  'python-sourceinspect'
  'python-astpretty'
  'python-colorama'
  'python-gitpython'
  'yapf'
  'cuda')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-$_py-manylinux1_x86_64.whl")
b2sums=('7b953fb7fa60f9cdd94044f4e73b05ca102b792958d0389c39afab4b4e40fa6546a6ba181cd3758e1480e6f104a4de49a39fdeea53b340a9b902dd1ec8cd407e')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-warn-script-location --no-deps ${_name//-/_}-$pkgver-$_py-$_py-manylinux1_x86_64.whl

  cd "$pkgdir/usr/lib/python3.9/site-packages/$_name/" || exit
  # remove pyc and compile by itself
  find . -name "*.pyc" -print0 | xargs rm -rf

  # remove prefix compile pyc again
  python -O -m compileall -f "${pkgdir}/usr/lib/python3.9/site-packages/$_name/" -s "$pkgdir" -p "/"

  # manually rewrite direct_url.json
  cd "$pkgdir/usr/lib/python3.9/site-packages/$_name-$pkgver.dist-info/" || exit

  echo "{\"archive_info\": {\"hash\": \"b2sums=${b2sums[0]}\"}, \"url\": \"${source[0]}\"}" >direct_url.json

  install -Dm644 "$srcdir/$_name-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
