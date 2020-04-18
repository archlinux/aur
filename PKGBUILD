#base on aur/nginx-libressl

_pkgname="nginx"
_user="http"
_group="http"
_doc_root="/usr/share/${_pkgname}/http"
_sysconf_path="etc"
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/spool/${_pkgname}"
_pid_path="/run"
_lock_path="/var/lock"
_log_path="/var/log/${_pkgname}"


pkgname=nginx-mainline-libressl
pkgver=1.17.10
pkgrel=1
librever=3.1.0
pkgdesc="lightweight HTTP server, statically linked against LibreSSL."
arch=('i686' 'x86_64')

depends=('pcre' 'zlib' 'pam' 'gd' 'libxslt')
makedepends=(
		'libxslt'
		'gd'
		'git'
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

source=(	"http://nginx.org/download/nginx-$pkgver.tar.gz"{,.asc}
		"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$librever.tar.gz"{,.asc}
		"nginx.conf"
		"nginx.logrotate"
		"nginx.service"
       )
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
		'A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>
sha256sums=('a9aa73f19c352a6b166d78e2a664bb3ef1295bbe6d3cc5aa7404bd4664ab4b83'
            'SKIP'
            'f91aad0c8fb9cbc67c910ad6dcffb401a819b4fd122007ea7f978638db044cf6'
            'SKIP'
            '8d8e314da10411b29157066ea313fc080a145d2075df0c99a1d500ffc7e8b7d1'
            'adcf6507abb2d4edbc50bd92f498ba297927eed0460d71633df94f79637aa786'
            '225228970d779e1403ba4314e3cd8d0d7d16f8c6d48d7a22f8384db040eb0bdf')

build() {
	local _src_dir="${srcdir}/${_pkgname}-${pkgver}"


		cd $_src_dir
		tar zxvf ../libressl-$librever.tar.gz

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
		--with-openssl=./libressl-$librever \
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
		--with-stream_ssl_preread_module
		--with-stream_geoip_module
		--with-stream_realip_module

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
