# Maintainer: Fabiano Furtado a.k.a. fusca < fusca14 *at* gmail *dot* com >

pkgname=nginx-mod-sticky
pkgver=0.0.2
pkgrel=1

_modname="${pkgname#nginx-mod-}"
_rep_name='nginx_'$_modname'_module_ng'
_mod_dir=$pkgname'_v'$pkgver

pkgdesc="NGINX sticky module - add a sticky cookie to be always forwarded to the same upstream server."
arch=('x86_64')
depends=('nginx')
makedepends=('nginx-src')
url="https://github.com/fabianofurtado/nginx_sticky_module_ng"
license=('GPL3')

source=(
  https://github.com/fabianofurtado/$_rep_name/archive/refs/tags/v$pkgver.tar.gz
)
b2sums=('c07cce500d90f9341c1cfbd16aa4b88e8e60d40f2934450398a10f675e305ee5199865763f7a02f9c7be03c4a38cf96b92fed9cbb38f614b02b0315fab8dab2c')

prepare() {
  mv $_rep_name-$pkgver/ $_mod_dir/
  mkdir -p build
  cd build
  ln -sf /usr/src/nginx/auto
  ln -sf /usr/src/nginx/src
}

build() {
  cd build
  /usr/src/nginx/configure \
    --with-compat \
    --add-dynamic-module=../$_mod_dir
  make modules
}

package() {
  cd build/objs
  for ngx_mod in *.so; { install -Dm640 $ngx_mod $pkgdir'/usr/lib/nginx/modules/'$ngx_mod; }

  install -Dm644 $srcdir'/'$_mod_dir'/README.md' \
                 $pkgdir'/usr/share/licenses/'$pkgname'/README.md'
}
