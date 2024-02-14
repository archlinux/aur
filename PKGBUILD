# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault

_pkgbase=nginx
pkgbase=nginx-mainline
pkgname=(nginx-mainline nginx-mainline-src)
pkgver=1.25.4
pkgrel=1
arch=('x86_64')
url='https://nginx.org'
license=('custom')
makedepends=(mercurial pcre2 zlib openssl geoip mailcap libxcrypt)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached
              memcached ffmpeg)
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx')
source=($url/download/nginx-$pkgver.tar.gz{,.asc}
        hg+https://hg.nginx.org/nginx-tests
        nginx.service
        logrotate)
# https://nginx.org/en/pgp_keys.html
validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
  'D6786CE303D9A9022998DC6CC8464D549AF75C0A' # Sergey Kandaurov <s.kandaurov@f5.com>
  '13C82A63B603576156E30A4EA0EA981B66B0D967' # Konstantin Pavlov <thresh@nginx.com>
)
sha512sums=('72a4aa8ed675f5a27ac723a73e556bbb5ae979a2fe79f9c2f4fb20bd7e719c797af8e2868044b7f2cf58be2a351a268599c8eb1e66719098d4142abab7632bb5'
            'SKIP'
            'SKIP'
            'ca7d8666177d31b6c4924e9ab44ddf3d5b596b51da04d38da002830b03bd176d49354bbdd2a496617d57f44111ad59833296af87d03ffe3fca6b99327a7b4c3c'
            '2f4dfcfa711b8bcbc5918ba635f5e430ef7132e66276261ade62bb1cba016967432c8dce7f84352cb8b07dc7c6b18f09177aa3eb92c8e358b2a106c8ca142fe9')
b2sums=('3236751f9e7ced1a6b79e957c7a4cf19070bf430a30b322b09924a72574ad514bf2989829d5da599c6058fc5f8673b2ad608a3bd57380578883f2c091ff70983'
        'SKIP'
        'SKIP'
        '5aa8dab4d6517fc09a96f2ced5c85a67a44878da4c5cde1031a089609d3d32505d0cb45e6842a1502cc6f09e03eef08ee0ce6826b73bcfdd8087b0b695f0801c'
        'e1755f61b4eaece83c6c22e48f9e5e316851d1dc35f8d770f837c7d3c8bdc894af1b697c25f1788ac50cd597085c22fb9bf8096a55ecf7659d63185f68ba2d8a')

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

_mainline_flags=(
)

prepare() {
  cp -r $_pkgbase-$pkgver{,-src}
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
    --error-log-path=stderr \
    --http-client-body-temp-path=/var/lib/nginx/client-body \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    "${_common_flags[@]}" \
    "${_mainline_flags[@]}"

  make
}

check() {
  cd nginx-tests
  TEST_NGINX_BINARY="$srcdir/$_pkgbase-$pkgver/objs/nginx" prove .
}

package_nginx-mainline() {
  pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release'
  depends=('pcre2' 'zlib' 'openssl' 'geoip' 'mailcap' 'libxcrypt')
  provides=($_pkgbase)
  conflicts=($_pkgbase)

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
  install -Dm644 ../nginx.service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgbase/LICENSE

  rmdir "$pkgdir"/run

  install -Dm0644 objs/nginx.8 "$pkgdir"/usr/share/man/man8/nginx.8

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

package_nginx-mainline-src() {
  pkgdesc="Source code of nginx-mainline $pkgver, useful for building modules"
  conflicts=($_pkgbase-src)

  install -d "$pkgdir/usr/src"
  cp -r $_pkgbase-$pkgver-src "$pkgdir/usr/src/nginx"
}
