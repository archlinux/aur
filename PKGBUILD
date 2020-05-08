# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Hui Yiqun <huiyiqun@gmail.com>

pkgbase=nginx-rtmp
_pkgbase=nginx
pkgname=(nginx-rtmp nginx-rtmp-src)
pkgver=1.18.0
_rtmpver=1.2.1
pkgrel=3
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server'
arch=(x86_64)
url='https://nginx-rtmp.blogspot.com/'
_url='https://nginx.org'
license=(custom)
depends=(pcre zlib openssl geoip mailcap)
makedepends=(mercurial)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached
              memcached ffmpeg inetutils)
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
source=($_url/download/nginx-$pkgver.tar.gz{,.asc}
        hg+http://hg.nginx.org/nginx-tests#revision=c1d167a13c24
        https://github.com/arut/nginx-rtmp-module/archive/v$_rtmpver.tar.gz
        service
        logrotate)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
provides=('nginx')
conflicts=('nginx')
sha256sums=('4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99'
            'SKIP'
            'SKIP'
            '87aa597400b0b5a05274ee2d23d8cb8224e12686227a0abe31d783b3a645ea37'
            '113bb2c530afd7f81ebccb42e6fa293fd87be2d87c99a32623097c6b97157297'
            '06ebe161af3e761f2e2e35a67c6c0af27bf61aea7cd4ba8b28372ced5e3b3175')

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
    --add-module=$srcdir/nginx-rtmp-module-$_rtmpver \
    ${_common_flags[@]} \
    ${_stable_flags[@]}

  make
}

check() {
  cd nginx-tests
  TEST_NGINX_BINARY="$srcdir/$_pkgbase-$pkgver/objs/nginx" prove .
}

package_nginx-rtmp() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 ../nginx-rtmp-module-$_rtmpver/LICENSE "$pkgdir"/usr/share/licenses/nginx-rtmp-module/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

package_nginx-rtmp-src() {
  pkgdesc="Source code of nginx $pkgver, useful for building modules"
  depends=()
  install -d "$pkgdir/usr/src"
  cp -r $_pkgbase-$pkgver-src "$pkgdir/usr/src/nginx"
}
