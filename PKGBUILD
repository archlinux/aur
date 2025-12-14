# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-textstat
_name=${pkgname#python-}
pkgver=0.7.12
pkgrel=1
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
sha256sums=('69c876c44fc415b00ae0500162485404182ae77351dc0b5fec8f757e8c15b644')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove installed tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "${pkgdir}${site_packages}/tests/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
