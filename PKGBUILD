# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_vod"
_nginxver=1.19.1

pkgname=nginx-mainline-mod-vod-git
pkgver=r1287.f46eee2
pkgrel=1
pkgdesc="NGINX-based MP4 Repackager"
arch=('i686' 'x86_64')
depends=("nginx-mainline=$_nginxver")
makedepends=('git')
provides=('nginx-mainline-mod-vod')
conflicts=('nginx-mainline-mod-vod')
url="https://github.com/kaltura/nginx-vod-module"
license=('CUSTOM')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$_modname::git+https://github.com/kaltura/nginx-vod-module.git"
)

validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=('a004776c64ed3c5c7bc9b6116ba99efab3265e6b81d49a57ca4471ff90655492'
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

  ./configure --with-compat --add-dynamic-module=../$_modname \
    --with-file-aio \
    --with-threads \
    --with-cc-opt="-O3"

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
