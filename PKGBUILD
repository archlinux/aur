# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=dotbot
pkgver=1.20.3
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
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  "git+$url.git#tag=v$pkgver"
  "conftest-remove-broken-assert.patch"
)
sha256sums=(
  'b4619907b9e2cfce1880c9ee36603f3e38543b152e94941d7c0c42445317b9d9'
  '60cdeaa5b43fd8796623e72ca2b8900a178774eb3988b6943a592fcbecca19ea'
)

prepare() {
  cd "$pkgname"
  patch -Np1 -i ../conftest-remove-broken-assert.patch
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest \
    --deselect tests/test_noop.py::test_failure
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
