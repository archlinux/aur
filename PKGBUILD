# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>

_gitname=nginx_tcp_proxy_module

pkgname=nginx-tcp
_pkgname=nginx
pkgver=1.6.2
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, with nginx_tcp_proxy_module.'
arch=('i686' 'x86_64')
url='http://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl')
makedepends=('hardening-wrapper')
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
source=($url/download/nginx-$pkgver.tar.gz
        service
        logrotate)
sha256sums=('b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18'
            '4ecbc33ce4bf2965996f51b0c7edb677904ba5cff9a32e93e1487a428d3a751b'
            '8700222687c1848f7669faaa23708adc92d6634de156b8935b5b9a9b062ce6e9')

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [ -d $_gitname ]; then
        git fetch https://github.com/yaoweibin/$_gitname.git
        msg "The local files are updated."
    else
        git clone --depth=1 https://github.com/yaoweibin/$_gitname.git
    fi
    msg "GIT checkout done or server timeout"

    cd "$srcdir"/$_pkgname-$pkgver
    patch -p1 < "$srcdir"/"$_gitname"/tcp.patch

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
	--add-module="$srcdir"/"$_gitname"
    make
}

package() {
    cd $_pkgname-$pkgver
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
    mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

    install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/nginx
    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/nginx.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rmdir "$pkgdir"/run

    install -d "$pkgdir"/usr/share/man/man8/
    gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz
}

