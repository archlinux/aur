# Maintainer: Tom Richards <tom@tomrichards.net>

_nginxver=1.12.1
_passengerver=5.1.6

pkgname=nginx-passenger
pkgver=1.12.1
pkgrel=4
pkgdesc="HTTP Server with Passenger Module"
arch=('x86_64')
url='https://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'geoip' 'curl' 'gd' 'ruby' 'mailcap')
optdepends=('python: Support for python web apps'
            'nodejs: Support for node.js web apps'
            'geoip-database: For country geolocation'
            'geoip-database-extra: For city/ASN geolocation')
makedepends=('apache')
conflicts=('nginx' 'passenger')
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
install="${pkgname}.install"
source=($url/download/nginx-$_nginxver.tar.gz{,.asc}
        https://phusion-passenger.s3.amazonaws.com/releases/passenger-$_passengerver.tar.gz{,.asc}
        service
        logrotate
        packaging.patch)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8'  # Maxim Dounin <mdounin@mdounin.ru>
              'D5F0851426939232F437AB722AC745A50A212A8C'  # Phusion Software Signing <software-signing@phusion.nl>
              '16378A33A6EF16762922526E561F9B9CAC40B2F7') # Phusion Automated Software Signing (Used by automated tools to sign software packages) <auto-software-signing@phusion.nl>
sha256sums=('8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb'
            'SKIP'
            'e897cc5f0ec6446bfdc226404dca4bd29f7418ae92010c389661b9f024a3cf24'
            'SKIP'
            'bc693fe587283edeb0df343e51ca41bada41fe92ef8a1d0f7a8961931d0a72a0'
            'b9af19a75bbeb1434bba66dd1a11295057b387a2cbff4ddf46253133909c311e'
            '2da1ede016ca328f254bfb10e95ff0a5ef2790382a9a87ffde77524956a31749')

_flags=(
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
    --with-http_image_filter_module
    --with-http_mp4_module
    --with-http_random_index_module
    --with-http_realip_module
    --with-http_secure_link_module
    --with-http_slice_module
    --with-http_ssl_module
    --with-http_stub_status_module
    --with-http_sub_module
    --with-http_v2_module
    --with-mail
    --with-mail_ssl_module
    --with-stream
    --with-stream_ssl_module
    --with-threads
)

prepare() {
    cd "$srcdir/passenger-$_passengerver"
    patch -p1 -i "$srcdir"/packaging.patch
}

build() {
    # Passenger
    export EXTRA_CFLAGS=$CFLAGS
    export EXTRA_CXXFLAGS=$CXXFLAGS
    export FS_PREFIX="/usr"
    export FS_SBINDIR="/usr/bin"
    export NATIVE_PACKAGING_METHOD="arch"
    cd "$srcdir/passenger-$_passengerver"
    _nginx_addon_dir=`bin/passenger-config --nginx-addon-dir`
    rake fakeroot

    # Nginx
    cd "$srcdir/nginx-$_nginxver"
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
        ${_flags[@]} \
        --add-module="$_nginx_addon_dir"
    make
}

package() {
    # Nginx
    cd "$srcdir/nginx-${_nginxver}"
    make DESTDIR="$pkgdir" install

    sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

    rm "$pkgdir"/etc/nginx/*.default
    rm "$pkgdir"/etc/nginx/mime.types  # in mailcap

    install -d "$pkgdir"/var/lib/nginx
    install -dm700 "$pkgdir"/var/lib/nginx/proxy

    chmod 750 "$pkgdir"/var/log/nginx
    chown http:log "$pkgdir"/var/log/nginx

    install -d "$pkgdir"/usr/share/nginx
    mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

    install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
    install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    rmdir "$pkgdir"/run

    install -d "$pkgdir"/usr/share/man/man8/
    gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

    for i in ftdetect indent syntax; do
        install -Dm644 contrib/vim/${i}/nginx.vim \
            "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
    done

    # Passenger
    cp -R "${srcdir}/passenger-${_passengerver}"/pkg/fakeroot/usr "${pkgdir}"/
}
