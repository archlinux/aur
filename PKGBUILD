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
pkgrel=2
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
	"0101-fix-CVE-2026-123007-h2-window-update.patch::https://github.com/nginx/nginx/commit/b89c4100bf6762a45e4a6463eaf4b70368277c94.patch"
	"0102-fix-CVE-2026-123634-resolver-uaf.patch::https://github.com/nginx/nginx/commit/7426c29f140c330dd6c6cdfeb2943be1978c69e0.patch"
	"0103-resolver-report-error-on-cname-restart-failure.patch::https://github.com/nginx/nginx/commit/338f6231e347c17a07c381802b1bc3c20c55b529.patch"
	"0104-fix-CVE-2026-123633-h2-reusable-uaf.patch::https://github.com/nginx/nginx/commit/0c87dd1db413e440a4e3ef7ee8acc518509e8809.patch"
	"0105-mail-set-handlers-on-s-quit.patch::https://github.com/nginx/nginx/commit/9e811a43119ac902f0d0296fb4afb34bb063cf1b.patch"
	"0106-fix-CVE-2026-113425-mail-auth-http-uaf.patch::https://github.com/nginx/nginx/commit/df9d8d940ecb83a50b1e55ccc296d0a29cfe774c.patch"
	"0107-mail-block-client-writes-auth-http.patch::https://github.com/nginx/nginx/commit/e2d23d45fa93ed236a9cdedcb54271e0a064c4f3.patch"
	"0108-mail-block-client-writes-proxy.patch::https://github.com/nginx/nginx/commit/5deda780a9d5d1bcd5c6731d3118fa090ae900cc.patch"
	"0109-mail-block-client-writes-smtp-resolve.patch::https://github.com/nginx/nginx/commit/4c5ace9f1d5419334a2e6772a0885ee7ed3d6e91.patch"
        service
        logrotate
       )
sha256sums=('fea97353ac3619e40aa555219a60b539610ff44a3249b2c33ae2b1b2754b591b'
            '5bb937add49bde2d6fb50bd837e2ce6877561b8a359102992211e41061ee24ee'
            'a786aa4eebdc10005f20ecc9ff4f3664a5bb07ef798faffc1dbee50cf602df65'
            '377c226606b1380eb6b89d50ad56610a79e186128d6790ac1092b32631f8d7e1'
            'e7a65ef9c45b91e0966ed95b41d25396ae50d7c6737748ecbd9e176e79722c36'
            '5fbaf8a0aa0c6234f1562e8aa38d46f7506dabf4feab983646937450c4f24e02'
            '4d3faed4470805f497c89df3a35d944f6a2ce16daa2d89b8b96fa43784b39e7b'
            'ad1e0c5cd0ba81286a99d06a9b90040f745fc8ecaa78fab7b95401027d7adfae'
            '8aea4f10925753499832f7de40ec28ecb262bfafeb4d4ee709a710acbf5099de'
            '71bda533f9cf4aa6c12394b02debc9ec456b7285332b4feac1dd6e1eca2f912a'
            'c066d39d2e945b74756a2422415b086eb26a9ce34788820c86c7e3dc7c6245eb'
            'c9ff256ca07dc041922e24e47adec1996aeb590081dda70208f248a175304e93')

prepare() {
    cd tengine-$_pkgver

    for i in ../*.patch; do
      echo "Applying patch $i..."
      patch -Np1 -i $i
    done
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

