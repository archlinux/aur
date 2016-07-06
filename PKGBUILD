# Based on community/nginx
# Maintainer: Firegore <admin@firegore.com>
pkgname=nginx-mainline-waf
_pkgname=nginx
provides=('nginx')
conflicts=('nginx')
pkgver=1.11.2
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline, Brotli
Support, with Naxsi, Certificate Transparency, GeoIP (GeoIP Legacy).'
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')

_psver=1.9.32.4-beta
_psolver=1.9.32.4

depends=('pcre' 'zlib' 'openssl' 'geoip' 'yubico-c-client' 'libbrotli-git')
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
	#https://github.com/pagespeed/ngx_pagespeed/archive/release-$_psver.zip
    #https://dl.google.com/dl/page-speed/psol/$_psolver.tar.gz
	git+https://github.com/nbs-system/naxsi.git
    git+https://github.com/google/ngx_brotli.git
	#git+https://github.com/sanderv32/ngx_http_auth_yubikey_module.git
	#git+https://github.com/aperezdc/ngx-fancyindex.git
	git+https://github.com/openresty/headers-more-nginx-module.git
	git+https://github.com/grahamedgecombe/nginx-ct.git
        service
        logrotate)

build() {
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
    --with-http_v2_module \
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
    --add-module=../naxsi/naxsi_src \
    --add-module=../headers-more-nginx-module \
    --add-module=../nginx-ct \
    --add-module=../ngx_brotli

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

  for i in ftdetect indent syntax; do
  install -Dm644 contrib/vim/${i}/nginx.vim "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done

  rmdir "$pkgdir"/run
}

# vim:set ts=2 sw=2 et:
md5sums=('9db11337a924a665ff68c1785bcf314e'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7')
sha1sums=('3d6b4a0ea0f5b09bf83537111a8c80a3f26f81ae'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'df6dd84b41f5127fec39216d578cfbbe1815699f'
          'e43ccb1e8eb90bea64cb3cd0967a2df891473834')
