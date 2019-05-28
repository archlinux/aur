# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-slowfs-cache
pkgver=1.10
pkgrel=4
_dirname="ngx_slowfs_cache-${pkgver}"
_nginxver=1.16.0

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
sha256sums=('4fd376bad78797e7f18094a00f0f1088259326436b537eb5af69b01be2ca1345'
            'SKIP'
            '1e81453942e5b0877de1f1f06c56ae82918ea9818255cb935bcb673c95a758a1')

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
