# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgbase="nginx-lazerl0rd-git"
pkgname=("nginx-lazerl0rd-git" "nginx-lazerl0rd-src-git")
pkgver=1.17.9
pkgrel=5
arch=("i686" "x86_64")
url="https://github.com/lazerl0rd/nginx"
license=("custom")
depends=("geoip" "gzip" "libatomic_ops" "liburing" "mailcap" "pcre")
makedepends=("cmake" "git" "go" "perl" "rust>=1.39.0")
provides=("nginx=1.17.9" "nginx-mod-brotli" "nginx-mod-cookie_flag_module" "nginx-src=1.17.9")
conflicts=("nginx" "nginx-src")
backup=("etc/nginx/fastcgi.conf"
		"etc/nginx/fastcgi_params"
		"etc/nginx/koi-win"
		"etc/nginx/koi-utf"
		"etc/nginx/nginx.conf"
		"etc/nginx/scgi_params"
		"etc/nginx/uwsgi_params"
		"etc/nginx/win-utf"
		"etc/logrotate.d/nginx")
source=("git+${url}.git"
		"git+https://github.com/AirisX/nginx_cookie_flag_module.git"
		"git+https://github.com/cloudflare/quiche.git"
		"git+https://github.com/google/ngx_brotli.git"
		"git+https://github.com/cloudflare/zlib.git"
		"https://nginx.org/LICENSE"
		"service"
		"logrotate")
b2sums=("SKIP"
		"SKIP"
		"SKIP"
		"SKIP"
		"SKIP"
		"fbd993990b43a4476d0963287bdc5f55f73fa5ce828f11977cf1abeedd478729a95861d930e27c6a1b0e78b16397164395afc4473fd34e050cadd32b94336beb"
		"b6414f9917fe62cc57556a2927fb404cc839398dac64a0d60c1d45af11a4e6be71bbee5f9bae17ce3604c31ab9247e8c6aec759f86890b54f86267db1fe7c08a"
		"fe32fb75a7677abca86c4bc3f4ca9bfeccb3cd7afb4dd3c4ec21ab8b53cc0d72ba5330a1131498b5df222c2e517bd01e2df9f67256011ff15241b777a85be6b3")

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

_stable_flags=(
	--add-module="../ngx_brotli"
	--add-module="../nginx_cookie_flag_module"
	--with-http_v2_hpack_enc
	--with-http_v3_module
	--with-libatomic
	--with-openssl="../quiche/deps/boringssl"
	--with-quiche="../quiche"
	--with-zlib="../zlib"
)

prepare() {
	cp -r "nginx"{,"-src"}

	cd "quiche"
	git submodule update --init
}

build() {
	export CC=gcc
	export CXX=g++

	CPPFLAGS="-D_FORTIFY_SOURCE=2"
	CFLAGS="-march=native -mtune=native -O2 -pipe -fno-plt -flto"
	CXXFLAGS="-march=native -mtune=native -O2 -pipe -fno-plt -flto"
	LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

	cd "nginx"
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
		--with-cc-opt="$CFLAGS $CPPFLAGS -DTCP_FASTOPEN=23" \
		--with-ld-opt="$LDFLAGS" \
		${_common_flags[@]} \
		${_stable_flags[@]}
	make
}

package_nginx-lazerl0rd-git() {
	pkgdesc="NGINX with beefed up security and performance"

	cd "nginx"

	make install DESTDIR="${pkgdir}" 

	sed -e "s|\<user\s\+\w\+;|user html;|g" \
		-e "44s|html|/usr/share/nginx/html|" \
		-e "54s|html|/usr/share/nginx/html|" \
		-i "${pkgdir}/etc/nginx/nginx.conf"

	rm "${pkgdir}/etc/nginx/*.default"
	rm "${pkgdir}/etc/nginx/mime.types"

	install -d -m755 "${pkgdir}/var/lib/nginx"
	chown root:root "${pkgdir}/var/log/nginx"
	install -d -m700 "${pkgdir}/var/lib/nginx/proxy"

	install -d "${pkgdir}/usr/share/nginx"
	mv "${pkgdir}/etc/nginx/html" "${pkgdir}/usr/share/nginx"

	install -D -m644 "../logrotate" "${pkgdir}/etc/logrotate.d/nginx"
	install -D -m644 "../service" "${pkgdir}/usr/lib/systemd/system/nginx.service"

	cd ..
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	
	cd "nginx"

	rmdir "${pkgdir}/run"

	install -d "${pkgdir}/usr/share/man/man8"
	gzip -9c "docs/man/nginx.8" > "${pkgdir}/usr/share/man/man8/nginx.8.gz"

	for i in ftdetect indent syntax; do
		install -D -m644 "contrib/vim/$i/nginx.vim" \
			"${pkgdir}/usr/share/vim/vimfiles/$i/nginx.vim"
	done
}

package_nginx-lazerl0rd-src-git() {
	pkgdesc="Source code of nginx-lazerl0rd $pkgver, useful for building modules"

	install -d "${pkgdir}/usr/src"
	cp -r "nginx-src" "${pkgdir}/usr/src/nginx"
}
