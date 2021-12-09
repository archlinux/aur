#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-taichi
_name=${pkgname#python-}
_py=cp39
pkgver=0.8.7
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
b2sums=('ca965162edc70c98db23feec92d0bd390021b1e59f5137656ee32453e469ea59d53adcfb290424f867a0ff6b6e339aeaacb9d4df681a67ebbbe227852156eb6f')

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
