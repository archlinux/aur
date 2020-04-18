# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nginx-google_filter
_pkgname=nginx
pkgver=1.16.1
_mod1=ngx_http_google_filter_module
_mod1ver=0.2.0
_mod2=ngx_http_substitutions_filter_module
_mod2ver=0.6.4
pkgrel=1
pkgdesc="Lightweight HTTP server and IMAP/POP3 proxy server, with ngx_http_google_filter_module $_mod1ver"
provides=("nginx=${pkgver}")
conflicts=('nginx')
arch=('i686' 'x86_64')
url='https://github.com/cuber/ngx_http_google_filter_module'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'geoip')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/google.conf'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/mime.types'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx')
install=nginx.install
source=(http://nginx.org/download/${_pkgname}-${pkgver}.tar.gz
        ${_mod1}-${_mod1ver}.tar.gz::https://github.com/cuber/${_mod1}/archive/${_mod1ver}.tar.gz
        ${_mod2}-${_mod2ver}.tar.gz::https://github.com/yaoweibin/${_mod2}/archive/v${_mod2ver}.tar.gz
        service
        logrotate
        google.conf)
sha256sums=('f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b'
            '9cd68c8e092efb1a419e1087bb9ca23aab1ff8650c400c0aa815d461d79385de'
            'ed4ddbcf0c434f4a1e97b61251a63ace759792764bd5cb79ff20efe348db8db3'
            '4ecbc33ce4bf2965996f51b0c7edb677904ba5cff9a32e93e1487a428d3a751b'
            '2613986dd5faab09ca962264f16841c8c55c3a0bc7a5bb737eabd83143090878'
            '3284e7f92029b60b01c73a91d562e2faf892ff685d5bc80e03e5300c00cef869')

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

_stable_flags=(
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
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    ${_common_flags[@]} \
    ${_stable_flags[@]} \
    --add-module=../${_mod1}-${_mod1ver} \
    --add-module=../${_mod2}-${_mod2ver}

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
  rm "$pkgdir"/etc/nginx/mime.types  # in mailcap

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 755 "$pkgdir"/var/log/nginx
  chown root:root "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 ../google.conf "$pkgdir"/etc/nginx/google.conf
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

# vim:set ts=2 sw=2 et:
