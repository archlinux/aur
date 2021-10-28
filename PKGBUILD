# Based on PKGBUILDs by Caleb Maclennan <caleb@alerque.com>

_rockname=MobDebug
pkgbase="lua-${_rockname,,}-git"
pkgname=("$pkgbase" "${pkgbase/lua/lua53}" "${pkgbase/lua/lua52}")
pkgver=0.80.r2.g2efd76b
pkgrel=3
pkgdesc='Remote debugger for Lua'
arch=('i686' 'x86_64')
url="https://github.com/pkulchenko/$_rockname"
license=('custom:MIT')
makedepends=('git' 'luarocks' 'lua' 'lua53' 'lua52')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
   cd "$_rockname"
   git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
  cd "$_rockname"
  _rockver="$(git describe --abbrev=0)"
  shopt -s nullglob
  _rockspecs=("misc/${_rockname,,}-$_rockver-"*".rockspec")
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "${_rockspecs[-1]}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-mobdebug-git() {
  depends=('lua' 'lua-socket')
  provides=("${pkgname%-git}")
  _package_helper 5.4
}

package_lua53-mobdebug-git() {
  depends=('lua53' 'lua53-socket')
  provides=("${pkgname%-git}")
  _package_helper 5.3
}

package_lua52-mobdebug-git() {
  depends=('lua52' 'lua52-socket')
  provides=("${pkgname%-git}")
  _package_helper 5.2
}
