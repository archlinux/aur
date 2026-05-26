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
pkgver=3.1.0
pkgrel=4
pkgdesc='A web server based on Nginx and has many advanced features, originated by Taobao.'
arch=('x86_64')
url='http://tengine.taobao.org'
license=('BSD-2-Clause')
depends=(
  glibc
  pcre2
  zlib
  openssl
  geoip
  mailcap
  libxcrypt
)
makedepends=(
  findutils
  gd
  git
  libxml2
  libxslt
  rsync
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
source=(tengine-$pkgver.tar.gz::https://github.com/alibaba/tengine/archive/$pkgver.tar.gz
	"0001-pr-1887.patch::https://patch-diff.githubusercontent.com/raw/alibaba/tengine/pull/1887.patch"
	"0001-pr-2001.patch::https://patch-diff.githubusercontent.com/raw/alibaba/tengine/pull/2001.patch"
	"0101-fix-CVE-2026-1642.patch::https://github.com/alibaba/tengine/commit/51e05b88fd2b2c656d087601bdd3186a90334201.patch"
	"0102-fix-CVE-2026-42945-and-more.patch::https://github.com/alibaba/tengine/commit/70e6ba5f3a021d9cc54c0299fd29c9ef3400adf6.patch"
	"0103-fix-buffer-overflow-with-overlapping-captures.patch::https://github.com/nginx/nginx/commit/3f135ae2eb60ce376196c898a6c7cb4d774f7068.patch"
        service
        logrotate
       )
sha256sums=('64ed7155c0c904ce0fe7199c21b8eb6c2abfc267278fa8af832c0cb781e864dc'
            'dc8cba315b440b407548a10077b8bfca84bcbfe647cd215b5b3c73cd59db8f50'
            '18b5f2a1bdd0b03895f079a5dbaa11e1ee155ce79306a458c1ba68813baf1e50'
            '28caad27790100a06d7639e4d2b53e60a24974865607af93899f9a056a16ac48'
            '8ad68aafd671db485cf073c4ec0daf5aebae94b7403b917dc0358c5e180c7856'
            'af8f92c4883506d92f844805a3e870e9a6c5d6bc256a10a6258e17cccb4db95a'
            'c066d39d2e945b74756a2422415b086eb26a9ce34788820c86c7e3dc7c6245eb'
            '7d4bd60b9210e1dfb46bc52c344b069d5639e1ba08cd9951c0563360af238f97')

prepare() {
    cd tengine-$pkgver

    for i in ../*.patch; do
      echo "Applying patch $i..."
      patch -Np1 -i $i
    done
}

build() {
    cd tengine-$pkgver

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
        --with-http_geoip_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
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
        --with-threads

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

