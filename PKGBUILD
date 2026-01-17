# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=dotbot
pkgver=1.24.0
pkgrel=1
pkgdesc="A tool that bootstraps your dotfiles"
arch=('any')
url="https://github.com/anishathalye/dotbot"
license=('MIT')
depends=(
  'python'
  'python-yaml'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')

# Using git source because the test suite (test_shim.py) requires git metadata
source=("git+$url.git#tag=v$pkgver")
sha256sums=('bb7d56b2a66f407d017274506ea1b920fb5279a4fd45aaa1bcbc28b400c4df87')

_archive="$pkgname"

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"
  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  pytest
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_archive"
}
