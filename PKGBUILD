# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

_pkgname=dotbot
pkgname="$_pkgname"-git
pkgver=1.23.0.r1.g569ff0b
pkgrel=1
pkgdesc="A tool that bootstraps your dotfiles"
arch=(any)
url="https://github.com/anishathalye/dotbot"
license=(MIT)
depends=(
  python
  python-yaml
)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatchling
)
checkdepends=(
  python-pytest
)

source=("git+$url.git")
sha256sums=('SKIP')

_archive="$_pkgname"

pkgver() {
  cd "$_archive"

  git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

_check() {
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
