#base on aur/nginx-mainline-libressl

_pkgname="nginx"
_user="baka"
_group="users"
_doc_root="/usr/share/${_pkgname}/http"
_sysconf_path="etc"
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/spool/${_pkgname}"
_pid_path="/run"
_lock_path="/var/lock"
_log_path="/var/log/${_pkgname}"
_mod1=ngx_http_google_filter_module
_mod1ver=0.2.0
_mod2=ngx_http_substitutions_filter_module
_mod2ver=0.6.4
_mod3=nginx-ct
_mod3ver=1.3.1

pkgname=nginx-mainline-mod4679
pkgver=1.11.8
pkgrel=1
pkgdesc="lightweight HTTP server, statically linked against OpenSSL(Cloudflare's patch),with ngx_http_google_filter_module,nginx-ct."
arch=('i686' 'x86_64')

depends=('pcre' 'zlib' 'pam' 'gd' 'hardening-wrapper' 'libxslt')
makedepends=(
	'libxslt'
	'gd'
)

url="http://nginx.org"
license=('custom')
conflicts=('nginx' 'nginx-libressl' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full') 
provides=('nginx')
backup=("${_conf_path}/nginx.conf"
	"${_conf_path}/koi-win"
	"${_conf_path}/koi-utf"
	"${_conf_path}/win-utf"
	"${_conf_path}/mime.types"
	"${_conf_path}/fastcgi.conf"
	"${_conf_path}/fastcgi_params"
	"${_conf_path}/scgi_params"
	"${_conf_path}/uwsgi_params"
	"etc/logrotate.d/nginx")

source=("nginx.conf"
	"nginx.logrotate"
	"nginx.service"
	"http://nginx.org/download/nginx-$pkgver.tar.gz"
	"https://github.com/openssl/openssl/archive/OpenSSL_1_0_2j.tar.gz"
        "https://raw.githubusercontent.com/cloudflare/sslconfig/master/patches/openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch"
        "${_mod1}-${_mod1ver}.tar.gz::https://github.com/cuber/${_mod1}/archive/${_mod1ver}.tar.gz"
        "${_mod2}-${_mod2ver}.tar.gz::https://github.com/yaoweibin/${_mod2}/archive/v${_mod2ver}.tar.gz"
        "${_mod3}-${_mod3ver}.tar.gz::https://github.com/grahamedgecombe/${_mod3}/archive/v${_mod3ver}.tar.gz"
)

sha256sums=('8d8e314da10411b29157066ea313fc080a145d2075df0c99a1d500ffc7e8b7d1'
            'adcf6507abb2d4edbc50bd92f498ba297927eed0460d71633df94f79637aa786'
            '225228970d779e1403ba4314e3cd8d0d7d16f8c6d48d7a22f8384db040eb0bdf'
            '53aef3715d79015314c2dcb18f2b185a0c64368cc01b30bdf0737a215f666b34'
            '66cf834f2145505f432a03dcaa1db290e50eb64c68be4a22a9b60884536f45ac'
            'd6f9427d5cb63c7299563c201cd8708c7166e0f8c98b57a1fee69767362bf0f7'
            '9cd68c8e092efb1a419e1087bb9ca23aab1ff8650c400c0aa815d461d79385de'
            'ed4ddbcf0c434f4a1e97b61251a63ace759792764bd5cb79ff20efe348db8db3'
            'c223b642fc541933b9cdb18b771a52ccf728fb309350898080970ab1fda18e6f')

build() {
	local _src_dir="${srcdir}/${_pkgname}-${pkgver}"

	export CFLAGS="-Wno-error -fPIC"

	cd ${srcdir}/
	mv openssl-OpenSSL_1_0_2j openssl
	cd openssl && patch -p1 < ../openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch

	cd $_src_dir
	sed -i 's#nginx/#nginx-mod4679-#' src/core/nginx.h

	./configure \
		--prefix="/${_conf_path}" \
		--conf-path="/${_conf_path}/nginx.conf" \
		--sbin-path="/usr/bin/${_pkgname}" \
		--pid-path="${_pid_path}/${_pkgname}.pid" \
		--lock-path=${_pid_path}/${_pkgname}.lock \
		--http-client-body-temp-path=${_tmp_path}/client_body_temp \
		--http-proxy-temp-path=${_tmp_path}/proxy_temp \
		--http-fastcgi-temp-path=${_tmp_path}/fastcgi_temp \
		--http-uwsgi-temp-path=${_tmp_path}/uwsgi_temp \
		--http-scgi-temp-path=${_tmp_path}scgi_temp \
		--http-log-path=${_log_path}/access.log \
		--error-log-path=${_log_path}/error.log \
		--user=${_user} \
		--group=${_group} \
		--with-ipv6 \
		--with-openssl=../openssl \
		--with-threads \
		--with-http_ssl_module \
		--with-http_gzip_static_module \
		--with-http_realip_module \
		--with-http_v2_module \
		--with-file-aio \
		--with-pcre-jit \
		--with-stream \
		--add-module=../${_mod1}-${_mod1ver} \
		--add-module=../${_mod2}-${_mod2ver} \
 		--add-module=../${_mod3}-${_mod3ver}

	touch ${srcdir}/openssl/ssl.h

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install

	sed -i -e "s/\<user\s\+\w\+;/user $_user;/g" ${pkgdir}/$_conf_path/nginx.conf
	mkdir -p ${pkgdir}/$_conf_path/sites-available/

	install -d "${pkgdir}/${_tmp_path}"
	install -d "${pkgdir}/${_doc_root}"

	mv "${pkgdir}/${_conf_path}/html/"* "${pkgdir}/${_doc_root}"
	rm -rf "${pkgdir}/${_conf_path}/html"

	install -D -m644 "${srcdir}/nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
	install -D -m644 "${srcdir}/nginx.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
	install -D -m644 "${srcdir}/nginx.service" "${pkgdir}/usr/lib/systemd/system/nginx.service"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "man/nginx.8" "${pkgdir}/usr/share/man/man8/nginx.8"
}
