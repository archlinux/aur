# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=nginx-hg
pkgver=r5719.7f425d67f91a
pkgrel=1
pkgdesc="Lightweight HTTP server and IMAP/POP3 proxy server (hg version)"
arch=('i686' 'x86_64')
url="http://nginx.org"
license=('custom')
depends=('pcre' 'openssl')
makedepends=('mercurial')
provides=('nginx')
conflicts=('nginx')
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
source=("${pkgname}::hg+http://hg.nginx.org/nginx/"
        'service'
        'logrotate')
md5sums=('SKIP'
         '5dd4d09914a4403b9df778ec1d66167c'
         '3441ce77cdd1aab6f0ab7e212698a8a7')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${pkgname}"
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
    --with-imap \
    --with-imap_ssl_module \
    --with-ipv6 \
    --with-pcre-jit \
    --with-file-aio \
    --with-http_dav_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_spdy_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_addition_module \
    --with-http_degradation_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_secure_link_module \
    --with-http_sub_module

  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "${pkgdir}/etc/nginx/nginx.conf"

  rm "${pkgdir}"/etc/nginx/*.default

  install -d "${pkgdir}/var/lib/nginx"
  install -dm700 "${pkgdir}/var/lib/nginx/proxy"

  chmod 750 "${pkgdir}/var/log/nginx"
  chown http:log "${pkgdir}/var/log/nginx"

  install -d "${pkgdir}/usr/share/nginx"
  mv "${pkgdir}/etc/nginx/html/" "${pkgdir}/usr/share/nginx"

  install -Dm644 ../logrotate "${pkgdir}/etc/logrotate.d/nginx"
  install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/nginx.service"
  install -Dm644 docs/text/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rmdir "${pkgdir}/run"
}

# vim:set ts=2 sw=2 et:
