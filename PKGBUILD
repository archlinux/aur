# $Id$
# Maintainer: Martchus <martchus@gmx.net>

pkgname=nginx-mainline-mod-slowfs-cache
pkgver=1.10
pkgrel=6
_dirname="ngx_slowfs_cache-${pkgver}"
_nginxver=1.17.10

pkgdesc='NGINX module that adds ability to cache static files'
arch=('x86_64')
url='http://labs.frickle.com/nginx_ngx_slowfs_cache'
license=('CUSTOM')

source=( "https://nginx.org/download/nginx-$_nginxver.tar.gz"
        "$pkgname-$pkgver::http://labs.frickle.com/files/${_dirname}.tar.gz")
sha256sums=('a9aa73f19c352a6b166d78e2a664bb3ef1295bbe6d3cc5aa7404bd4664ab4b83'
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
  #cp -r /usr/src/nginx .
  cd "$srcdir"/nginx-1.17.10
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx-1.17.10/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
