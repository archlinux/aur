# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>
# Contributor:  Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault

pkgname=nginx-mainline-openssl-weak
pkgver=1.13.7+openssl_1.1.0g
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release, with weak openssl ciphers enabled for IE8'
arch=(x86_64)
_basename=nginx
_nginx_ver=1.13.7
_openssl_ver="1.1.0g"
url='https://nginx.org'
license=(custom)
depends=(pcre zlib openssl geoip mailcap)
makedepends=(mercurial)
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
provides=("nginx=$_nginx_ver")
conflicts=('nginx')
source=($url/download/nginx-$_nginx_ver.tar.gz
        service
        logrotate
	    "https://www.openssl.org/source/openssl-$_openssl_ver.tar.gz")
#validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('5fcd056b40cb5c47b053fb14a2a89e7d'
         'ef491e760e7c1ffec9ca25441a150c83'
         '6a01fb17af86f03707c8ae60f98a2dc2'
         'ba5f1b8b835b88cadbce9b35ed9531a6')

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

_mainline_flags=(
)

_openssl_flags=(
  --with-openssl="../openssl-$_openssl_ver"
  --with-openssl-opt=enable-weak-ssl-ciphers
)

pkgver() {
    echo "$_nginx_ver+openssl_$_openssl_ver"
}

build() {
  cd $_basename-$_nginx_ver
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
    ${_mainline_flags[@]} \
    ${_openssl_flags[@]}

  make
}

package() {
  cd $_basename-$_nginx_ver
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_basename/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

# vim:set ts=8 sts=2 sw=2 et:
