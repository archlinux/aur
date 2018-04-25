# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Alexander Kuznecov <alexander@kuznetcov.me>

_pkgname=nginx
pkgname=nginx-custom
pkgver=1.14.0
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server (ready for use with 3rd party modules)'
arch=('x86_64')
url='https://nginx.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'pam' 'geoip' 'geoip-database' 'gd' 'libxslt' 'mailcap')
checkdepends=('perl' 'perl-gd' 'perl-io-socket-ssl' 'perl-fcgi' 'perl-cache-memcached'
              'memcached' 'ffmpeg' 'inetutils')
makedepends=('libxslt' 'gd' 'mercurial')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full')
provides=("nginx=$pkgver")

_user='http'
_group='http'
_doc_root="/usr/share/${_pkgname}/html"
_sysconf_path='etc'
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/spool/${_pkgname}"
_pid_path='/run'
_lock_path='/var/lock'
_access_log_path="/var/log/${_pkgname}/access.log"
#_error_log_path="/var/log/${_pkgname}/error.log"
_error_log_path='stderr'
backup=("${_conf_path}/fastcgi.conf"
        "${_conf_path}/fastcgi_params"
        "${_conf_path}/koi-win"
        "${_conf_path}/koi-utf"
        "${_conf_path}/nginx.conf"
        "${_conf_path}/scgi_params"
        "${_conf_path}/uwsgi_params"
        "${_conf_path}/win-utf"
        "etc/logrotate.d/nginx")

source=("nginx.sh"
        "nginx.conf"
        "nginx.logrotate"
        "nginx.service"
        "https://nginx.org/download/nginx-$pkgver.tar.gz"{,.asc}
        hg+http://hg.nginx.org/nginx-tests#revision=d6daf03478ad
)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('c147953bd4e10ea3a74d9b4add59f18fc0bed093016a53a1d33ea2b9065cdc23'
            '8d8e314da10411b29157066ea313fc080a145d2075df0c99a1d500ffc7e8b7d1'
            '06ebe161af3e761f2e2e35a67c6c0af27bf61aea7cd4ba8b28372ced5e3b3175'
            'c61cf4fefeb2a3b4c5eaba61123546e03f87c701466e8dad2c9262433f13b2d5'
            '5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'
            'SKIP'
            'SKIP')

check() {
  cd nginx-tests
  TEST_NGINX_BINARY="$srcdir/${_pkgname}-${pkgver}/objs/nginx" find -maxdepth 1 -iname '*.t' -exec prove {} \+
}

build() {
  local _src_dir="${srcdir}/${_pkgname}-${pkgver}"
  cd $_src_dir

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
    --http-log-path=${_access_log_path} \
    --error-log-path=${_error_log_path} \
    --user=${_user} \
    --group=${_group} \
    --with-compat \
    --with-debug \
    --with-ipv6 \
    --with-pcre-jit \
    --with-file-aio \
    --with-mail \
    --with-mail_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-threads \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_dav_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_sub_module \
    --with-http_v2_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-threads \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_slice_module \
    --with-http_perl_module \
    --with-http_degradation_module \
    --with-http_geoip_module \
    --with-http_gunzip_module \
    --with-http_auth_request_module \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install

  sed -e "s|\<user\s\+\w\+;|user $_user $_group;|g" \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i ${pkgdir}/$_conf_path/nginx.conf

  mkdir -p ${pkgdir}/$_conf_path/sites-enabled/
  mkdir -p ${pkgdir}/$_conf_path/sites-available/

  install -d "${pkgdir}/${_tmp_path}"
  install -d "${pkgdir}/${_doc_root}"

  mv "${pkgdir}/${_conf_path}/html/"* "${pkgdir}/${_doc_root}"
  rm -rf "${pkgdir}/${_conf_path}/html"
  rm "$pkgdir"/etc/nginx/mime.types # in mailcap

  install -D -m555 "${srcdir}/nginx.sh" "${pkgdir}/etc/rc.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.service" "${pkgdir}/usr/lib/systemd/system/nginx.service"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
}
