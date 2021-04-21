# Maintainer: Kasei Wang <kasei@kasei.im>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_pkgbase=nginx
pkgbase=${_pkgbase}-quiche
pkgname=${pkgbase}
pkgver=1.18.0
pkgrel=2
_quichever=0.8.1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server with cloudflare quiche and boringssl for http3 support'
arch=(x86_64)
url='https://nginx.org'
license=(custom)
depends=(pcre zlib geoip mailcap)
makedepends=(git mercurial cmake rust)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached
              memcached ffmpeg inetutils) 
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
source=(https://nginx.org/download/nginx-$pkgver.tar.gz{,.asc}
        hg+http://hg.nginx.org/nginx-tests#revision=c1d167a13c24
	https://github.com/cloudflare/quiche/archive/$_quichever.tar.gz
        git+https://boringssl.googlesource.com/boringssl#commit=067cfd92f4d7da0edfa073b096d090b98a83b860
        service
        logrotate)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
md5sums=('b2d33d24d89b8b1f87ff5d251aa27eb8'
         'SKIP'
         'SKIP'
         'b9efece5ea0cf0b868e0da8c2962220a'
         'SKIP'
         'ba2e3b08ce0f0fff7cced624d0ecf7cc'
         '6a01fb17af86f03707c8ae60f98a2dc2')

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

prepare() {
  cp -r $_pkgbase-$pkgver{,-src}

  cd $srcdir/quiche-$_quichever/deps
  rm -r boringssl
  ln -s $srcdir/boringssl boringssl

  cd $srcdir/$_pkgbase-$pkgver
  patch -Np1 -i $srcdir/quiche-$_quichever/extras/nginx/nginx-1.16.patch
}

build() {
  cd $srcdir/boringssl
  mkdir build && cd build && cmake ../ && make && cd $srcdir/boringssl

  cd $srcdir/$_pkgbase-$pkgver

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
    --with-http_v3_module \
    --with-openssl=$srcdir/boringssl \
    --with-quiche=$srcdir/quiche-$_quichever \
    ${_common_flags[@]} \
    ${_stable_flags[@]}

  #touch ${srcdir}/boringssl/.openssl/include/openssl/ssl.h
  make
}

check() {
  cd nginx-tests
  TEST_NGINX_BINARY="$srcdir/$_pkgbase-$pkgver/objs/nginx" prove .
}

package_nginx-quiche() {
  provides=($_pkgbase)
  conflicts=($_pkgbase)
  cd $_pkgbase-$pkgver
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

package_nginx-quiche-src() {
  depends=()
  install -d "$pkgdir/usr/src"
  cp -r $_pkgbase-$pkgver-src "$pkgdir/usr/src/nginx-quiche"
}
