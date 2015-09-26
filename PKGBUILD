# Maintainer: illuser <lykouleon dot eve at gmail dot com>
_nginxver=1.8.0

pkgname=nginx-passenger-git
pkgver=5.0.20.r1.g696779e
pkgrel=2
pkgdesc='A fast and robust web server and application server for Ruby, Python, and Node.js'
arch=('i686' 'x86_64')
url='https://www.phusionpassenger.com'
license=('custom')
depends=('openssl' 'pcre' 'zlib' 'geoip' 'ruby')
makedepends=('hardening-wrapper' 'git')
optdepends=('nodejs: Support for nodejs web apps'
            'iojs: Support for nodejs web apps'
            'python: Support for python web apps'
            'meteorjs: Support for meteorjs apps'
            'clang: Faster compiling'
            'ccache: Faster recompiling')
provides=('nginx' 'passenger')
confilicts=('nginx' 'passenger' 'nginx-devel' 'nginx-full' 'nginx-mainline' 'nginx-accesskey'
  'nginx-custom' 'nginx-custom-dev' 'nginx-hg' 'nginx-libressl' 'nginx-mainline-waf'
  'nginx-openrc' 'nginx-pam' 'nginx-passenger' 'nginx-passenger-mod-auth-kerb-git' 'nginx-tcp')
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
install="$pkgname".install
source=("http://nginx.org/download/nginx-$_nginxver.tar.gz"
        'passenger::git+https://github.com/phusion/passenger#branch=stable-5.0'
        service
        logrotate
        locations.ini)
sha256sums=('23cca1239990c818d8f6da118320c4979aadf5386deda691b1b7c2c96b9df3d5'
            'SKIP'
            '0a8359248a1dd1e98a96b036a636095af0c2fe770d661ab7dd988b3999d08b9f'
            'd85edb44894468d2e471d38176b6827635fb0c1251ce55765f4aa59c1bcb1791'
            '10ba5a23200b73c9c80d7617c857f98667ddbb3f7bf195dc7d0830689f509454')

pkgver() {
  cd "$srcdir/passenger"
  git describe --long | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  cd "nginx-$_nginxver"

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
    --with-http_sub_module \
    --with-http_geoip_module \
    --add-module="$srcdir/passenger/src/nginx_module"

  make
}

package() {  
  cd "nginx-$_nginxver"
  make DESTDIR="$pkgdir" install

  install -Dm644 contrib/vim/ftdetect/nginx.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/nginx.vim
  install -Dm644 contrib/vim/syntax/nginx.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/nginx.vim
  install -Dm644 contrib/vim/indent/nginx.vim \
    "$pkgdir"/usr/share/vim/vimfiles/indent/nginx.vim

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
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx/

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/NGINX.LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  sed -e '/http\s{/a \    passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;' \
   -i "$pkgdir"/etc/nginx/nginx.conf

  cd "$srcdir"/passenger/
  mv bin/* "$pkgdir"/usr/bin

  /usr/bin/ruby dev/install_scripts_bootstrap_code.rb --ruby \
    /usr/lib/ruby/vendor_ruby "$pkgdir"/usr/bin/passenger*

  install -Dm755 buildout/support-binaries/PassengerAgent \
    "$pkgdir"/usr/lib/passenger/support-binaries/PassengerAgent

  install -d "$pkgdir"/usr/share/passenger/
  mv src/helper-scripts/ "$pkgdir"/usr/share/passenger/

  install -d "$pkgdir"/usr/lib/ruby/vendor_ruby
  mv src/ruby_supportlib/* "$pkgdir"/usr/lib/ruby/vendor_ruby/

  install -Dm644 "$srcdir"/locations.ini "$pkgdir"/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini

  install -d "$pkgdir"/usr/share/phusion-passenger/ngx_http_passenger_module
  mv src/nginx_module/* "$pkgdir"/usr/share/phusion/ngx_http_passenger_module/

  install -d "$pkgdir"/usr/share/passenger/ruby_extension_source
  mv src/ruby_native_extension/* "$pkgdir"/usr/share/passenger/ruby_extension_source/

  install -d "$pkgdir"/usr/share/passenger/node
  mv src/nodejs_supportlib/phusion_passenger/* "$pkgdir"/usr/share/passenger/node/

  install -d "$pkgdir"/usr/share/doc/passenger
  mv doc/* "$pkgdir"/usr/share/doc/passenger/

  mv resources/templates/ "$pkgdir"/usr/share/passenger/

  install -d "$pkgdir"/usr/share/man/man1/
  gzip -9c "$srcdir"/passenger/man/passenger-config.1 > "$pkgdir"/usr/share/man/man1/passenger-config.1.gz
  gzip -9c "$srcdir"/passenger/man/passenger-memory-stats.8 > "$pkgdir"/usr/share/man/man8/passenger-memory-stats.8.gz
  gzip -9c "$srcdir"/passenger/man/passenger-status.8 > "$pkgdir"/usr/share/man/man8/passenger-status.8.gz

  install -Dm664 "$srcdir"/passenger/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/PASSENGER.LICENSE

  find "$pkgdir" -name "Makefile" -or -name "*.o" -delete
}
