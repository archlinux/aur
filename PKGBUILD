# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=dotbot
pkgver=1.21.0
pkgrel=1
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
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('57a6a11098f2303e0142d3acf7bb344d1efedee61c20cf229f34ddf05a9b1265')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
