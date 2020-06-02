# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_secure_token"
_nginxver=1.19.0

pkgname=nginx-mainline-mod-secure-token-git
pkgver=r153.596ed5f
pkgrel=1
pkgdesc="Generates CDN tokens, either as a cookie or as a query string parameter."
arch=('i686' 'x86_64')
depends=("nginx-mainline=$_nginxver")
makedepends=('git')
provides=('nginx-mainline-mod-secure-token')
conflicts=('nginx-mainline-mod-secure-token')
url="https://github.com/kaltura/nginx-secure-token-module"
license=('CUSTOM')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$_modname::git+https://github.com/kaltura/nginx-secure-token-module.git"
)

validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('44a616171fcd7d7ad7c6af3e6f3ad0879b54db5a5d21be874cd458b5691e36c8'
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
