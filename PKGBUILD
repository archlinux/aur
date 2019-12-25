# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_brotli"
_nginxver=1.17.7

pkgname=nginx-mainline-mod-brotli-git
pkgver=r43.e505dce
pkgrel=1
pkgdesc="Brotli compression filter module for mainline nginx"
arch=('i686' 'x86_64')
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

sha256sums=('b62756842807e5693b794e5d0ae289bd8ae5b098e66538b2a91eb80f25c591ff'
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
