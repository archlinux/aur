# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-upstream-fair
pkgver=0.1.3
pkgrel=3
_dirname="nginx-upstream-fair-$pkgver"
_nginxver=1.14.2

pkgdesc='Fair load balancer module for nginx'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
url='https://github.com/itoffshore/nginx-upstream-fair'
license=('unknown')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  "$pkgname-$pkgver::https://github.com/itoffshore/nginx-upstream-fair/archive/$pkgver.tar.gz"
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'
            'SKIP'
            '5545e2f2a27d008690a2c60b90c0bf8a997310930d93fca80ebd33dc308ac2fc')

prepare() {
  cd "$srcdir/$_dirname"
  echo '
  if [ "$ngx_module_link" = DYNAMIC ] ; then
      ngx_module_type=HTTP
      ngx_module_name=ngx_http_upstream_fair_module
      ngx_module_srcs="$ngx_addon_dir/ngx_http_upstream_fair_module.c"
      . auto/module
  fi' >> config
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
