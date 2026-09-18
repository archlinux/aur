# $Id$
# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=tengine
pkgver=3.2.0.rc5
_pkgver=3.2.0-rc5
pkgrel=1
pkgdesc='A web server based on Nginx and has many advanced features, originated by Taobao.'
arch=('x86_64')
url='http://tengine.taobao.org'
license=('BSD-2-Clause')
depends=(
  gd
  geoip
  glibc
  libxcrypt
  libxml2
  libxslt
  mailcap
  openssl
  pcre2
  perl
  zlib
)
makedepends=(
  findutils
  gd
  geoip
  git
  glibc
  libxcrypt
  libxml2
  libxslt
  mailcap
  openssl
  pcre2
  rsync
  zlib
)
backup=(etc/tengine/fastcgi.conf
        etc/tengine/fastcgi_params
        etc/tengine/koi-win
        etc/tengine/koi-utf
        etc/tengine/tengine.conf
        etc/tengine/scgi_params
        etc/tengine/uwsgi_params
        etc/tengine/win-utf
        etc/logrotate.d/tengine)
install=tengine.install
provides=('nginx')
source=(tengine-$pkgver.tar.gz::https://github.com/alibaba/tengine/archive/$_pkgver.tar.gz
        service
        logrotate
       )
sha256sums=('fea97353ac3619e40aa555219a60b539610ff44a3249b2c33ae2b1b2754b591b'
            'c066d39d2e945b74756a2422415b086eb26a9ce34788820c86c7e3dc7c6245eb'
            'c9ff256ca07dc041922e24e47adec1996aeb590081dda70208f248a175304e93')

prepare() {
    cd tengine-$_pkgver

    #for i in ../*.patch; do
    #  echo "Applying patch $i..."
    #  patch -Np1 -i $i
    #done
}

build() {
    cd tengine-$_pkgver

    ./configure \
        --prefix=/etc/tengine \
        --conf-path=/etc/tengine/tengine.conf \
        --sbin-path=/usr/bin/tengine \
        --pid-path=/run/tengine.pid \
        --lock-path=/run/lock/tengine.lock \
        --user=http \
        --group=http \
        --http-log-path=/var/log/tengine/access.log \
        --error-log-path=stderr \
        --http-client-body-temp-path=/var/lib/tengine/client-body \
        --http-proxy-temp-path=/var/lib/tengine/proxy \
        --http-fastcgi-temp-path=/var/lib/tengine/fastcgi \
        --http-scgi-temp-path=/var/lib/tengine/scgi \
        --http-uwsgi-temp-path=/var/lib/tengine/uwsgi \
        --with-cc-opt="$CFLAGS $CPPFLAGS" \
        --with-ld-opt="$LDFLAGS" \
        --with-compat \
        --with-file-aio \
        --with-http_addition_module \
        --with-http_auth_request_module \
        --with-http_dav_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_geoip_module=dynamic \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_image_filter_module=dynamic \
        --with-http_mp4_module \
        --with-http_perl_module=dynamic \
        --with-http_random_index_module \
        --with-http_realip_module \
        --with-http_secure_link_module \
        --with-http_slice_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_sub_module \
        --with-http_v2_module \
        --with-http_xslt_module=dynamic \
        --with-mail=dynamic \
        --with-mail_ssl_module \
        --with-pcre-jit \
        --with-stream=dynamic \
        --with-stream_geoip_module=dynamic \
        --with-stream_realip_module \
	--with-stream_sni \
        --with-stream_ssl_module \
        --with-stream_ssl_preread_module \
        --with-threads

    make
}

package() {
    cd tengine-$_pkgver
    make DESTDIR="$pkgdir" install

    sed -e 's|\<user\s\+\w\+;|user http;|g' \
	-e '/^\s\+root/s|html|/usr/share/tengine/html|' \
	-e '/^events {/ i # Load all installed modules\ninclude modules.d/*.conf;\n' \
        -i "$pkgdir"/etc/tengine/tengine.conf

    rm "$pkgdir"/etc/tengine/*.default
    rm "$pkgdir"/etc/tengine/mime.types # in mailcap
    ln -s /etc/nginx/mime.types "$pkgdir"/etc/tengine/mime.types # from mailcap

    install -d "$pkgdir"/var/lib/tengine
    install -dm700 "$pkgdir"/var/lib/tengine/proxy

    chmod 755 "$pkgdir"/var/log/tengine
    chown root:root "$pkgdir"/var/log/tengine

    install -d "$pkgdir"/usr/share/tengine
    mv "$pkgdir"/etc/tengine/html/ "$pkgdir"/usr/share/tengine

    install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/tengine
    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/tengine.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/tengine/LICENSE

    rmdir "$pkgdir"/run

    install -d "$pkgdir"/usr/share/man/man8/
    gzip -9c man/tengine.8 > "$pkgdir"/usr/share/man/man8/tengine.8.gz

    for i in ftdetect indent syntax; do
      install -Dm644 contrib/vim/$i/nginx.vim \
        "$pkgdir/usr/share/vim/vimfiles/$i/tengine.vim"
    done
}

