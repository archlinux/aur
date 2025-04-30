# Maintainer:  shtrophic <aur at shtrophic dot net>
# Contributor: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgbase=freenginx-libressl
pkgname=($pkgbase $pkgbase-src)

_vfreenginx=1.28.0
_vlibressl=4.1.0
_tests_commit=0a913a10945b

pkgver="${_vfreenginx}_${_vlibressl}"
pkgrel=1
pkgdesc='webserver in an effort to preserve free and open development of nginx (build with OpenBSD libressl)'
arch=(i686 x86_64)
url=https://freenginx.org
license=('BSD-2-Clause AND LicenseRef-LibreSSL')
depends=(geoip libxcrypt pcre2 zlib glibc mailcap)
makedepends=(mercurial)
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
source=("$url/download/freenginx-$_vfreenginx.tar.gz"{,.asc}
	"https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$_vlibressl.tar.gz"{,.asc}
	"hg+https://freenginx.org/hg/nginx-tests#revision=${_tests_commit}"
	"service"
	"logrotate")
sha256sums=('28651bf51ff95de027262d7af23000e5862fb3d1b2252ac83d97ce4c9a4a18a2'
            'SKIP'
            '0f71c16bd34bdaaccdcb96a5d94a4921bfb612ec6e0eba7a80d8854eefd8bb61'
            'SKIP'
            'bb1c79f5c2835d47065474b4b3b5aa1971966bdde5713dc9de5507c53be989e2'
            'adb4a2b5176be3a3bf39666584f7a0a7f10b1b1aca927c189c1910c789d6d13c'
            'b9af19a75bbeb1434bba66dd1a11295057b387a2cbff4ddf46253133909c311e')
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8  # Maxim Dounin <mdounin@mdounin.ru>
	      A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5) # Brent Cook <busterb@gmail.com>

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
	--with-pcre-jit
	--with-stream
	--with-stream_geoip_module
	--with-stream_realip_module
	--with-stream_ssl_module
	--with-stream_ssl_preread_module
	--with-threads
)

_quic_flags=(
	--with-http_v3_module
	#  --with-stream_quic_module
)

prepare() {
	# Backup pristine version of nginx source for -src package
	test -d ${srcdir}/${pkgname}-src && rm -r ${srcdir}/${pkgname}-src
	cp -r ${srcdir}/freenginx-$_vfreenginx ${srcdir}/nginx-src
}

build() {
	export CXXFLAGS="$CXXFLAGS -fPIC"
	export CFLAGS="$CFLAGS -fPIC"
	export LDFLAGS="$LDFLAGS"

	if [[ $CC == "clang" ]]; then
		_cc_opt="-flto $CPPFLAGS $CFLAGS"
		_ld_opt="-flto -fuse-ld=lld $LDFLAGS"
	fi

	cd freenginx-$_vfreenginx
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
		--with-openssl=${srcdir}/libressl-${_vlibressl} \
		--with-cc-opt="${_cc_opt}" \
		--with-ld-opt="${_ld_opt}" \
		${_common_flags[@]} \
		${_quic_flags[@]}

	make
}

check() {
	cd nginx-tests
	TEST_NGINX_BINARY="$srcdir/freenginx-$_vfreenginx/objs/nginx" prove -j $(nproc) .
}

package_freenginx-libressl() {
	provides=(nginx)
	conflicts=(nginx)

	cd freenginx-$_vfreenginx
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
	install -Dm644 "$srcdir"/libressl-${_vlibressl}/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-LIBRESSL

}

package_freenginx-libressl-src() {
	pkgdesc="Source code of freenginx $_vfreenginx, useful for building modules"
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
	install -Dm644 "$srcdir"/libressl-${_vlibressl}/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-LIBRESSL
}
