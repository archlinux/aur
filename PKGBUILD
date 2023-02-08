# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>

_tcp_module_gitname=nginx_tcp_proxy_module
pkgname=tengine-extra
pkgver=2.4.0
pkgrel=2
pkgdesc='A web server based on Nginx and has many advanced features, originated by Taobao. Some extra modules enabled.'
arch=('x86_64')
url='http://tengine.taobao.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'gperftools' 'geoip' 'mailcap' 'libxcrypt' 'luajit' 'libmaxminddb')
backup=('etc/tengine/fastcgi.conf'
        'etc/tengine/fastcgi_params'
        'etc/tengine/koi-win'
        'etc/tengine/koi-utf'
        'etc/tengine/tengine.conf'
        'etc/tengine/scgi_params'
        'etc/tengine/uwsgi_params'
        'etc/tengine/win-utf'
        'etc/logrotate.d/tengine')
install=tengine.install
conflicts=('tengine')
provides=('nginx' 'tengine')
_brotli_ver=1.0.0rc
_geoip2_ver=3.4
_fancyidx_ver=0.5.2
_jdomain_ver=1.4.0
source=(tengine-$pkgver.tar.gz::https://github.com/alibaba/tengine/archive/$pkgver.tar.gz
        service
        logrotate
        brotli-v${_brotli_ver}.tar.gz::https://github.com/google/ngx_brotli/archive/refs/tags/v${_brotli_ver}.tar.gz
        geoip2-v${_geoip2_ver}.tar.gz::https://github.com/leev/ngx_http_geoip2_module/archive/refs/tags/${_geoip2_ver}.tar.gz
        fancyindex-v${_fancyidx_ver}.tar.xz::https://github.com/aperezdc/ngx-fancyindex/releases/download/v${_fancyidx_ver}/ngx-fancyindex-${_fancyidx_ver}.tar.xz
        jdomain-v${_jdomain_ver}.tar.gz::https://github.com/nicholaschiasson/ngx_upstream_jdomain/archive/refs/tags/${_jdomain_ver}.tar.gz
        )
sha256sums=('53ab713136e33e595fa1cb1358f56c2226255a12c7eebb6126d05ea16a3946f9'
            'c066d39d2e945b74756a2422415b086eb26a9ce34788820c86c7e3dc7c6245eb'
            '7d4bd60b9210e1dfb46bc52c344b069d5639e1ba08cd9951c0563360af238f97'
            'c85cdcfd76703c95aa4204ee4c2e619aa5b075cac18f428202f65552104add3b'
            'ad72fc23348d715a330994984531fab9b3606e160483236737f9a4a6957d9452'
            '04c3d098ed5d8d6016d92a784c7f7692dd8cd65603a7e7d59dd3d4bbdc374656'
            '3e8021433b1444b3caa1674fe344dc0ed58b8d8275f227c63950f6a156c31883')

build() {
    cd tengine-$pkgver

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
        --with-google_perftools_module \
        --with-http_addition_module \
        --with-http_auth_request_module \
        --with-http_dav_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_geoip_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_lua_module \
        --with-http_mp4_module \
        --with-http_realip_module \
        --with-http_secure_link_module \
        --with-http_slice_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_sub_module \
        --with-http_v2_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-pcre-jit \
        --with-stream \
        --with-stream_geoip_module \
        --with-stream_realip_module \
        --with-stream_sni \
        --with-stream_ssl_module \
        --with-stream_ssl_preread_module \
        --with-threads \
        --add-module=$srcdir/ngx_upstream_jdomain-${_jdomain_ver} \
        --add-dynamic-module=$srcdir/ngx_brotli-${_brotli_ver} \
        --add-dynamic-module=$srcdir/ngx_http_geoip2_module-${_geoip2_ver} \
        --add-dynamic-module=$srcdir/ngx-fancyindex-${_fancyidx_ver}

    make
}

package() {
    cd tengine-$pkgver
    make DESTDIR="$pkgdir" install

    sed -e 's|\<user\s\+\w\+;|user html;|g' \
        -e '44s|html|/usr/share/tengine/html|' \
        -e '54s|html|/usr/share/tengine/html|' \
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
    gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/tengine.8.gz

    for i in ftdetect indent syntax; do
      install -Dm644 contrib/vim/$i/nginx.vim \
        "$pkgdir/usr/share/vim/vimfiles/$i/tengine.vim"
    done
}

