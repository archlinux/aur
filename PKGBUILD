# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgbase=nginx-pagespeed
_pkgbase=nginx
pkgname=(nginx-pagespeed nginx-pagespeed-src)
pkgver=1.18.0+1.13.35.2
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server'
arch=('i686' 'x86_64')
url='https://developers.google.com/speed/pagespeed/module/'
_url='https://nginx.org'
license=('custom')
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
conflicts=('nginx')
replaces=('nginx')
provides=('nginx')
source=($_url/download/nginx-${pkgver%+*}.tar.gz{,.asc}
	hg+http://hg.nginx.org/nginx-tests#revision=c1d167a13c24
	https://github.com/apache/incubator-pagespeed-ngx/archive/v${pkgver#*+}-stable.tar.gz
	https://dl.google.com/dl/page-speed/psol/${pkgver#*+}-x64.tar.gz
        service
        logrotate)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99'
            'SKIP'
            'SKIP'
            '68242a30308b21f13de9a36f2aea5c3e34e8a4c0b7c6a37d3369334f6f847d36'
            'df3ba3c8fc54e13845d0a1daa7a6e3d983126c23912851bbf8ba35be646a434f'
            '113bb2c530afd7f81ebccb42e6fa293fd87be2d87c99a32623097c6b97157297'
            '06ebe161af3e761f2e2e35a67c6c0af27bf61aea7cd4ba8b28372ced5e3b3175')

_common_flags=(
  --with-compat
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
  cp -r $_pkgbase-${pkgver%+*}{,-src}
}

build() {
  cd $_pkgbase-${pkgver%+*}

  [[ ! -d $srcdir/incubator-pagespeed-ngx-${pkgver#*+}-stable/psol ]] && mv $srcdir/psol $srcdir/incubator-pagespeed-ngx-${pkgver#*+}-stable/

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
    ${_common_flags[@]} \
    ${_stable_flags[@]} \
    --add-module=$srcdir/incubator-pagespeed-ngx-${pkgver#*+}-stable

  make
}

check() {
  cd nginx-tests
  TEST_NGINX_BINARY="$srcdir/$_pkgbase-${pkgver%+*}/objs/nginx" prove .
}

package_nginx-pagespeed() {
  cd $_pkgbase-${pkgver%+*}
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

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
}

package_nginx-pagespeed-src() {
  pkgdesc="Source code of nginx ${pkgver%+*}, useful for building modules"
  depends=()
  install -d "$pkgdir/usr/src"
  cp -r $_pkgbase-${pkgver%+*}-src "$pkgdir/usr/src/nginx"
}
# vim:set ts=2 sw=2 et:
