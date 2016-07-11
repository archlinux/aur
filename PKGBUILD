# Maintainer:  Sergey Shatunov <me@prok.pw>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault

_pkgbase=nginx-mainline
pkgbase=${_pkgbase}-addons
pkgname=("${pkgbase}" "${_pkgbase}-full")
pkgver=1.11.2
pkgrel=1
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, mainline release'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://nginx.org'
license=('custom')
makedepends=('hardening-wrapper' 'geoip' 'leiningen' 'java-environment-openjdk>=8')
source=($url/download/nginx-$pkgver.tar.gz
        service
        logrotate)
md5sums=('9db11337a924a665ff68c1785bcf314e'
         'ce9a06bcaf66ec4a3c4eb59b636e0dfd'
         '3441ce77cdd1aab6f0ab7e212698a8a7')

addons=(
  'builtin geoip - ngx_http_geoip_module.so geoip'
  'builtin image_filter - ngx_http_image_filter_module.so'
  'builtin perl - ngx_http_perl_module.so'
  'builtin xslt_filter - ngx_http_xslt_filter_module.so'
  'builtin stream - ngx_stream_module.so'
  'builtin mail - ngx_mail_module.so'
  'github fancyindex aperezdc/ngx-fancyindex ngx_http_fancyindex_module.so'
  'github brotli google/ngx_brotli ngx_http_brotli_static_module.so:ngx_http_brotli_filter_module.so'
  'github headers-more openresty/headers-more-nginx-module ngx_http_headers_more_filter_module.so'
  'github ct grahamedgecombe/nginx-ct ngx_http_ssl_ct_module.so:ngx_ssl_ct_module.so'
  'github auth-pam stogh/ngx_http_auth_pam_module ngx_http_auth_pam_module.so'
  'github clojure/src/c nginx-clojure/nginx-clojure ngx_http_clojure_module.so'
  'github ndk simpl/ngx_devel_kit ndk_http_module.so'
  'github encrypted-session openresty/encrypted-session-nginx-module ngx_http_encrypted_session_module.so ${_pkgbase}-addon-ndk'
  'github lua-http openresty/lua-nginx-module ngx_http_lua_module.so ${_pkgbase}-addon-ndk'
  'github nchan slact/nchan ngx_nchan_module.so'
  'git rtmp https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git#branch=dev ngx_rtmp_module.so'
)

_addon_ver=${pkgver}-${pkgrel}

_common_flags=(
  --with-cpp_test_module
  --with-file-aio
  --with-google_perftools_module
  --with-http_addition_module
  --with-http_auth_request_module
  --with-http_dav_module
  --with-http_degradation_module
  --with-http_flv_module
  --with-http_geoip_module=dynamic
  --with-http_gunzip_module
  --with-http_gzip_static_module
  --with-http_image_filter_module=dynamic
  --with-http_mp4_module
  --with-http_perl_module=dynamic
  --with-http_random_index_module
  --with-http_realip_module
  --with-http_secure_link_module
  --with-http_slice_module
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
  --with-http_v2_module
  --with-http_xslt_module=dynamic
  --with-ipv6
  --with-mail=dynamic
  --with-mail_ssl_module
  --with-pcre-jit
  --with-stream=dynamic
  --with-stream_ssl_module
  --with-threads
)

_mainline_flags=(
)

_addons_flags=(
  --modules-path=/usr/lib/${_pkgbase}/modules
)

build() {  
  for i in "${addons[@]}"; do pre_build_addon "$i"; done

  cd ${srcdir}/nginx-$pkgver

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
    ${_common_flags[@]} \
    ${_mainline_flags[@]} \
    ${_addons_flags[@]}

  make
}

package_nginx-mainline-addons() {
  cd ${srcdir}/nginx-$pkgver

  depends=('pcre' 'zlib' 'openssl' 'gperftools')
  backup=('etc/nginx/fastcgi.conf'
          'etc/nginx/fastcgi_params'
          'etc/nginx/koi-win'
          'etc/nginx/koi-utf'
          'etc/nginx/mime.types'
          'etc/nginx/nginx.conf'
          'etc/nginx/scgi_params'
          'etc/nginx/uwsgi_params'
          'etc/nginx/win-utf'
          'etc/logrotate.d/nginx')
  provides=('nginx' 'nginx-mainline')
  conflicts=('nginx' 'nginx-mainline')
  replaces=('nginx' 'nginx-mainline')

  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -e '1iinclude modules/enabled/*.conf' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 750 "$pkgdir"/var/log/nginx
  chown http:log "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
  
  rm -rf ${pkgdir}/usr/lib/${_pkgbase}/modules/*
  
  install -d ${pkgdir}/etc/nginx/modules{,/available,/enabled}
}

package_nginx-mainline-full() {
  depends=("${pkgbase}")
  pkgdesc='Full set of addons for Nginx server'
  for i in "${addons[@]}"; do
    addon=($i)
    name=$(echo ${addon[1]} | cut -f1 -d/)

    depends+=("${_pkgbase}-addon-${name}=${_addon_ver}")
  done
}

add_addon() {
  addon=($1)
  type=${addon[0]}
  name=${addon[1]}
  path=$(echo ${name} | cut -f2- -d/ -s)
  name=$(echo ${name} | cut -f1 -d/)
  uri=${addon[2]}
  IFS=':' read -r -a objects <<< "${addon[3]}"
  IFS=':' read -r -a dependencies <<< "${addon[4]}"
  
  add_${type}_addon "${name}" "${uri}"
  pkgname+=("${_pkgbase}-addon-${name}")
  
  source /dev/stdin <<EOF
  package_${_pkgbase}-addon-${name}() {
	depends=("${pkgbase}=${_addon_ver}")
	install -d \${pkgdir}/usr/lib/${_pkgbase}/modules
	install -d \${pkgdir}/etc/nginx/modules/available
	module_file="\${pkgdir}/etc/nginx/modules/available/${name}.conf"
	echo -n > \${module_file}
	for object in ${objects[@]}; do
	  install \${srcdir}/nginx-${pkgver}/objs/\$object \${pkgdir}/usr/lib/${_pkgbase}/modules/\$object
	  echo "load_module /usr/lib/nginx-mainline/modules/\$object;" >> \${module_file}
	done
	echo ""
	for dep in ${dependencies[@]}; do
	  depends+=(\$dep)
	done
	if [ ${type} == 'git' ] || [ ${type} == 'github' ]; then
	  cd \${srcdir}/nginx-addon-${name}
	  pkgver="${pkgver}.r\$(git rev-list --count HEAD).\$(git rev-parse --short HEAD)"
	fi
	if [ \$(type -t post_package_${_pkgbase}-addon-${name})"" == 'function' ]; then
	  post_package_${_pkgbase}-addon-${name} "$1"
	fi
  }
EOF
}

add_git_addon() {
  name=$1
  uri=$2

  source+=("nginx-addon-${name}::git+${uri}")
  md5sums+=('SKIP')
}

add_github_addon() {
  add_git_addon "${1}" "https://github.com/${2}.git"
}

add_builtin_addon() {
  name=$1
  uri=$2  
}

for i in "${addons[@]}"; do add_addon "$i"; done

pre_build_addon() {
  addon=($1)
  type=${addon[0]}
  name=${addon[1]}
  path=$(echo ${name} | cut -f2- -d/ -s)
  name=$(echo ${name} | cut -f1 -d/)
  uri=${addon[2]}
  IFS=':' read -r -a objects <<< "${addon[3]}"
  
  if [ "${type}" != 'builtin' ]; then
    _addons_flags+=("--add-dynamic-module=${srcdir}/nginx-addon-${name}/${path}")
  fi
  
  if [ $(type -t build_${_pkgbase}-addon-${name})"" == 'function' ]; then
    build_${_pkgbase}-addon-${name} "$1"
  fi
}

build_nginx-mainline-addon-clojure() {
	cd ${srcdir}/nginx-addon-clojure
	lein jar
}

post_package_nginx-mainline-addon-clojure() {
	install -d ${pkgdir}/usr/share/java/nginx-clojure
	install ${srcdir}/nginx-addon-clojure/target/nginx-clojure-*.jar ${pkgdir}/usr/share/java/nginx-clojure/nginx-clojure.jar
}
