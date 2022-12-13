# Maintainer:  Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault

_pkgbase=nginx
pkgbase=nginx-mainline
pkgname=(nginx-mainline nginx-mainline-src)
pkgver=1.23.3
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release'
arch=('x86_64')
url='https://nginx.org'
license=('custom')
depends=('pcre2' 'zlib' 'openssl' 'geoip' 'mailcap' 'libxcrypt')
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
source=($url/download/nginx-$pkgver.tar.gz{,.asc}
        service
        logrotate)
# https://nginx.org/en/pgp_keys.html
validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
  '13C82A63B603576156E30A4EA0EA981B66B0D967' # Konstantin Pavlov <thresh@nginx.com>
)
sha512sums=('da5f473ac213f8947f40f0a69820bf981157432fe9d29cf71fe30225dadd05f5814309034f0411ea15fb70bece8ceefc0cb0b2588096c1a9496c2a36fa425d9f'
            'SKIP'
            'be2858613d9cca85d80e7b894e9d5fa7892cbddd7a677d2d2f68f419d75fdc1f6802de8014f43ce063b116afd4ff17369873a6adea2dd58ac6f94e617de66fec'
            '9232342c0914575ce438c5a8ee7e1c25b0befb457a2934e9cb77d1fe9a103634ea403b57bc0ef0cd6cf72248aee5e5584282cea611bc79198aeac9a65d8df5d7')
b2sums=('5b8980f54e3f662ec6b4f8f0a50305c91081aaba881ef94f3c60e5fced8a79710ff09aae3abda3dce7dbcd460b1a46b1d3c0007d5dc76fbec5c4c2ad91ae7aa7'
        'SKIP'
        'b6414f9917fe62cc57556a2927fb404cc839398dac64a0d60c1d45af11a4e6be71bbee5f9bae17ce3604c31ab9247e8c6aec759f86890b54f86267db1fe7c08a'
        'fe32fb75a7677abca86c4bc3f4ca9bfeccb3cd7afb4dd3c4ec21ab8b53cc0d72ba5330a1131498b5df222c2e517bd01e2df9f67256011ff15241b777a85be6b3')

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

_mainline_flags=(
)

prepare() {
  cp -r $_pkgbase-$pkgver{,-src}
}

build() {
  cd $_pkgbase-$pkgver
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
    ${_mainline_flags[@]}

  make
}

package_nginx-mainline() {
  provides=($_pkgbase)
  conflicts=($_pkgbase)

  cd $_pkgbase-$pkgver
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
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgbase/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

package_nginx-mainline-src() {
  pkgdesc="Source code of nginx-mainline $pkgver, useful for building modules"
  conflicts=($_pkgbase-src)
  depends=()
  install -d "$pkgdir/usr/src"
  cp -r $_pkgbase-$pkgver-src "$pkgdir/usr/src/nginx"
}
