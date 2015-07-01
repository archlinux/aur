pkgname=nginx-passenger-mod-auth-kerb-git
_pkgname="nginx"
_doc_root="/srv/http/${_pkgname}"
_sysconf_path="etc"
_conf_path="${_sysconf_path}/${_pkgname}"
_tmp_path="/var/run/${_pkgname}"
_log_path="/var/log/${_pkgname}"
_user="http"
_group="http"
_gemname=passenger
_nginx_pkgver=1.1.14
_passenger_pkgver=3.0.11
pkgver=20120130
pkgrel=5
pkgdesc="lightweight HTTP server and IMAP/POP3 proxy server with Kerberos and Passenger support"
arch=('i686' 'x86_64')
depends=('pcre' 'zlib' 'openssl' 'ruby' 'heimdal' 'spnegohelp-git')
makedepends=('rubygems')
url="https://github.com/fintler/nginx-mod-auth-kerb"
license=('custom')
conflicts=('nginx')
provides=('nginx')
noextract=($_gemname-$_passenger_pkgver.gem)
backup=("${_conf_path#/}/nginx.conf"
	"${_conf_path#/}/koi-win"
	"${_conf_path#/}/koi-utf"
	"${_conf_path#/}/win-utf"
	"${_conf_path#/}/mime.types"
	"${_conf_path#/}/fastcgi_params"
	"etc/logrotate.d/nginx")
source=("http://nginx.org/download/nginx-${_nginx_pkgver}.tar.gz"
	"nginx.sh"
	"nginx.conf"
	"nginx.logrotate"
	http://gems.rubyforge.org/gems/$_gemname-$_passenger_pkgver.gem)
md5sums=('16d523e395778ef35b49a2fa6ad18af0'
         '70b39280671d3cee700bea3883852d32'
         '323a91c795f509d50cff07e526cc127f'
         'e01e6f679c5c626e909f01687a2d37d4'
         'c0cafef2c5ba522310602f451ea4c941')
install=nginx-passenger-mod-auth-kerb-git.install

_gitroot="https://github.com/fintler/nginx-mod-auth-kerb.git"
_gitname="nginx-mod-auth-kerb"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi

  msg "GIT checkout of nginx-mod-auth-kerb done or server timeout"
  msg "Starting make..."

  local _nginx_mod_auth_kerb_src=$srcdir/$_gitname
  local _src_dir="${srcdir}/${_pkgname}-${_nginx_pkgver}"
  local _build_dir="${_src_dir}/objs"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  cd $srcdir
  gem install --no-rdoc --no-ri -i "$pkgdir$_gemdir" $_gemname-$_passenger_pkgver.gem

  cd "${_src_dir}"
  ./configure \
    --prefix="/${_conf_path}" \
    --conf-path="/${_conf_path}/${_pkgname}.conf" \
    --sbin-path="/usr/sbin/${_pkgname}" \
    --pid-path="${_tmp_path}/${_pkgname}.pid" \
    --lock-path="/var/lock/${_pkgname}.lock" \
    --http-client-body-temp-path="${_tmp_path}/client_body_temp" \
    --http-proxy-temp-path="${_tmp_path}/proxy_temp" \
    --http-fastcgi-temp-path="${_tmp_path}/fastcgi_temp" \
    --http-log-path="${_log_path}/access.log" \
    --error-log-path="${_log_path}/error.log" \
    --user="${_user}" --group="${_group}" \
    --with-mail --with-mail_ssl_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-file-aio \
    --with-http_gzip_static_module \
    --add-module=${_nginx_mod_auth_kerb_src}\
    --add-module=../../pkg/$_gemdir/gems/passenger-$_passenger_pkgver/ext/nginx
  #--with-http_perl_module \
    #--with-ipv6 \
    #--with-debug \
    #--with-http_realip_module \
    #--with-http_addition_module \
    #--with-http_xslt_module \
    #--with-http_image_filter_module \
    #--with-http_geoip_module \
    #--with-http_sub_module \
    #--with-http_dav_module \
    #--with-http_flv_module \
    #--with-http_random_index_module \
    #--with-http_secure_link_module \
    #--with-http_degradation_module \

    make
  make DESTDIR="${pkgdir}" install

  sed -i'' -e "s#root\s\+\w\+;#root ${_doc_root};#g" "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"

  install -d "${pkgdir}/${_tmp_path}"

  # move default document root outside server root
  install -d "${pkgdir}/${_doc_root}"
  mv "${pkgdir}/${_conf_path}/html/"* "${pkgdir}/${_doc_root}"
  rm -rf "${pkgdir}/${_conf_path}/html"

  install -D -m555 "${srcdir}/nginx.sh" "${pkgdir}/etc/rc.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -D -m644 "${srcdir}/nginx.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 "man/nginx.8" "${pkgdir}/usr/share/man/man8/nginx.8"
}
