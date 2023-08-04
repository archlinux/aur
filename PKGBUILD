# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=hererocks
pkgver=0.25.1
pkgrel=4
pkgdesc="Tool for installing Lua and LuaRocks locally"
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
checkdepends=(
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bd3769fb9f7ac944f67601575a6c0aad7118e89ebba418985a126c2412f1f9e0')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest -k " \
    not test_install_latest_lua_with_latest_luarocks \
    and not test_install_latest_lua_with_luarocks_from_git \
    and not test_install_lua_5_1_without_compat_without_readline_with_old_luarocks \
  "
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
