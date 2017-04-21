# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=lua-penlight-git
pkgver=1.5.2.r0.g3f8aaa8
pkgrel=1
pkgdesc="A set of pure Lua libraries focusing on input data handling, functional programming, and OS path management"
url="https://github.com/stevedonovan/Penlight"
arch=('any')
license=('MIT')
conflicts=('lua-penlight')
provides=('lua-penlight')
depends=('bash' 'lua')
source=("${pkgname}::git://github.com/stevedonovan/Penlight.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname}
  install -dm644              "${pkgdir}/usr/share/doc/${pkgname}/" # Create doc directory
  cp -a doc/manual examples   "${pkgdir}/usr/share/doc/${pkgname}/" # Copy documentation and examples into doc/
  cp -a doc/config.ld         "${pkgdir}/usr/share/doc/${pkgname}/examples" # Copy example config.ld to examples
  install -DTpm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" # Copy license file and create directory

  # Find which 5.x lua versions are installed on this system
  INSTALLED_LUA_VERSIONS=`find /usr/share/lua -maxdepth 1 -type d -iname "5.*" -printf "%f\n"`

  # Install the actual libraries into any 5.x version path
  while read -r luaversion; do
      mkdir -p       "${pkgdir}/usr/share/lua/${luaversion}/pl"
      cp -a lua/pl/* "${pkgdir}/usr/share/lua/${luaversion}/pl"
  done <<< $INSTALLED_LUA_VERSIONS
}
