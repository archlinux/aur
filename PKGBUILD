#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-taichi
_name=${pkgname#python-}
_py=cp39
pkgver=0.8.5
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
b2sums=('d4cf6d23d3136cb258b3713b9bc797139d1616a7390133f2b4c64f0212ef2f1d22bde94e4ec708c2719a72ee4b95bf7b3586889e10dc8772ab9bc75e8478fb43')

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
