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

_tcp_module_gitname=nginx_tcp_proxy_module
pkgname=tengine-extra
pkgver=3.2.0.rc5
_pkgver=3.2.0-rc5
pkgrel=1
pkgdesc='A web server based on Nginx and has many advanced features, originated by Taobao. Some extra modules enabled.'
arch=('x86_64')
url='http://tengine.taobao.org'
license=('BSD-2-Clause')
depends=(
  'gd'
  'geoip'
  'glibc'
  'gperftools'
  'libmaxminddb'
  'libxcrypt'
  'libxml2'
  'libxslt'
  'luajit'
  'lua-resty-core=1:0.1.32R1'
  'mailcap'
  'openssl'
  'pcre2'
  'perl'
  'zlib'
  'zstd>=1.4.0'
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
  cargo
  clang
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
conflicts=('tengine')
provides=('nginx' 'tengine')
_acme_ver=0.4.1
_brotli_ver=1.0.0rc
_zstd_ver=0.1.1
_geoip2_ver=3.4
_fancyidx_ver=0.6.0
_jdomain_ver=1.5.2
_tongsuo_ver=8.5.0-pre2
_more_headers_ver=0.39
source=(tengine-$pkgver.tar.gz::https://github.com/alibaba/tengine/archive/$_pkgver.tar.gz
        service
        logrotate
        acme-v${_acme_ver}.tar.gz::https://github.com/nginx/nginx-acme/releases/download/v${_acme_ver}/nginx-acme-${_acme_ver}.tar.gz
        brotli-v${_brotli_ver}.tar.gz::https://github.com/google/ngx_brotli/archive/refs/tags/v${_brotli_ver}.tar.gz
        zstd-v${_zstd_ver}.tar.gz::https://github.com/tokers/zstd-nginx-module/archive/refs/tags/${_zstd_ver}.tar.gz
        geoip2-v${_geoip2_ver}.tar.gz::https://github.com/leev/ngx_http_geoip2_module/archive/refs/tags/${_geoip2_ver}.tar.gz
        fancyindex-v${_fancyidx_ver}.tar.xz::https://github.com/aperezdc/ngx-fancyindex/releases/download/v${_fancyidx_ver}/ngx-fancyindex-${_fancyidx_ver}.tar.xz
        jdomain-v${_jdomain_ver}.tar.gz::https://github.com/nicholaschiasson/ngx_upstream_jdomain/archive/refs/tags/${_jdomain_ver}.tar.gz
        tongsuo-v${_tongsuo_ver}.tar.gz::https://github.com/Tongsuo-Project/Tongsuo/archive/refs/tags/${_tongsuo_ver}.tar.gz
        more-headers-v${_more_headers_ver}.tar.gz::https://github.com/openresty/headers-more-nginx-module/archive/refs/tags/v${_more_headers_ver}.tar.gz
        )
sha256sums=('fea97353ac3619e40aa555219a60b539610ff44a3249b2c33ae2b1b2754b591b'
            'c066d39d2e945b74756a2422415b086eb26a9ce34788820c86c7e3dc7c6245eb'
            'c9ff256ca07dc041922e24e47adec1996aeb590081dda70208f248a175304e93'
            'b4f99f971bd0bebc89b2037f3afeaa3281004fe434de558df87d69cab2be1f22'
            'c85cdcfd76703c95aa4204ee4c2e619aa5b075cac18f428202f65552104add3b'
            '707d534f8ca4263ff043066db15eac284632aea875f9fe98c96cea9529e15f41'
            'ad72fc23348d715a330994984531fab9b3606e160483236737f9a4a6957d9452'
            '2846819d4f80df7c753530b2ea93484d41326f5dc5162dc453b92579203c0c32'
            '7829440cc448edaa47b4fefb88fe35cad93b02ba5fe850c69a0421ccaa6190aa'
            'b29fa0dd494f4d79a73a6a3402a545050d7701565914ed4f04ae9a359283ec22'
            'dde68d3fa2a9fc7f52e436d2edc53c6d703dcd911283965d889102d3a877c778')

prepare() {
    cd tengine-$_pkgver

    #for i in ../*.patch; do
    #  echo "Applying patch $i..."
    #  patch -Np1 -i $i
    #done
}

build() {
    cd tengine-$_pkgver

    export LUAJIT_LIB=/usr/lib
    export LUAJIT_INC=/usr/include/luajit-2.1
    ./configure \
        --prefix=/etc/tengine \
        --conf-path=/etc/tengine/tengine.conf \
        --sbin-path=/usr/bin/tengine \
        --pid-path=/run/tengine.pid \
        --lock-path=/run/lock/tengine.lock \
        --user=http \
        --group=http \
        --build="ArchLinux" \
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
        --with-openssl=../Tongsuo-${_tongsuo_ver} \
        --with-openssl-opt="enable-ntls" \
        --with-google_perftools_module \
        --with-http_addition_module \
        --with-http_auth_request_module \
        --with-http_dav_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_geoip_module=dynamic \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_lua_module \
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
        --with-threads \
        --add-module=./modules/ngx_http_proxy_connect_module \
        --add-module=./modules/ngx_http_upstream_dynamic_module \
        --add-module=./modules/ngx_http_upstream_session_sticky_module \
        --add-module=./modules/ngx_http_upstream_vnswrr_module \
        --add-module=./modules/ngx_multi_upstream_module \
        --add-module=./modules/ngx_tongsuo_ntls \
        --add-module=$srcdir/ngx_upstream_jdomain-${_jdomain_ver} \
        --add-dynamic-module=$srcdir/nginx-acme-${_acme_ver} \
        --add-dynamic-module=$srcdir/ngx_brotli-${_brotli_ver} \
        --add-dynamic-module=$srcdir/zstd-nginx-module-${_zstd_ver} \
        --add-dynamic-module=$srcdir/ngx_http_geoip2_module-${_geoip2_ver} \
        --add-dynamic-module=$srcdir/ngx-fancyindex-${_fancyidx_ver} \
        --add-dynamic-module=$srcdir/headers-more-nginx-module-${_more_headers_ver}

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

