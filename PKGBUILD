# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=dotbot
pkgver=1.20.1
pkgrel=2
pkgdesc="A tool that bootstraps your dotfiles"
arch=(any)
url="https://github.com/anishathalye/dotbot"
license=(MIT)
depends=(
  python
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)

_commit=840cd164d20713a8e34f3aeb4ab1121c9745fad9 # git rev-parse "$pkgver"
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
