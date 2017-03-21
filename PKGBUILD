# $Id: PKGBUILD 288541 2017-02-10 11:39:41Z anthraxx $
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_pkgname=nginx
pkgname=nginx-pam
pkgver=1.10.3
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server'
arch=('i686' 'x86_64')
url='https://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'geoip')
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
source=(https://github.com/sto/ngx_http_auth_pam_module/archive/v1.5.1.tar.gz
        $url/download/nginx-$pkgver.tar.gz{,.asc}
        service
        logrotate)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('1e0bbd4535386970d63f51064626bc9a'
         '204a20cb4f0b0c9db746c630d89ff4ea'
         'SKIP'
         '80cc5f267dfc737484f653d8b48ac6cd'
         '4ddf076f128cd1738e0c0bba493903bb')

_common_flags=(
  --with-pcre-jit
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
  --with-stream
  --with-stream_ssl_module
  --with-threads
)

_stable_flags=(
  --with-ipv6
)

build() {
  cd $_pkgname-$pkgver

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
    --add-module=${srcdir}/ngx_http_auth_pam_module-1.5.1 \
    ${_common_flags[@]} \
    ${_stable_flags[@]}

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default

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

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
}

