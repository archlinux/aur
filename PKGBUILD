# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_ngx_ver=1.18.0
_mod_name=headers-more

_pkgname=nginx-mod-${_mod_name}
pkgname=${_pkgname}-git
pkgver=255.743a4bb
pkgrel=1
pkgdesc='Nginx module for setting and clearing input and output headers'
arch=('i686' 'x86_64')
url='https://github.com/openresty/headers-more-nginx-module'
license=('custom')
depends=("nginx")
makedepends=('git')
source=(${_pkgname}::git+https://github.com/openresty/headers-more-nginx-module.git
        http://nginx.org/download/nginx-${_ngx_ver}.tar.gz)
sha512sums=(
  'SKIP'
  '8c21eeb62ab6e32e436932500f700bd2fb99fd2d29e43c08a5bfed4714c189c29c7141db551fcd5d2437303b7439f71758f7407dfd3e801e704e45e7daa78ddb'
)

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
  cd ${srcdir}/${_pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/nginx-${_ngx_ver}"

  ./configure --prefix=/usr ${_ngx_flags[@]} \
    --add-dynamic-module="${srcdir}/${_pkgname}"

  make -f objs/Makefile modules
}

package() {
  cd "${srcdir}/nginx-${_ngx_ver}"

  install -Dm755 objs/ngx_http_headers_more_filter_module.so \
    "${pkgdir}/usr/lib/nginx/modules/ngx_http_headers_more_filter_module.so"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"

  sed -n '487,512p' "${srcdir}/${_pkgname}/README.markdown" > \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
