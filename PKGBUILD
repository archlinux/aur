# Maintainer: Reinforce-II <reinforce20001@yahoo.com>

_pkgname="nginx"
_uesr="nginx"
_group="nginx"
_sysconf_path="etc"
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/lib/${_pkgname}"
_pid_path="/run"
_lock_path="/run/lock"
_log_path="/var/log/${_pkgname}"

pkgname=nginx-openssl-1.1
pkgver=1.11.10
pkgrel=1
opensslver=1.1.0e
pkgdesc="latest nginx, default build config except build with openssl 1.1."
arch=('i686' 'x86_64')

depends=('pcre' 'zlib' 'geoip')
makedepends=('gd' 'libxslt' 'git')
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
source=("nginx.conf"
		"nginx.service"
		"http://nginx.org/download/nginx-$pkgver.tar.gz"
		"https://www.openssl.org/source/openssl-$opensslver.tar.gz"
)
build() {
    local _src_dir="${srcdir}/${_pkgname}-${pkgver}"
    cd $_src_dir
    tar xzf ../openssl-$opensslver.tar.gz
    ./configure \
        --prefix=/${_conf_path}   \
        --conf-path=/${_conf_path}/nginx.conf \
        --sbin-path=/usr/bin/${_pkgname}  \
        --pid-path=${_pid_path}/${_pkgname}.pid   \
        --lock-path=${_lock_path}/${_pkgname}.lock \
        --user=${_uesr} \
        --group=${_group}   \
        --http-log-path=${_log_path}/access.log \
        --error-log-path=stderr \
        --http-client-body-temp-path=${_tmp_path}/client-body   \
        --http-proxy-temp-path=${_tmp_path}/proxy   \
        --http-fastcgi-temp-path=${_tmp_path}/fastcgi   \
        --http-scgi-temp-path=${_tmp_path}/scgi \
        --http-uwsgi-temp-path=${_tmp_path}/uwsgi   \
        --with-pcre-jit --with-file-aio --with-http_addition_module \
        --with-http_auth_request_module --with-http_dav_module  \
        --with-http_degradation_module --with-http_flv_module   \
        --with-http_geoip_module --with-http_gunzip_module  \
        --with-http_gzip_static_module --with-http_mp4_module   \
        --with-http_realip_module --with-http_secure_link_module    \
        --with-http_slice_module --with-http_ssl_module \
        --with-http_stub_status_module --with-http_sub_module   \
        --with-http_v2_module --with-mail --with-mail_ssl_module    \
        --with-stream --with-stream_ssl_module --with-threads   \
        --with-stream_ssl_preread_module --with-stream_geoip_module \
        --with-stream_realip_module \
        --with-openssl=./openssl-${opensslver}
    
    make -j4
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
	install -T "${srcdir}/nginx.conf" "${pkgdir}/${_conf_path}/nginx.conf"
	install -d "${pkgdir}/${_tmp_path}"
	install -d "${pkgdir}/${_conf_path}/server"
	install -D -m644 "${srcdir}/nginx.service" "${pkgdir}/usr/lib/systemd/system/nginx.service"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m644 "man/nginx.8" "${pkgdir}/usr/share/man/man8/nginx.8"
}
sha1sums=('02a9b3a74b5387790c0d6d7b63abe6bf6acc686f'
    '43cf1403b04fed9e8d643e52b275b78cb3892ca5'
    'd9c4e3361c0802eaa90aa924b8981c5d3ed771dc'
    '8bbbaf36feffadd3cb9110912a8192e665ebca4b'
)
