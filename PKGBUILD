# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgbase="nginx-zest-git"
pkgname=(
	"nginx-zest-git"
	"nginx-zest-src-git"
)
pkgver=1.17.10
pkgrel=5
epoch=3
arch=(
	"x86_64"
)
url="https://github.com/ZestProjects/nginx"
license=(
	"custom"
)
makedepends=(
	"cmake"
	"git"
	"go"
	"mercurial"
	"perl"

	#* Speed up decompression by using pigz instead of gzip
	"pigz"

	#* Rust version 1.39 or greater is needed for quiche
	"rust>=1.39"
)
source=(
	"git+$url.git"
	"git+https://github.com/AirisX/nginx_cookie_flag_module.git"
	"git+https://github.com/cloudflare/quiche.git"
	"git+https://github.com/cloudflare/zlib.git"
	"git+https://github.com/google/ngx_brotli.git"
	"git+https://github.com/masonicboom/ipscrub.git"
	"git+https://github.com/openresty/echo-nginx-module.git"
	"git+https://github.com/openresty/redis2-nginx-module.git"
	"git+https://github.com/openresty/set-misc-nginx-module.git"
	"git+https://github.com/openresty/srcache-nginx-module.git"
	"git+https://github.com/tokers/zstd-nginx-module.git"
	"git+https://github.com/vision5/ngx_devel_kit.git"
	"git+https://github.com/vision5/ngx_http_set_hash.git"
	"hg+http://hg.nginx.org/nginx-tests"
	"hg+http://hg.nginx.org/njs"
	"https://nginx.org/LICENSE"
	"https://people.freebsd.org/~osa/ngx_http_redis-0.3.9.tar.gz"
	"logrotate"
	"service"
)
b2sums=(
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"fbd993990b43a4476d0963287bdc5f55f73fa5ce828f11977cf1abeedd478729a95861d930e27c6a1b0e78b16397164395afc4473fd34e050cadd32b94336beb"
	"ea3b5668b18b83df37bd954bd7cfd61fcb91e7b40bc2ef79f7c2117252307bbd716925669e15331a813eadb07819e5a3a7410eab52e8f918a167fe69ead2b375"
	"fe32fb75a7677abca86c4bc3f4ca9bfeccb3cd7afb4dd3c4ec21ab8b53cc0d72ba5330a1131498b5df222c2e517bd01e2df9f67256011ff15241b777a85be6b3"
	"b6414f9917fe62cc57556a2927fb404cc839398dac64a0d60c1d45af11a4e6be71bbee5f9bae17ce3604c31ab9247e8c6aec759f86890b54f86267db1fe7c08a"
)

_common_flags=(
	--with-compat
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

_zest_flags=(
	#* The NDK module must be first as other modules require it as a dependancy
	--add-module="../ngx_devel_kit"

	--add-module="../echo-nginx-module"
	--add-module="../ipscrub/ipscrub"
	--add-module="../nginx_cookie_flag_module"
	--add-module="../ngx_brotli"
	--add-module="../ngx_http_redis-0.3.9"
	--add-module="../njs/nginx"
	--add-module="../redis2-nginx-module"
	--add-module="../set-misc-nginx-module"
	--add-module="../srcache-nginx-module"
	--add-module="../zstd-nginx-module"
	--build="zest"
	--with-http_v2_hpack_enc
	--with-http_v3_module
	--with-libatomic
	--with-openssl="../quiche/deps/boringssl"
	--with-quiche="../quiche"
	--with-zlib="../zlib"
)

prepare()
{
	cp -r "nginx"{,"-src"}

	cd "quiche" || exit
	git checkout boringssl_next
	git submodule update --init

	cd "deps/boringssl" || exit

	cd "../../../zlib" || exit
	[ -f Makefile ] && make clean
	make -f Makefile.in distclean
}

build()
{
	#* Manually state the compiler flags
	export CFLAGS="-march=x86-64 -mtune=generic -O3 -pipe -fno-plt -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free"
	export CXXFLAGS="-march=x86-64 -mtune=generic -O3 -pipe -fno-plt -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free"
	export LDFLAGS="$LDFLAGS -ltcmalloc"

	cd "nginx" || exit
	./auto/configure \
		--prefix="/etc/nginx" \
		--conf-path="/etc/nginx/nginx.conf" \
		--sbin-path="/usr/bin/nginx" \
		--pid-path="/run/nginx.pid" \
		--lock-path="/run/lock/nginx.lock" \
		--user="http" \
		--group="http" \
		--http-log-path="/var/log/nginx/access.log" \
		--error-log-path="stderr" \
		--http-client-body-temp-path="/var/lib/nginx/client-body" \
		--http-proxy-temp-path="/var/lib/nginx/proxy" \
		--http-fastcgi-temp-path="/var/lib/nginx/fastcgi" \
		--http-scgi-temp-path="/var/lib/nginx/scgi" \
		--http-uwsgi-temp-path="/var/lib/nginx/uwsgi" \
		--with-cc-opt="$CFLAGS $CPPFLAGS" \
		--with-ld-opt="$LDFLAGS" \
		"${_common_flags[@]}" \
		"${_zest_flags[@]}"
	make
}

check()
{
	cd "nginx-tests" || exit

	#* We skip this test as HTTP/2 HPACK causes this test to fail
	rm -rf "h2_server_push.t"

	TEST_NGINX_BINARY="../nginx/objs/nginx" prove .
}

package_nginx-zest-git()
{
	pkgdesc="NGINX with beefed up security and performance"
	depends=(
		"brotli"
		"geoip"
		"gperftools"
		"gzip"
		"libatomic_ops"
		"libbsd"
		"liburing"
		"mailcap"
		"pcre"
		"zstd"
	)
	optdepends=(
		"nginx-zest-src-git: dynamic module support"
	)
	provides=(
		"nginx=1.17.10"
		"nginx-mod-brotli"
		"nginx-mod-ndk"
		"nginx-mod-ipscrub"
		"nginx-mod-ndk"
		"nginx-mod-njs"
		"nginx-mod-redis=0.3.9"
		"nginx-mod-redis2"
		"nginx-mod-set-misc"
		"nginx-mod-srcache"
		"nginx-zest=1.17.10"
	)
	conflicts=(
		"nginx"
		"nginx-mod-brotli"
		"nginx-mod-ndk"
		"nginx-mod-ipscrub"
		"nginx-mod-ndk"
		"nginx-mod-njs"
		"nginx-mod-redis"
		"nginx-mod-redis2"
		"nginx-mod-set-misc"
		"nginx-mod-srcache"
		"nginx-zest"
	)
	backup=(
		"etc/logrotate.d/nginx"
		"etc/nginx/fastcgi.conf"
		"etc/nginx/fastcgi_params"
		"etc/nginx/koi-win"
		"etc/nginx/koi-utf"
		"etc/nginx/nginx.conf"
		"etc/nginx/scgi_params"
		"etc/nginx/uwsgi_params"
		"etc/nginx/win-utf"
	)

	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "nginx" || exit

	make install DESTDIR="$pkgdir"

	sed -e "s|\<user\s\+\w\+;|user html;|g" \
		-e "44s|html|/usr/share/nginx/html|" \
		-e "54s|html|/usr/share/nginx/html|" \
		-i "$pkgdir/etc/nginx/nginx.conf"

	for i in "$pkgdir/etc/nginx/"*".default"; do
		rm "$i"
	done

	if [ -f "$pkgdir/etc/nginx/mime.types" ]; then
		rm "$pkgdir/etc/nginx/mime.types"
	fi

	install -d -g0 -m755 -o0 "$pkgdir/var/lib/nginx"
	install -d -m700 "$pkgdir/var/lib/nginx/proxy"

	install -d "$pkgdir/usr/share/nginx"
	mv "$pkgdir/etc/nginx/html" "$pkgdir/usr/share/nginx"

	install -D -m644 "../logrotate" "$pkgdir/etc/logrotate.d/nginx"
	install -D -m644 "../service" "$pkgdir/usr/lib/systemd/system/nginx.service"

	rmdir "$pkgdir/run"

	install -d "$pkgdir/usr/share/man/man8"
	pigz -9c "docs/man/nginx.8" > "$pkgdir/usr/share/man/man8/nginx.8.gz"

	for j in ftdetect indent syntax; do
		install -D -m644 "contrib/vim/$j/nginx.vim" \
			"$pkgdir/usr/share/vim/vimfiles/$j/nginx.vim"
	done
}

package_nginx-zest-src-git()
{
	pkgdesc="Source code of the Zest Project's NGINX fork, useful for building modules"
	provides=(
		"nginx-src=1.17.10"
		"nginx-zest-src=1.17.10"
	)
	conflicts=(
		"nginx-src"
		"nginx-zest-src"
	)

	install -d "$pkgdir/usr/src"
	cp -r "nginx-src" "$pkgdir/usr/src/nginx"

	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
