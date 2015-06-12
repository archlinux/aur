# Based on community/nginx
# Maintainer: Firegore <admin@firegore.com>
pkgname=nginx-mainline-waf
_pkgname=nginx
provides=('nginx')
conflicts=('nginx')
pkgver=1.9.1
pkgrel=3
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline, with ngx_pagespeed, Naxsi, GeoIP (GeoIP Legacy) and YubiKey Auth Support builtin, with Thread Pools.'
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')

_psver=1.9.32.3-beta
_psolver=1.9.32.3

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
md5sums=('fc054d51effa7c80a2e143bc4e2ae6a7'
         '74cfc43f35b21dd25cea4b98cf093ebf'
         'd8eef6df918da873823a34bbf979875f'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7')
sha1sums=('b021d26bcefd41c8b9f9f35f263edf005e0f41dd'
          'e8348f87284df0148392f8cef188a96a2b453a10'
          'e97903dc9f6ff4b5dce4f73007909b4d97f8ee8e'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'df6dd84b41f5127fec39216d578cfbbe1815699f'
          'e43ccb1e8eb90bea64cb3cd0967a2df891473834')
sha256sums=('09f555fae694c0944f172b575ad239f56d40d14559d98e843de0a690f38c1dad'
            '167100fb198a0a4dd622747cd37ab520f42786f1ee6c7d444f585dacc4d88570'
            'b0aa65cd3a917c27b02b62d71582ffcf790639cbd73ae9d6e8374c5bc5fde9e2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98')
