# Maintainer: Fabiano Furtado <fusca14 <at> gmail <dot> com>
# Date: 2022-05-30
# Description: patches to remove the HTTP server header
# Changes:
#   * "ServerTokens" default value = "off"
#   * "ServerTokens off;": "server header" removed from webserver's header response
#   * "ServerTokens on;": default header "Server: ws"

pkgbase=nginx-without-server-header
_pkgbase=nginx
pkgname=(nginx-without-server-header)
pkgver=1.22.1
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server without server header'
arch=(x86_64)
url='https://nginx.org'
license=(custom)
depends=(pcre2 zlib openssl geoip mailcap libxcrypt)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached
              memcached ffmpeg) 
conflicts=(nginx nginx-src)
backup=(etc/nginx/fastcgi.conf
        etc/nginx/fastcgi_params
        etc/nginx/koi-win
        etc/nginx/koi-utf
        etc/nginx/nginx.conf
        etc/nginx/scgi_params
        etc/nginx/uwsgi_params
        etc/nginx/win-utf
        etc/logrotate.d/nginx)
install=nginx.install
source=($url/download/nginx-$pkgver.tar.gz
        service
        logrotate
        ngx_http_core_module.c.patch
        ngx_http_core_module.h.patch
        ngx_http_header_filter_module.c.patch
        ngx_http_special_response.c.patch
        ngx_http_v2_filter_module.c.patch)

#validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha512sums=('1d468dcfa9bbd348b8a5dc514ac1428a789e73a92384c039b73a51ce376785f74bf942872c5594a9fcda6bbf44758bd727ce15ac2395f1aa989c507014647dcc'
            'be2858613d9cca85d80e7b894e9d5fa7892cbddd7a677d2d2f68f419d75fdc1f6802de8014f43ce063b116afd4ff17369873a6adea2dd58ac6f94e617de66fec'
            '9232342c0914575ce438c5a8ee7e1c25b0befb457a2934e9cb77d1fe9a103634ea403b57bc0ef0cd6cf72248aee5e5584282cea611bc79198aeac9a65d8df5d7'
            '4508ce782553912cce5e4c3133a223b754c8cf52722471b4860651e9033e3e11f975738918974569719af8999b0564aa1279410f8590f7048e8e192d8f5c040f'
            'f19a1c4f2509344fd7e23c7077a5d033d5adaa8c1e2fcf3c45d98dc757d1a7757f63e98c275c3578de8312ae39f57271b771b1b776f41c141d6bdbcbb1ae7eaf'
            'b3ba62a1a4b17e33d726d5a93ec183fde7f90c2d1a35ef2dcde1106b9f5434da6eb2a2067462f1d3d99b55eb7729097632d0e32e78a61c62cfab5f9a1700645d'
            '7eb21628cb73ddb2276a76e402f1e695636e2a3c7748450ad1f7658f738bc60f03d7645503c0d165204f71d80fbb3957382578cfecffac10f69664dcba0492da'
            'a4c0dd5c89661f434cf1cf91da9bfc89e7cc425e9f8140f5801207edc0380a1ae1199b06e66d71a78f51e089aa2734c4d5fa29186f824f6d9eb216441677ddb4')

_common_flags=(
  --with-compat
  --with-debug
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
  --with-http_slice_module
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
  --with-http_v2_module
  --with-mail
  --with-mail_ssl_module
  --with-pcre-jit
  --with-stream
  --with-stream_geoip_module
  --with-stream_realip_module
  --with-stream_ssl_module
  --with-stream_ssl_preread_module
  --with-threads
)

_stable_flags=(
)

prepare() {
  # patching...
  #cd "$srcdir/$pkgname-$pkgver"
  local patch_src
  for patch_src in "${source[@]}"; do
    src="${patch_src%%::*}"
    src="${patch_src##*/}"
    [[ $patch_src = *.patch ]] || continue
    echo "Applying patch \"$srcdir/$patch_src\"..."
    patch -d "$srcdir/$_pkgbase-$pkgver" -Np1 < "$srcdir/$patch_src"
  done
}


build() {
  cd $_pkgbase-$pkgver

  ./configure \
    --prefix=/etc/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --sbin-path=/usr/bin/nginx \
    --pid-path=/run/nginx.pid \
    --lock-path=/run/lock/nginx.lock \
    --user=http \
    --group=http \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --http-client-body-temp-path=/var/lib/nginx/client-body \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    ${_common_flags[@]} \
    ${_stable_flags[@]}

  make
}

package_nginx-without-server-header() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user http;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default
  rm "$pkgdir"/etc/nginx/mime.types  # in mailcap

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 755 "$pkgdir"/var/log/nginx
  chown root:root "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}
