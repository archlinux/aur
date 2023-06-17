# Maintainer: Fabiano Furtado <fusca14 <at> gmail <dot> com>
# Date: 2023-06-17
# Description: patches to remove the HTTP server header
# Changes:
#   * "server_tokens" default value = "off"
#   * "server_tokens off;": "server header" removed from http header response
#   * "server_tokens on;": default header "Server: ws"
#   * "server_tokens build;" is no longer valid

pkgbase=nginx-without-server-header
_pkgbase=nginx
pkgname=(nginx-without-server-header)
pkgver=1.24.0
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
sha512sums=('1114e37de5664a8109c99cfb2faa1f42ff8ac63c932bcf3780d645e5ed32c0b2ac446f80305b4465994c8f9430604968e176ae464fd80f632d1cb2c8f6007ff3'
            'be2858613d9cca85d80e7b894e9d5fa7892cbddd7a677d2d2f68f419d75fdc1f6802de8014f43ce063b116afd4ff17369873a6adea2dd58ac6f94e617de66fec'
            '9232342c0914575ce438c5a8ee7e1c25b0befb457a2934e9cb77d1fe9a103634ea403b57bc0ef0cd6cf72248aee5e5584282cea611bc79198aeac9a65d8df5d7'
            '73760c31feaaca08a2e540de0d9f5b6a4bc607ddbf148b97cbd9fcc0ba315362380419911b6588dee40ace08cc1eec392e5379835bb0bfa444de01c935969c6a'
            '7d5505520358cc1f00302d5330ccc3c51cea7dab3d0521d953406e632a5894f2243eb2f8b31bd6d53c20dbd17e4b45f4e7d6848dbd921ff0a2e622e424e5da38'
            '0ee8e33e6f515a662f03faf87bf9a67eaf820718443a084804ba1b423c56c7356830d4d86bb347d32934e2789d5e66f220a7d41a532f042b7af355497bc1e1aa'
            'b35e021d734157cb29c4609bdfb3155e139b7e630cc705be71a5ceaf23ab60dc4eacb0259a7345592dd739dd91b12d347a319620623638709ca9f3c2a22d8931'
            '10f25fcdf223beb0cbac3f6f1f3904057819380e61fd4307fe7833d8c40d280531c692ad3b1e21cc05361e2365d5e37466ef0ed6c2048208527e6a15a3845362')

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

  sed -e '2s|\<user\s\+\w\+;|user http;|' \
    -e '8i \error_log  /var/log/nginx/error.log  error;' \
    -e '21s|[#]||;22s|[#]||;23s|[#]||;25s|[#]||;25s|logs|/var/log/nginx|' \
    -e '34i \\n    types_hash_max_size 4096;\n\n    server_tokens off;\n\n    root /usr/share/nginx/html;' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  sed -e '16s|^|#|' \
    -e '17i fastcgi_param  SERVER_SOFTWARE    nginx;' \
    -i "$pkgdir"/etc/nginx/fastcgi_params

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
