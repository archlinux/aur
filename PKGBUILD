# Maintainer: James An <james@jamesan.ca>

pkgname=nginx-upload-module-git
_pkgname=${pkgname%-git}
pkgver=2.2.0.r25.gaba1e3f
pkgrel=2
pkgdesc="Module for nginx web server for handling file uploads using multipart/form-data encoding (RFC 1867)"
arch=('i686' 'x86_64' 'any')
url="https://github.com/jamesan/$_pkgname"
license=('GPL')
depends=()
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/vkholodkov/$_pkgname.git#branch=2.2"
        http://nginx.org/download/nginx-1.10.2.tar.gz
        config)
md5sums=('SKIP'
         'e8f5f4beed041e63eb97f9f4f55f3085'
         '4a291a76ae504098afc75f0b83fa312d')

_common_flags=(
  --with-ipv6
  --with-pcre-jit
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
  --with-mail
  --with-mail_ssl_module
  --with-stream
  --with-stream_ssl_module
  --with-threads
)

_stable_flags=(
)

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  [ -f config ] && rm config
  cp -a "$srcdir/config" .
}

build() {
  cd nginx-1.10.2

  ./configure \
    --prefix=/etc/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --sbin-path=/usr/bin/nginx \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/lock/nginx.lock \
    --user=http \
    --group=http \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=stderr \
    --http-client-body-temp-path=/var/lib/nginx/client-body \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    ${_common_flags[@]} \
    ${_stable_flags[@]} \
    --add-dynamic-module="$srcdir/$_pkgname"

  make modules
}

package() {
  cd nginx-1.10.2

  install -Dm755 objs/ngx_http_upload_module.so "$pkgdir/etc/nginx/modules/ngx_http_upload_module.so"
}
