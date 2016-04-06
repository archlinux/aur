# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_ngx_ver=1.9.14
_mod_name=headers-more

pkgname=nginx-mod-headers-more-git
pkgver=0.29.r8.gf5559ec
pkgrel=2
pkgdesc='Nginx module for setting and clearing input and output headers'
arch=('i686' 'x86_64')
url='https://github.com/openresty/headers-more-nginx-module'
license=('custom')
depends=("nginx-mainline=$_ngx_ver")
makedepends=('git')
source=(git://github.com/openresty/${_mod_name}-nginx-module.git
        http://nginx.org/download/nginx-${_ngx_ver}.tar.gz)
md5sums=('SKIP'
         'a25818039f34b5d54b017d44c76321c4')

_ngx_flags=(
  --with-file-aio
  --with-http_addition_module
  --with-http_auth_request_module
  --with-http_dav_module
  --with-http_degradation_module
  --with-http_flv_module
  --with-http_geoip_module
  --with-http_gunzip_module
  --with-http_gzip_static_module
  --with-http_mp4_module
  --with-http_realip_module
  --with-http_secure_link_module
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
  --with-http_v2_module
  --with-ipv6
  --with-mail
  --with-mail_ssl_module
  --with-pcre-jit
  --with-stream
  --with-stream_ssl_module
  --with-threads
)

pkgver() {
  cd ${_mod_name}-nginx-module
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd nginx-${_ngx_ver}
  ./configure --prefix=/usr ${_ngx_flags[@]} \
    --add-dynamic-module="$srcdir"/${_mod_name}-nginx-module
  make -f objs/Makefile modules
}

package() {
  cd nginx-${_ngx_ver}
  install -Dm755 objs/ngx_http_headers_more_filter_module.so \
    "$pkgdir"/usr/lib/nginx/modules/ngx_http_headers_more_filter_module.so

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  sed -n '487,512p' "$srcdir"/${_mod_name}-nginx-module/README.markdown > \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

