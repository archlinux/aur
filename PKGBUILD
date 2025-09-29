# Maintainer:  shtrophic <aur at shtrophic dot net>
# Contributor: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgbase=freenginx-libressl
pkgname=($pkgbase $pkgbase-src)

epoch=1
pkgver=1.29.2
pkgrel=1
_tests_commit=b090b08f52e4

pkgdesc='webserver in an effort to preserve free and open development of nginx (linked against libressl)'
arch=(i686 x86_64)
url=https://freenginx.org
license=(BSD-2-Clause)
depends=(libressl geoip gd libxcrypt pcre2 zlib glibc libxml2 libxslt mailcap)
makedepends=(perl mercurial)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi perl-cache-memcached
	      perl-cryptx memcached ffmpeg coreutils)
backup=(etc/nginx/fastcgi.conf
	etc/nginx/fastcgi_params
	etc/nginx/koi-win
	etc/nginx/koi-utf
	etc/nginx/nginx.conf
	etc/nginx/scgi_params
	etc/nginx/uwsgi_params
	etc/nginx/win-utf
	etc/logrotate.d/nginx)
install=nginx.install
source=("$url/download/freenginx-$pkgver.tar.gz"{,.asc}
	"hg+https://freenginx.org/hg/nginx-tests#revision=$_tests_commit"
	"service"
	"logrotate")
sha256sums=('b2645b829146bf509937423c993d1596214df46c4afdd146543f379151aaed59'
            'SKIP'
            '2287944e9c1739fac819db5a8e9fb712db464f3c611a43010f48f352e3217c0a'
            'daa4292d37342f3a1c4e82a85d3b83e3b559f11e8cd309788dc8d6e46c0ce247'
            'b9af19a75bbeb1434bba66dd1a11295057b387a2cbff4ddf46253133909c311e')
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8)  # Maxim Dounin <mdounin@mdounin.ru>

_common_flags=(
    --with-compat
    --with-debug
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
    --with-http_perl_module
    --with-http_random_index_module
    --with-http_realip_module
    --with-http_secure_link_module
    --with-http_slice_module
    --with-http_ssl_module
    --with-http_stub_status_module
    --with-http_sub_module
    --with-http_v2_module
    --with-http_v3_module
    --with-http_xslt_module
    --with-mail
    --with-mail_ssl_module
    --with-pcre-jit
    --with-stream
    --with-stream_geoip_module
    --with-stream_realip_module
    --with-stream_ssl_module
    --with-stream_ssl_preread_module
    --with-threads
)

prepare() {
	# Backup pristine version of nginx source for -src package
	test -d $srcdir/$pkgname-src && rm -r $srcdir/$pkgname-src
	cp -r $srcdir/freenginx-$pkgver $srcdir/nginx-src
}

build() {
	cd freenginx-$pkgver
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
		--with-cc-opt="-I/usr/include/libressl" \
		--with-ld-opt="$LDFLAGS -L/usr/lib/libressl -Wl,-rpath=/usr/lib/libressl" \
		${_common_flags[@]}

	make
}

check() {
	cd nginx-tests
	TEST_NGINX_BINARY="$srcdir/freenginx-$pkgver/objs/nginx" prove -j $(nproc) .
}

package_freenginx-libressl() {
	provides=(nginx)
	conflicts=(nginx)

	cd freenginx-$pkgver
	make DESTDIR="$pkgdir" install

	sed -e 's|\<user\s\+\w\+;|user http;|g' \
		-e '44s|html|/usr/share/nginx/html|' \
		-e '54s|html|/usr/share/nginx/html|' \
		-i "$pkgdir"/etc/nginx/nginx.conf

	rm "$pkgdir"/etc/nginx/*.default
	rm "$pkgdir"/etc/nginx/mime.types # in mailcap

	install -d "$pkgdir"/var/lib/nginx
	install -dm700 "$pkgdir"/var/lib/nginx/proxy

	chmod 755 "$pkgdir"/var/log/nginx
	chown root:root "$pkgdir"/var/log/nginx

	install -d "$pkgdir"/usr/share/nginx
	mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

	install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
	install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	rmdir "$pkgdir"/run

	install -d "$pkgdir"/usr/share/man/man8/
	gzip -9c man/nginx.8 >"$pkgdir"/usr/share/man/man8/nginx.8.gz

	for i in ftdetect indent syntax; do
		install -Dm644 contrib/vim/${i}/nginx.vim \
			"${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
	done
}

package_freenginx-libressl-src() {
	pkgdesc="Source code of freenginx $pkgver, useful for building modules"
	arch=(any)
	provides=(nginx-src)
	conflicts=(nginx-src)
	depends=(sh bash perl)
	backup=()

	install -d "$pkgdir/usr/src"
	test -d "$pkgdir/usr/src/nginx" && rm -r "$pkgdir/usr/src/nginx"
	cp -r ${srcdir}/nginx-src "$pkgdir/usr/src/nginx"
	cd nginx-src
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s /usr/share/licenses/$provides/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
