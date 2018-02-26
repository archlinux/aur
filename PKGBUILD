
pkgname=nginx-mainline-passenger
pkgver=1.13.9
pkgrel=2
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release'
arch=('x86_64')
url='https://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'geoip' 'passenger-nginx-module')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx')
install=nginx.install
provides=('nginx')
conflicts=('nginx')
source=($url/download/nginx-$pkgver.tar.gz{,.asc}
        service
        logrotate
        nginx.conf)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('dcd482dd98d2022659212f183e8fe81b'
         'SKIP'
         'ef491e760e7c1ffec9ca25441a150c83'
         '6a01fb17af86f03707c8ae60f98a2dc2'
         'd8bca99da74aeea48210025c957a9c12')
sha512sums=('92c34c182b59e0597a6b0af996770673b08b075f47285e2fbb9d8df59bb9c38fcca8e77bc6e3ca8e019500d041f96437b6b4f80d5dfd914a6f843ca919dac07b'
            'SKIP'
            '4f90db6b8b5c13762b96ddff9ca4e846762d46b90be27c7c9d54cec6f7f12fc95585f8455919296edb0255405dd80af8ee86780b805631b72eb74ee59f359715'
            '9232342c0914575ce438c5a8ee7e1c25b0befb457a2934e9cb77d1fe9a103634ea403b57bc0ef0cd6cf72248aee5e5584282cea611bc79198aeac9a65d8df5d7'
            '90aa39995592a91106b69da29b071bc266fd1cc6d2cfc4addffeaa9e58a5e063cd91525605b9015a48afa27b6232428a50ce45a49acd04ffceeeb848539aa482')

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

_passenger_flags=(
  --add-module=$(/usr/lib/passenger/bin/passenger-config --nginx-addon-dir)
)

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
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    ${_common_flags[@]} \
    ${_passenger_flags[@]}

  make
}

package() {
  cd $provides-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default "$pkgdir"/etc/nginx/nginx.conf

  # Install custom configuration:
  install -Dm644 ../nginx.conf "$pkgdir"/etc/nginx/

  # Create sites directory:
  mkdir "$pkgdir"/etc/nginx/sites

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 755 "$pkgdir"/var/log/nginx
  chown root:root "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}
