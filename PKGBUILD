# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-slowfs-cache
pkgver=1.10
pkgrel=3
_dirname="ngx_slowfs_cache-${pkgver}"
_nginxver=1.14.2

pkgdesc='NGINX module that adds ability to cache static files'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
url='http://labs.frickle.com/nginx_ngx_slowfs_cache'
license=('CUSTOM')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver::http://labs.frickle.com/files/${_dirname}.tar.gz"
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'
            'SKIP'
            '279e0d8a46d3b1521fd43b3f78bc1c08b263899142a7cc5058c1c0361a92c89c')

prepare() {
  cd "$srcdir/$_dirname"
  echo '
  if [ "$ngx_module_link" = DYNAMIC ] ; then
      ngx_module_type=HTTP
      ngx_module_name=ngx_http_slowfs_module
      ngx_module_srcs="$ngx_addon_dir/ngx_http_slowfs_module.c"
      . auto/module
  fi' >> config
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
