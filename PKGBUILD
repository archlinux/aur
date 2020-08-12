# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_brotli"
_nginxver=1.19.2

pkgname=nginx-mainline-mod-brotli-git
pkgver=r53.25f86f0
pkgrel=2
pkgdesc="Brotli compression filter module for mainline nginx"
arch=('any')
depends=("nginx-mainline=$_nginxver" 'brotli')
makedepends=('git')
provides=('nginx-mainline-mod-brotli')
conflicts=('nginx-mainline-mod-brotli')
url="https://github.com/google/ngx_brotli"
license=('CUSTOM')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$_modname::git+https://github.com/google/ngx_brotli.git"
)

validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('7c1f7bb13e79433ee930c597d272a64bc6e30c356a48524f38fd34fa88d62473'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_modname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/$_modname
  sed 's@/usr/local@/usr@' -i config
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module=../$_modname
  make modules
}

package() {
  install -Dm644 "$srcdir"/$_modname/LICENSE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
      install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
