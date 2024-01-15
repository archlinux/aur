# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=hererocks
pkgver=0.25.1
pkgrel=6
pkgdesc="Python script for installing Lua/LuaJIT and LuaRocks into a local directory"
arch=(any)
url="https://github.com/luarocks/hererocks"
license=(MIT)
depends=(
  git
  python
  unzip
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bd3769fb9f7ac944f67601575a6c0aad7118e89ebba418985a126c2412f1f9e0')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --deselect test/cli_test.py::TestCLI::test_install_latest_lua_with_latest_luarocks \
    --deselect test/cli_test.py::TestCLI::test_install_latest_lua_with_luarocks_from_git \
    --deselect test/cli_test.py::TestCLI::test_install_lua_5_1_without_compat_without_readline_with_old_luarocks \
    --deselect test/cli_test.py::TestCLI::test_verbose_install_bleeding_edge_luajit_with_latest_luarocks
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
