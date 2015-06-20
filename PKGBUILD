# Based on community/nginx
# Maintainer: Firegore <admin@firegore.com>
pkgname=nginx-mainline-waf
_pkgname=nginx
provides=('nginx')
conflicts=('nginx')
pkgver=1.9.2
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline, with ngx_pagespeed, Naxsi, GeoIP (GeoIP Legacy) and YubiKey Auth Support builtin, with Thread Pools.'
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')

_psver=1.9.32.4-beta
_psolver=1.9.32.4

depends=('pcre' 'zlib' 'openssl' 'geoip' 'yubico-c-client')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/mime.types'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx')
install=nginx.install
source=($url/download/nginx-$pkgver.tar.gz
	https://github.com/pagespeed/ngx_pagespeed/archive/release-$_psver.zip
        https://dl.google.com/dl/page-speed/psol/$_psolver.tar.gz
	git+https://github.com/nbs-system/naxsi.git
	git+https://github.com/sanderv32/ngx_http_auth_yubikey_module.git
	git+https://github.com/aperezdc/ngx-fancyindex.git
	git+https://github.com/openresty/headers-more-nginx-module.git
        service
        logrotate)

build() {
    ln -sf "$srcdir"/psol "$srcdir"/ngx_pagespeed-release*
    cd "$srcdir"/$_pkgname-$pkgver
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
    --with-mail \
    --with-mail_ssl_module \
    --with-ipv6 \
    --with-pcre-jit \
    --with-file-aio \
    --with-http_dav_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_spdy_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_addition_module \
    --with-http_degradation_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_secure_link_module \
    --with-http_sub_module \
    --with-http_geoip_module \
    --with-stream \
    --with-threads \
    --add-module=../ngx_pagespeed-release-$_psver \
    --add-module=../naxsi/naxsi_src \
    --add-module=../ngx_http_auth_yubikey_module \
    --add-module=../ngx-fancyindex \
    --add-module=../headers-more-nginx-module

  make
}

package() {
	cd "$srcdir"/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 750 "$pkgdir"/var/log/nginx
  chown http:log "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE

  rmdir "$pkgdir"/run
}

# vim:set ts=2 sw=2 et:
md5sums=('572a0f217f845d3592b5ca779066d1c3'
         '2b3fe1f14b519c99b6412dafc5e8cb2e'
         '9f4d11cabbe5cd0c6945a4a89c82bff0'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7')
sha1sums=('814855ab98d6b0900207a6e5307252b130af61a2'
          '84605b331b4e961c19de93f16e6d7ea75836d48a'
          'd0cda2462d52783ff22fefd86ff80b5945de7583'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'df6dd84b41f5127fec39216d578cfbbe1815699f'
          'e43ccb1e8eb90bea64cb3cd0967a2df891473834')
sha256sums=('80b6425be14a005c8cb15115f3c775f4bc06bf798aa1affaee84ed9cf641ed78'
            'b84cb83dd591a1350d676a18b8b409757619485f38bec237613b223420b0cc62'
            'f4d6f1788751aeb3c59931f7923b7eb2dff97743abf0bc6ae74dd5fd001207fa'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98')
