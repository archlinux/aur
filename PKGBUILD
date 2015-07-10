# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-nginx-passenger

_nginxver=1.8.0
_passengerver=5.0.13

pkgname=nginx-passenger
pkgver=1.8.0
pkgrel=7
pkgdesc="HTTP Server with Passenger Module"
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'ruby' 'ruby-rack' 'curl')
optdepends=('python: Support for python web apps' 'nodejs: Support for node.js web apps')
makedepends=('hardening-wrapper' 'apache')
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
source=("http://nginx.org/download/nginx-$_nginxver.tar.gz"
        "https://github.com/phusion/passenger/archive/release-$_passengerver.tar.gz"
        'locations.ini'
        'service'
        'logrotate')
sha256sums=('23cca1239990c818d8f6da118320c4979aadf5386deda691b1b7c2c96b9df3d5'
            '96986b320746f20c08dc9a0b9c61b5ed415e4668eee518052b9815a1e1e338a0'
            '6a99bd6544cadd0563b549a5fb24d0aed98fe51f5dcdaacbfa2f9b8026360d1e'
            '6fe4c5eb7332f5eebdd7e08e46256a3d344bd375e9134be66013fbc52059e1ac'
            '272907d3213d69dac3bd6024d6d150caa23cb67d4f121e4171f34ba5581f9e98')

build() {
    # Setup
    export EXTRA_CFLAGS=$CFLAGS
    export EXTRA_CXXFLAGS=$CXXFLAGS
    cd "$srcdir/passenger-release-$_passengerver"

    # Apache
    /usr/bin/rake apache2

    # Nginx
    _nginx_addon_dir=`bin/passenger-config --nginx-addon-dir`
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
        --with-file-aio \
        --with-http_addition_module \
        --with-http_dav_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_mp4_module \
        --with-http_realip_module \
        --with-http_secure_link_module \
        --with-http_spdy_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_sub_module \
        --with-imap \
        --with-imap_ssl_module \
        --with-ipv6 \
        --with-pcre-jit \
        --add-module="$_nginx_addon_dir"
    make
}

package() {
    # Nginx
    cd "$srcdir/nginx-$_nginxver"
    make DESTDIR="$pkgdir/" install

    install -Dm644 contrib/vim/ftdetect/nginx.vim "$pkgdir"/usr/share/vim/vimfiles/ftdetect/nginx.vim
    install -Dm644 contrib/vim/syntax/nginx.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/nginx.vim
    install -Dm644 contrib/vim/indent/nginx.vim "$pkgdir"/usr/share/vim/vimfiles/indent/nginx.vim

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

    install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/nginx
    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/nginx.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rmdir "$pkgdir"/run

    install -Dm644 man/nginx.8 "$pkgdir"/usr/share/man/man8/nginx.8

    # Passenger
    cd "$srcdir/passenger-release-$_passengerver"

    # apache module
    install -Dm644 buildout/apache2/mod_passenger.so "$pkgdir"/usr/lib/httpd/modules/mod_passenger.so

    # bin
    install -d "$pkgdir"/usr/bin
    cp -R bin/* "$pkgdir"/usr/bin/
    /usr/bin/ruby ./dev/install_scripts_bootstrap_code.rb --ruby /usr/lib/ruby/vendor_ruby "$pkgdir"/usr/bin/passenger*

    # support bin
    install -Dm755 buildout/support-binaries/PassengerAgent "$pkgdir"/usr/lib/passenger/support-binaries/PassengerAgent

    # share
    install -d "$pkgdir"/usr/share/passenger
    cp -R helper-scripts "$pkgdir"/usr/share/passenger/

    # vendored ruby
    install -Dm644 "$srcdir"/locations.ini "$pkgdir"/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini
    cp -R lib/* "$pkgdir"/usr/lib/ruby/vendor_ruby/
    _compat_id=`bin/passenger-config --rubyext-compat-id`
    _native_support_dir=`echo -n $_compat_id | ruby -pe '2.times{ |_| $_.sub!("-", "/") }'`
    install -Dm755 buildout/ruby/"$_compat_id"/passenger_native_support.so "$pkgdir"/usr/lib/"$_native_support_dir"/passenger_native_support.so

    # vendored node
    install -d "$pkgdir"/usr/share/passenger/node
    cp -R node_lib/* "$pkgdir"/usr/share/passenger/node/

    # native support source
    install -d "$pkgdir"/usr/share/passenger/ruby_extension_source
    cp -R ext/ruby/* "$pkgdir"/usr/share/passenger/ruby_extension_source/

    # doc
    install -d "$pkgdir"/usr/share/doc/passenger
    cp -R doc "$pkgdir"/usr/share/doc/passenger/

    # man
    install -Dm644 man/passenger-config.1 "$pkgdir"/usr/share/man/man1/passenger-config.1
    install -Dm644 man/passenger-memory-stats.8 "$pkgdir"/usr/share/man/man8/passenger-memory-stats.8
    install -Dm644 man/passenger-status.8 "$pkgdir"/usr/share/man/man8/passenger-status.8

    # cleanup
    find "$pkgdir" -name "Makefile" -or -name "*.o" -delete
}
