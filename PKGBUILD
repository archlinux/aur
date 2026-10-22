# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logging-journald
pkgname=python-$_name
pkgver=0.6.12
pkgrel=1
pkgdesc='Pure python logging handler for writing logs to the journald using native protocol.'
arch=('any')
url='https://github.com/mosquito/logging-journald'
license=('MIT')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2b09e62d8c6c2a7f56a7f28ec2eedbbc92a8bd8f57bd4d1331eef7799c54af2a')

prepare() {
  cd "$_name-$pkgver"
  # Set the version from the release tag, as upstream's publish workflow does
  sed -i "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
