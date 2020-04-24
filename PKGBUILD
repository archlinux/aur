# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mod-upstream-fair
pkgver=0.1.3
pkgrel=6
_dirname="nginx-upstream-fair-$pkgver"
_nginxver=1.18.0

pkgdesc='Fair load balancer module for nginx'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
makedepends=("nginx-src")
url='https://github.com/itoffshore/nginx-upstream-fair'
license=('unknown')

source=("$pkgname-$pkgver::https://github.com/itoffshore/nginx-upstream-fair/archive/$pkgver.tar.gz")
sha256sums=('5545e2f2a27d008690a2c60b90c0bf8a997310930d93fca80ebd33dc308ac2fc')

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
  cp -r /usr/src/nginx .
  cd "$srcdir"/nginx
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  cd "$srcdir"/nginx/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
