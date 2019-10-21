pkgname=nginx-http3
_rel=1
_maj=16
_min=1
pkgver=$_rel.$_maj.$_min
pkgrel=1
provides=('nginx')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full' 'nginx-libressl') 
pkgdesc="Nginx with Cloudflare's http3 path on the top of quiche"
arch=('any')
makedepends=('git' 'cmake' 'make' 'gcc' 'go' 'perl' 'ninja' 'rust')
depends=()
url="https://github.com/cloudflare/quiche/tree/master/extras/nginx"
license=('GPL3')
source=(
    "https://nginx.org/download/nginx-$pkgver.tar.gz"
    'git+https://github.com/cloudflare/quiche.git'
    'service'
    'logrotate'
)
sha256sums=(
    'f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b'
    'SKIP'
    '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
    'b9af19a75bbeb1434bba66dd1a11295057b387a2cbff4ddf46253133909c311e'
)

_common_flags=(
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

_mainline_flags=(
    --with-stream_ssl_preread_module
    --with-stream_geoip_module
    --with-stream_realip_module
)

_http3_flags=(
    --with-openssl=../quiche/deps/boringssl
    --with-quiche=../quiche
    --with-http_v3_module
)

_nginx_paths=(
    --prefix=/etc/nginx
    --conf-path=/etc/nginx/nginx.conf
    --sbin-path=/usr/bin/nginx
    --pid-path=/run/nginx.pid
    --lock-path=/run/lock/nginx.lock
    --http-log-path=stdout
    --error-log-path=stderr
    --http-client-body-temp-path=/var/lib/nginx/client-body
    --http-proxy-temp-path=/var/lib/nginx/proxy
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi
    --http-scgi-temp-path=/var/lib/nginx/scgi
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi
)

package() {
    tar xzvf nginx-$pkgver.tar.gz
    cd quiche
    git submodule update --init --recursive
    cd ../nginx-$pkgver
    patch -p01 < ../quiche/extras/nginx/nginx-$_rel.$_maj.patch
    if [ $(uname -m) = 'aarch64' ]; then
        sed -i 's/alignas(64)/alignas(16)/g' ../quiche/deps/boringssl/crypto/cipher_extra/aead_test.cc
    fi
    ./configure \
        ${_nginx_paths[@]} \
        ${_common_flags[@]} \
        ${_mainline_flags[@]} \
        ${_http3_flags[@]}

    make
    make DESTDIR="$pkgdir/" install
    cd "$pkgdir/"
    mkdir usr
    mv etc/nginx/sbin usr/bin
    install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
    install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
    install -d "$pkgdir"/var/lib/nginx
    install -dm700 "$pkgdir"/var/lib/nginx/proxy
    chmod 755 "$pkgdir"/var/log/nginx
    chown root:root "$pkgdir"/var/log/nginx
    install -d "$pkgdir"/usr/share/nginx
    mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx
    rmdir "$pkgdir"/run
    install -d "$pkgdir"/usr/share/man/man8/
    gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz
}
