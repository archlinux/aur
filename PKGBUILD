# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-textstat
_name=${pkgname#python-}
pkgver=0.7.13
pkgrel=2
pkgdesc="Python package to calculate readability statistics of a text object - paragraphs, sentences, articles."
arch=('any')
url="https://textstat.org"
license=('MIT')
depends=(
  'python-nltk'
  'python-pyphen'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'nltk-data'
  'python-pytest'
)
source=("$_name-$pkgver.tar.gz::https://github.com/textstat/textstat/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7d82372feb2296284b1092f7baccceb2af4b5ce151275aa0b7dfd842d964d1af')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove installed tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${site_packages}/tests/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
