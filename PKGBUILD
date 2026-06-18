# Maintainer: Nathan Elliott <38136612-NathanTheTerrible@users.noreply.gitlab.com>
pkgname=lua-evm
pkgver=0.2.0
pkgrel=1
pkgdesc="Pure-Lua client for Ethereum and EVM-compatible blockchains"
arch=('any')
url="https://gitlab.com/NathanTheTerrible/lua-evm"
license=('MIT')
depends=('lua')
makedepends=('make')
optdepends=(
  'luajit: required for transaction signing (v0.2+)'
  'libsecp256k1: required for transaction signing (v0.2+)'
  'gmp: required for transaction signing (v0.2+)'
  'curl: default HTTP transport (already on most systems)'
  'lua51-bitop: bitwise ops for stock Lua 5.1 users'
)
provides=("$pkgname=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d116df2529fb4163dd1a46b44b7ee6214fc54206eab3a695baff5b2ffbc9bf61')

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  make test LUA=lua
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"

  # Install Lua sources under both the default Lua 5.4 tree and the 5.1
  # tree (which LuaJIT uses on Arch) so the package works for both
  # interpreters without further user setup.
  local dest
  for dest in "$pkgdir/usr/share/lua/5.4/evm" "$pkgdir/usr/share/lua/5.1/evm"; do
    install -d "$dest"
    install -Dm644 src/evm/*.lua "$dest/"
  done
  install -Dm644 src/evm.lua "$pkgdir/usr/share/lua/5.4/evm.lua"
  install -Dm644 src/evm.lua "$pkgdir/usr/share/lua/5.1/evm.lua"

  # Examples are useful as runnable documentation.
  install -d "$pkgdir/usr/share/doc/$pkgname/examples"
  install -Dm644 examples/*.lua "$pkgdir/usr/share/doc/$pkgname/examples/"

  # Standard Arch package conventions for license and docs.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
