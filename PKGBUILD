# Maintainer: David Christenson <david@the-david.com>
# based on nginx-mainline and extra/nginx

pkgname=nginx-http2
provides=('nginx' 'nginx-mainline')
conflicts=('nginx' 'nginx-mainline')
_pkgname=nginx
pkgver=1.9.3
pkgrel=2
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release with early alpha HTTP/2 support'
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl')
makedepends=('hardening-wrapper')
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
        $url/patches/http2/patch.http2-v2_1.9.3.txt
        service
        logrotate)
md5sums=('125282e2a7321265e7dfd7d05e4e2a3d'
         '7cf13d2b21aa0cd3e1453c898b99bed8'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '19a26a61c8afe78defb8b4544f79a9a0')
sha256sums=('4298c5341b2a262fdb8dbc0a1389756181af8f098c7720abfb30bd3060f673eb'
            '8fe4d8ca0301370902123136b401e8bd7112ed6c36e92a8fd8a0d9277dc870cb'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            '2613986dd5faab09ca962264f16841c8c55c3a0bc7a5bb737eabd83143090878')

build() {
  cd "${srcdir}/$_pkgname-$pkgver"

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
    --with-threads \
    --with-stream
  make
}

prepare() {
  cd "${srcdir}/$_pkgname-$pkgver"
  patch -p1 < ../patch.http2-v2_1.9.3.txt
}

package() {
  cd "${srcdir}/$_pkgname-$pkgver"
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  rmdir "$pkgdir"/run
}
