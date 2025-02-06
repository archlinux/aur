# Maintainer: Fabiano Furtado < fusca14 _at_ gmail *dot* com >
# Description: patches to remove the HTTP "server" header
# Changes:
#   * "server_tokens" default value = "off"
#   * "server_tokens off;": "server header" removed from http header response
#   * "server_tokens on;": default header "Server: ws"
#   * "server_tokens build;" is no longer valid

pkgbase=nginx-without-server-header
_pkgbase=nginx
pkgname=($pkgbase $pkgbase'-src')
pkgver=1.26.3
pkgrel=1
_prefix_relative='etc/nginx'
_prefix_full='/'$_prefix_relative
arch=(x86_64)
url='https://nginx.org'
license=(BSD-2-Clause)
makedepends=(pcre2 zlib openssl geoip mailcap libxcrypt)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached
              memcached ffmpeg)
conflicts=(nginx nginx-src)
install=nginx.install
source=($url/download/nginx-$pkgver.tar.gz{,.asc}
        nginx.service
        logrotate
        ngx_http_core_module.c.patch
        ngx_http_core_module.h.patch
        ngx_http_header_filter_module.c.patch
        ngx_http_special_response.c.patch
        ngx_http_v2_filter_module.c.patch
        ngx_http_v3_filter_module.c.patch)

# https://nginx.org/en/pgp_keys.html
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8'  # Maxim Dounin <mdounin@mdounin.ru>
              '43387825DDB1BB97EC36BA5D007C8D7C15D87369'  # Roman Arutyunyan <r.arutyunyan@f5.com>
              'D6786CE303D9A9022998DC6CC8464D549AF75C0A'  # Sergey Kandaurov <s.kandaurov@f5.com>
              '13C82A63B603576156E30A4EA0EA981B66B0D967') # Konstantin Pavlov <thresh@nginx.com>
sha512sums=('cd780e495796bf7413e54a6730d11d55127b0ca6563acf5c75eb2698f62cddbbf5ba61820c57b2316c0bb789fcfd17f98a27a84b525ed50f304d1b1043ffa05d'
            'SKIP'
            '490e973fac48c0b27d35c722d190c1103fc0e6f71362580739f47eea4373f2a7206a8722866c740c916a4be7e789db80d4ce56a67e751f1183e420cb314a32d8'
            '25b1054176b694dda940528df45432bdc80191ad9dd6f11b7bb02da43b3c38c592448664774ccde779bb6953f9d32a4fd55349dbad9b43a7db38a1410a47dc24'
            '67c5961fdc2b94f909127aaec2d8eb82b8d94efde24ea9c2d00311d692bc8c5265bd365032cb3be4b301602b945d2a627fab231398f4897175b43488e3ce92b8'
            'c699cc4b828f410efa1ba15a4ebd619ff8ff6869366efdf7a9d87c16781d9c2039ac9acc3cf17e28baa81d37621a388b999674763110678fae30c9ce6230b6b6'
            '0ee8e33e6f515a662f03faf87bf9a67eaf820718443a084804ba1b423c56c7356830d4d86bb347d32934e2789d5e66f220a7d41a532f042b7af355497bc1e1aa'
            'b35e021d734157cb29c4609bdfb3155e139b7e630cc705be71a5ceaf23ab60dc4eacb0259a7345592dd739dd91b12d347a319620623638709ca9f3c2a22d8931'
            '08378f1c8a9d183e60dd65c1f193b74b93d93d7fb4d7d284b661986b2d486cdd74ebefe55a6381418e0019959ceb4670b8a69ed14b04620a923c4c9a49487966'
            '9a0e9ec2738343f0676c89bc65e77f47dc68069cb75953786d0158b3c73178742d7788e6c94f923056aa850806462e5586ecb329ff91f3e09e1f1b9429dc4e75')

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
  --with-http_random_index_module
  --with-http_realip_module
  --with-http_secure_link_module
  --with-http_slice_module
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
  --with-http_v2_module
  --with-http_v3_module
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

prepare() {
  ### START PATCHING ###
  local patch_src
  for patch_src in "${source[@]}"; do
    #src="${patch_src%%::*}"
    #src="${patch_src##*/}"
    [[ $patch_src = *.patch ]] || continue
    echo -n "Applying \"$patch_src\"... "
    patch -d "$srcdir/$_pkgbase-$pkgver" -Np1 < "$srcdir/$patch_src"
  done
  ### END PATCHING ###
  cp -r $_pkgbase'-'$pkgver{,-src}
}


build() {
  cd $_pkgbase-$pkgver

  ./configure \
    --prefix=$_prefix_full \
    --conf-path=$_prefix_full/nginx.conf \
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
    --modules-path=/usr/lib/nginx/modules \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    "${_common_flags[@]}"

  make
}

package_nginx-without-server-header() {
  pkgdesc='Lightweight web server, IMAP/POP3 and TCP/UDP proxy server, without HTTP server header'
  depends=(pcre2 zlib openssl geoip mailcap libxcrypt)
  backup=($_prefix_relative/fastcgi.conf
          $_prefix_relative/fastcgi_params
          $_prefix_relative/koi-win
          $_prefix_relative/koi-utf
          $_prefix_relative/nginx.conf
          $_prefix_relative/scgi_params
          $_prefix_relative/uwsgi_params
          $_prefix_relative/win-utf
          etc/logrotate.d/nginx)

  cd $_pkgbase'-'$pkgver
  make DESTDIR="$pkgdir" install

  sed -e '2s|\<user\s\+\w\+;|user http;|' \
    -e '8i \error_log  /var/log/nginx/error.log  error;' \
    -e '21s|[#]||;22s|[#]||;23s|[#]||;25s|[#]||;25s|logs|/var/log/nginx|' \
    -e '34i \\n    types_hash_max_size 4096;\n\n    server_tokens off;\n\n    root /usr/share/nginx/html;' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i $pkgdir$_prefix_full'/nginx.conf'

  sed -e '16s|^|#|' \
    -e '17i fastcgi_param  SERVER_SOFTWARE    nginx;' \
    -i $pkgdir$_prefix_full'/fastcgi_params'

  rm "$pkgdir$_prefix_full"/*.default
  rm $pkgdir$_prefix_full'/mime.types'  # in mailcap

  install -d $pkgdir'/var/lib/nginx'
  install -dm700 $pkgdir'/var/lib/nginx/proxy'

  install -dm750 $pkgdir'/usr/lib/nginx/modules/'
  ln -s /usr/lib/nginx/modules/ $pkgdir$_prefix_full'/modules'

  chmod 755 $pkgdir'/var/log/nginx'
  chown root:root $pkgdir'/var/log/nginx'

  install -d $pkgdir'/usr/share/nginx'
  mv $pkgdir$_prefix_full'/html/' $pkgdir'/usr/share/nginx'

  install -Dm644 ../logrotate $pkgdir'/etc/logrotate.d/nginx'
  install -Dm644 ../nginx.service $pkgdir'/usr/lib/systemd/system/nginx.service'
  install -Dm644 LICENSE $pkgdir'/usr/share/licenses/'$_pkgbase'/LICENSE'

  rmdir $pkgdir'/run'

  gzip -q9 objs/nginx.8 && \
  install -Dm0644 'objs/nginx.8.gz' $pkgdir'/usr/share/man/man8/nginx.8'

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 'contrib/vim/'$i'/nginx.vim' \
      $pkgdir'/usr/share/vim/vimfiles/'$i'/nginx.vim'
  done
}

package_nginx-without-server-header-src() {
  pkgdesc='Source code of patched NGINX '$pkgver', useful for building modules'
  install -d $pkgdir'/usr/src/'
  cp -r $_pkgbase'-'$pkgver'-src' $pkgdir'/usr/src/'$_pkgbase
  install -Dm644 $_pkgbase'-'$pkgver'-src/LICENSE' \
    $pkgdir'/usr/share/licenses/'$_pkgbase'-src/LICENSE'
}
