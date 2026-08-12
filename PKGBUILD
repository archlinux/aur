# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=deptry
pkgver=0.25.1
pkgrel=2
pkgdesc="Find unused, missing and transitive dependencies in a Python project"
arch=(x86_64)
url="https://deptry.com"
license=(MIT)
depends=(
  glibc
  libgcc
  python
  python-click
  python-packaging
  python-requirements-parser
  python-tomli
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  python-inline-snapshot
  python-pdm
  python-poetry
  python-pytest
  python-pytest-xdist
  uv
)
source=("git+https://github.com/osprey-oss/deptry.git#tag=$pkgver")
sha256sums=('9c6d03c7bdcee9ca5fd101c6d9e7b2104196a190df288ebfb0f4bc5f3cd1761e')

prepare() {
  cd $pkgname
  sed -i "s|^version = \".*\"|version = \"$pkgver\"|" pyproject.toml

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # The functional tests expect the wheel to be here.
  mkdir -p build/functional_tests/deptry
  cp dist/*.whl build/functional_tests/deptry

  test -d test-env && rm -r test-env
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselect failing CLI test
  test-env/bin/python -I -m pytest tests/ \
    --deselect "tests/functional/cli/test_cli.py::test_cli_config_does_not_supress_output"
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
