# Maintainer: Joshua Small <technion@lolware.net>

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


pkgname=nginx-libressl
pkgver=1.8.0
pkgrel=3
librever=2.1.7
pkgdesc="lightweight HTTP server, statically linked against LibreSSL."
arch=('i686' 'x86_64')

depends=('pcre' 'zlib' 'pam' 'gd' 'hardening-wrapper' 'libxslt')
makedepends=(
	'libxslt'
	'gd'
	'git'
)

url="http://nginx.org"
license=('custom')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full') 
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

source=( "nginx.conf"
		"nginx.logrotate"
		"nginx.service"
		"http://nginx.org/download/nginx-$pkgver.tar.gz"
		"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$librever.tar.gz"
)


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
		--with-ipv6 \
		--with-openssl=./libressl-$librever \
		--with-imap \
		--with-http_ssl_module \
		--with-http_gzip_static_module \
		--with-http_realip_module \
		--with-http_spdy_module \
		--with-file-aio

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

sha256sums=('8d8e314da10411b29157066ea313fc080a145d2075df0c99a1d500ffc7e8b7d1'
            '1504db3de81d0d01c9c9965b7029939e3bb7ab36745afaa4df425e9d680a4fd7'
            '225228970d779e1403ba4314e3cd8d0d7d16f8c6d48d7a22f8384db040eb0bdf'
            '23cca1239990c818d8f6da118320c4979aadf5386deda691b1b7c2c96b9df3d5'
            '1dc4bfc03fbe14732704291d6d9cb7a3cc70575957c958a7e2d686908e9cdb8f')
