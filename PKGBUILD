# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgbase=angie
pkgname=(angie angie-src)
pkgver=1.10.3
pkgrel=1
arch=('x86_64')
url="https://github.com/webserver-llc/angie"
license=('BSD')
makedepends=(pcre2 zlib openssl geoip mailcap libxcrypt)
#checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached memcached ffmpeg)
source=(https://download.angie.software/files/$pkgbase-$pkgver.tar.gz
        angie.service
        logrotate
        https://angie.software/keys/angie-signing.gpg)
sha512sums=('a47771dfad8ed137830e8e9236ae30b77cff6d0654d444298049e6faffecb3bd33c84b03974afb0858c8698ceeca9a472db2d971453c76b65b4a69057078becb'
            '65e3ba379411c638db6ac506b08efc118c975b00f65ed43c8af9d45d564711d55520bf56524e787df31a9b7dc65af4c7454b3b9baf2f8f013a44d9087be53a51'
            '2f4dfcfa711b8bcbc5918ba635f5e430ef7132e66276261ade62bb1cba016967432c8dce7f84352cb8b07dc7c6b18f09177aa3eb92c8e358b2a106c8ca142fe9'
            'f3e2b68cfae760fd04ad4829834bf562bb65a9204e2c83798550b4e53a12f532c878148b2c675370f9fef069b58b68e5b99b3b6fe6fe4f4e046ad61bab538c74')
b2sums=('b43c8ff28f1c376690dbfcb8e5ccae3deb9767a16106160ebb28a31585d343d4ab94acde4b42c3de80315ebce717d3d5bd1fe6e04a718f02c17faf1bee663d05'
        '27619a4a3ca0c1b977c54c8ba99fa19abebef37e8eff7c211567e47a98b80ce038f7ec20b7ec936aa0f8945a16fe064cf1fe58d68db3d493f4f63d057d5bf007'
        'e1755f61b4eaece83c6c22e48f9e5e316851d1dc35f8d770f837c7d3c8bdc894af1b697c25f1788ac50cd597085c22fb9bf8096a55ecf7659d63185f68ba2d8a'
        '7957894d9973ddc8ca44a3ac1844eefbf71f2681ae57d51fcdd0ca570c0cafbb027d05fa2b288d695e7069eb26600d0099cc354fcc4b9061971243b384edd01a')

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
  --with-http_random_index_module
  --with-http_realip_module
  --with-http_secure_link_module
  --with-http_slice_module
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
  --with-http_v2_module
  --with-http_v3_module
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

prepare() {
  cp -r $pkgbase-$pkgver{,-src}
}

build() {
  cd $pkgbase-$pkgver
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
    "${_common_flags[@]}"
  make
}

#check() {
#  cd $pkgbase-$pkgver/tests
#  TEST_NGINX_BINARY="$srcdir/$pkgbase-$pkgver/objs/nginx" prove .
#}

package_angie() {
  pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, drop-in replacement for nginx'
  depends=('pcre2' 'zlib' 'openssl' 'geoip' 'mailcap' 'libxcrypt')
  provides=(nginx)
  conflicts=(nginx)
  backup=('etc/nginx/fastcgi.conf'
          'etc/nginx/fastcgi_params'
          'etc/nginx/koi-win'
          'etc/nginx/koi-utf'
          'etc/nginx/nginx.conf'
          'etc/nginx/scgi_params'
          'etc/nginx/uwsgi_params'
          'etc/nginx/win-utf'
          'etc/logrotate.d/nginx')

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user http;|g' \
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
  install -Dm644 ../angie.service "$pkgdir"/usr/lib/systemd/system/angie.service
  ln -sf /usr/lib/systemd/system/angie.service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgbase/LICENSE

  rmdir "$pkgdir"/run

  install -Dm0644 objs/angie.8 "$pkgdir"/usr/share/man/man8/angie.8

  ln -sf /usr/bin/nginx "$pkgdir"/usr/bin/angie

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 contrib/vim/$i/angie.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/angie.vim"
  done
}

package_angie-src() {
  pkgdesc="Source code of angie $pkgver, useful for building modules"
  conflicts=(nginx-src)

  install -d "$pkgdir/usr/src"
  cp -r $pkgbase-$pkgver-src "$pkgdir/usr/src/angie"
}

