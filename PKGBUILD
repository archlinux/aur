# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=cd
_pkglongname=canvasdraw
pkgver=5.11
pkgrel=1
pkgdesc="C platform-independent graphics library, aka canvasdraw."
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/cd/"
license=('MIT')
makedepends=('freetype2' 'libx11' 'libxpm' 'libxmu' 'libxft' 'gtk2' 'lua')
depends=('ftgl' 'im>=3.7' 'gtk2' 'pangox-compat')
optdepends=('lua: bindings for Lua are available')

source=("http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/${pkgname}-${pkgver}_Sources.tar.gz")
sha1sums=('9235250a53dc5e9841bf8b87e062df5aaf5fa1b3')

prepare() {
  cd "$srcdir/$pkgname"
  # tweak this to run as not-root
  sed -i 's/^Pause/#&/' config_lua_module
  sed -i "s|\$TEC_LUA_LIB|$pkgdir&|" config_lua_module
  sed -i 's/lib64/lib/' tec_uname
}

build() {
  cd "$srcdir/$pkgname"
  
  find ./ -type d -exec chmod 0755 "{}" \;
  find ./ -type f -exec chmod 0644 "{}" \;

  make -j1
}

package() {
  cd "$srcdir/$pkgname"

  USE_LUA53=Yes bash config_lua_module

  mkdir -p "$pkgdir/usr/lib"
  pushd lib
  install -m644 Linux*/libcd*.a "$pkgdir/usr/lib/"
  install -m755 Linux*/libcd*.so "$pkgdir/usr/lib/"
  install -m644 Linux*/libpdflib.a "$pkgdir/usr/lib/"
  install -m755 Linux*/libpdflib.so "$pkgdir/usr/lib/"
  popd
  mkdir -p "$pkgdir/usr/include"
  install include/* "$pkgdir/usr/include/"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
