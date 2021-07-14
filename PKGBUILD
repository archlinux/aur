# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname='python-taichi'
_name=${pkgname#python-}
_py='cp39'
pkgver=0.7.26
pkgrel=1
pkgdesc="Productive & portable programming language for high-performance, sparse & differentiable computing on CPUs & GPUs"
arch=('x86_64')
url="https://github.com/taichi-dev/taichi"
license=('MIT')
depends=('python'
  'python-astor'
  'python-numpy'
  'pybind11'
  'python-pillow'
  'python-dill'
  'ncurses5-compat-libs'
  'libx11'
)
optdepends=('python-autograd'
  'python-sourceinspect'
  'python-astpretty'
  'python-colorama'
  'python-gitpython'
  'yapf'
  'cuda')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux1_x86_64.whl")

b2sums=('a0efba9e913013cbae8b0d8e7bac1dfe5a91abfee12be961e69cfabea614e0fbc1b124694264a561d7ecd3863964a42dc58938198420ebdbf1be3913169a4193')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-warn-script-location --no-deps ${_name//-/_}-$pkgver-$_py-${_py}-manylinux1_x86_64.whl

  cd $pkgdir/usr/lib/python3.9/site-packages/$_name/
  # remove pyc and compile by my self
  find . -name "*.pyc" | xargs rm -rf

  # remove prefix
  python -O -m compileall -f "${pkgdir}/usr/lib/python3.9/site-packages/$_name/" -s "${pkgdir}" -p "/"

  # manually rewrite direct_url.json
  cd $pkgdir/usr/lib/python3.9/site-packages/$_name-$pkgver.dist-info/
  echo "{\"archive_info\": {\"hash\": \"b2sums=$b2sums\"}, \"url\": \"$source\"}" >direct_url.json

  install -Dm644 "$srcdir/$_name-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
