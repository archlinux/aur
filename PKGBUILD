# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_ngx_ver=1.10.0
_mod_name=echo

pkgname=nginx-mod-${_mod_name}-git
pkgver=0.60
pkgrel=3
pkgdesc='Nginx module that brings shell-style goodiesto nginx config file'
arch=('i686' 'x86_64')
url='https://github.com/openresty/echo-nginx-module'
license=('custom')
depends=("nginx=$_ngx_ver")
makedepends=('git')
source=("https://github.com/openresty/${_mod_name}-nginx-module/archive/${pkgver}.tar.gz
        http://nginx.org/download/nginx-${_ngx_ver}.tar.gz")
md5sums=('897338c2c4bc44f2d56ae06ab9820372'
         'c184c873d2798c5ba92be95ed1209c02')

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
  cd nginx-${_ngx_ver}/objs

  for module in *.so; do
    install -Dm755 $module "$pkgdir"/usr/lib/nginx/modules/$module
  done

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  sed -n '1806,1827p' "$srcdir"/${_mod_name}-nginx-module/README.markdown > \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
