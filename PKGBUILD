# Maintainer:  peacey <peaceyall AT gmail.com>
# Contributor: DasSkelett <dasskelett AT dasskelett.dev>
# Contributor: Kasei Wang <kasei AT kasei.im>
# Contributor: Bartłomiej Piotrowski <bpiotrowski AT archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault

_pkgbase=nginx
_pkgname=nginx-quic
pkgbase=nginx-quic-openssl-hg
pkgname=(nginx-quic-openssl-hg nginx-quic-openssl-hg-src)
pkgver=1.21.6.r8861.55b38514729b
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, HTTP/3 QUIC branch built with OpenSSL 3.0 (quictls fork). Mercurial repo version.'
arch=('i686' 'x86_64')
url='https://nginx.org'
license=('custom')
depends=('geoip' 'libxcrypt' 'mailcap' 'pcre2' 'zlib')
makedepends=('cmake' 'git' 'go' 'mercurial')
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
provides=('nginx' 'nginx-mainline')
conflicts=('nginx')
source=("$_pkgname::hg+https://hg.nginx.org/nginx-quic#branch=quic"
        "openssl::git+https://github.com/quictls/openssl"
        "service"
        "logrotate")
sha256sums=('SKIP'
            'SKIP'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            'b9af19a75bbeb1434bba66dd1a11295057b387a2cbff4ddf46253133909c311e')

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

_quic_flags=(
  --with-http_v3_module
  --with-stream_quic_module
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "$(hg tags -q | grep -v tip | head -n1 | sed s/^release-//)" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  # Backup pristine version of nginx source for -src package
  test -d "$srcdir/$_pkgname-src" && rm -r "$srcdir/$_pkgname-src"
  cp -r "$srcdir/$_pkgname" "$srcdir/$_pkgname-src"
}

build() {
  cd "$srcdir/$_pkgname"
  ./auto/configure \
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
    --with-openssl="$srcdir/openssl" \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    ${_common_flags[@]} \
    ${_mainline_flags[@]} \
    ${_quic_flags[@]}

  make
}

package_nginx-quic-openssl-hg() {
  cd $_pkgname
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
  install -Dm644 docs/text/LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE
  install -d "$pkgdir"/usr/share/licenses/$_pkgname
  ln -s /usr/share/licenses/$provides/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c docs/man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}

package_nginx-quic-openssl-hg-src() {
  pkgdesc="Source code of $_pkgname-openssl-hg $pkgver, useful for building modules"
  arch=('any')
  provides=('nginx-src' 'nginx-mainline-src')
  conflicts=($_pkgbase-src)
  depends=()
  backup=()
  install -d "$pkgdir/usr/src"
  test -d "$pkgdir/usr/src/nginx" && rm -r "$pkgdir/usr/src/nginx"
  cp -r "$srcdir/$_pkgname-src" "$pkgdir/usr/src/nginx"
  # Delete the .hg directory, it is huge and not needed
  rm -r "$pkgdir"/usr/src/nginx/{.hg,.hgtags}
  # Link the 'configure' script to its location in release tarballs,
  # as this is where modules expect it
  ln -s /usr/src/nginx/auto/configure "$pkgdir/usr/src/nginx"
}

# vim:set ts=2 sw=2 et:
