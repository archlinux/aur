# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_brotli"

pkgname=nginx-mainline-mod-brotli-git
pkgver=r54.9aec15e
pkgrel=1
pkgdesc="Brotli compression filter module for mainline nginx"
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'brotli')
makedepends=('git' 'nginx-mainline-src')
provides=('nginx-mainline-mod-brotli')
conflicts=('nginx-mainline-mod-brotli')
url="https://github.com/google/ngx_brotli"
license=('CUSTOM')
source=("$_modname::git+https://github.com/google/ngx_brotli.git")
validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)
sha256sums=('SKIP')

pkgver() {
  cd "$_modname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r /usr/src/nginx .

	cd "$srcdir"/$_modname
	sed 's@/usr/local@/usr@' -i config
}

build() {
  cd "$srcdir"/nginx
 
  ./configure --with-compat --add-dynamic-module=../$_modname
 
  make modules
}

package() {
  install -Dm644 "$srcdir"/$_modname/LICENSE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
