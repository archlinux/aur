# Based on aur/nginx-mainline
# Maintainer: Florent Thiéry <fthiery@gmail.com>

pkgname=nginx-mainline-rtmp
provides=('nginx')
conflicts=('nginx')
pkgver=1.9.9
pkgrel=2
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline-rtmp release'
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/mime.types'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx'
        'usr/share/nginx/html/crossdomain.xml')
install=nginx.install
source=($url/download/nginx-$pkgver.tar.gz
        service
        logrotate
        crossdomain.xml
        nginx.conf
        git+https://github.com/arut/nginx-rtmp-module.git)
md5sums=('50fdfa08e93ead7a111cba5a5f5735af'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7'
         '4d2e9c834fa2e60cd8b23185b93d2e2e'
         '114ba71ec23a15c01a3a2c22a528cf4b'
         'SKIP')

build() {
  cd $provides-$pkgver
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
    --with-stream \
    --add-module=../nginx-rtmp-module

  make
}

package() {
  cd $provides-$pkgver
  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/etc/nginx/*.default

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 750 "$pkgdir"/var/log/nginx
  chown http:log "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx
  install -Dm644 ../crossdomain.xml "$pkgdir"/usr/share/nginx/html/crossdomain.xml

  install -Dm644 ../nginx.conf "$pkgdir"/etc/nginx/nginx.conf
  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE

  for i in ftdetect indent syntax; do
  install -Dm644 contrib/vim/${i}/nginx.vim "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done

  rmdir "$pkgdir"/run
}

# vim:set ts=2 sw=2 et:
