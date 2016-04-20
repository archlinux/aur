# Maintainer: disprofarma <garmengol at disprofarma dot com dot ar>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault
# Contributor: SirCmpwn <sir at cmpwn dot com>

_modpkver=2.9.1
pkgname=nginx-mainline-modsecurity
provides=('nginx')
conflicts=('nginx')
pkgver=1.9.15
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release with ModSecurity module'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'apr-util' 'curl' 'lua51' 'libxml2' 'yajl' 'geoip')
makedepends=('apache')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/mime.types'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/nginx/modsecurity.conf'
        'etc/logrotate.d/nginx')
install=nginx.install
source=($url/download/nginx-$pkgver.tar.gz
        service
        logrotate
        https://www.modsecurity.org/tarball/$_modpkver/modsecurity-$_modpkver.tar.gz)
md5sums=('13cd38e9da3789035750dd45882c4a26'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7'
         '0fa92b852abc857a20b9e24f83f814cf')

_common_flags=(
  --with-ipv6
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
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
)

_mainline_flags=(
  --with-http_v2_module
  --with-mail
  --with-mail_ssl_module
  --with-stream
  --with-stream_ssl_module
  --with-threads
)

prepare() {
  cd "$srcdir"/modsecurity-$_modpkver
  ./configure \
    --enable-standalone-module \
    --disable-mlogc \
    --with-lua=/usr/include/lua5.1/
  make
}

build() {
  cd "$srcdir"/$provides-$pkgver
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
    --add-module=../modsecurity-$_modpkver/nginx/modsecurity \
    ${_common_flags[@]} \
    ${_mainline_flags[@]}

  make
}

package() {
  cd "$srcdir"/$provides-$pkgver
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done

  install -Dm644 "$srcdir"/modsecurity-"$_modpkver"/modsecurity.conf-recommended "$pkgdir"/etc/nginx/modsecurity.conf
  install -Dm644 "$srcdir"/modsecurity-"$_modpkver"/unicode.mapping "$pkgdir"/etc/nginx/unicode.mapping

  #Set SecStatusEngine Off (default)
  #Fix logs path
  #Workaraund to bug id 454 (https://github.com/SpiderLabs/ModSecurity/issues/454)
  sed -e '225s|On|Off|' \
    -e '193s|log/|log/nginx/|' \
    -e '192s|Serial|Concurrent|' \
    -i "$pkgdir"/etc/nginx/modsecurity.conf

  #Prepare modsecurity.conf and path to work with OWASP ModSecurity Core Rule Set (CRS)
  install -d "$pkgdir"/etc/nginx/modsecurity.d
  install -d "$pkgdir"/etc/nginx/modsecurity.d/activated_rules
  echo -e "\n# -- Load CRS ---------------------------------------------------------------- " \
    >> "$pkgdir"/etc/nginx/modsecurity.conf
  echo -e "\nIncludeOptional modsecurity.d/*.conf\nIncludeOptional modsecurity.d/activated_rules/*.conf" \
    >> "$pkgdir"/etc/nginx/modsecurity.conf

}
