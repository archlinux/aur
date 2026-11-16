# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-kifield
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=3
pkgdesc="Utility for manipulating part fields in KiCad schematic files or libraries"
arch=('any')
url="https://github.com/devbisme/KiField"
license=('MIT')
depends=(
  'python'
  'python-openpyxl'
  'python-sexpdata'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8042b37bc29d597d8f0760355c07022466bd849bb6b0a1cb56108bac769c2d59')

prepare() {
  cd "$_name-$pkgver"
  # Drop the Python 2 compatibility layer (python-future is no longer in the repos)
  sed -i '/from future import standard_library/d; /standard_library.install_aliases()/d' \
    kifield/__main__.py kifield/kifield.py
  sed -i '/"future >= /d; s/"sexpdata == 1.0.0"/"sexpdata"/' setup.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/test_dir/$site_packages" python -m pytest tests/unit
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
