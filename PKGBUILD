################################################################################
# Maintainer: Fabiano Furtado < fusca14 _at_ gmail *dot* com >
# Description: patches to remove the HTTP "server" header
# Changes:
#   * "server_tokens" default value = "off"
#   * "server_tokens off;": "server header" removed from http header response
#   * "server_tokens on;": default header "Server: ws"
#   * "server_tokens build;" is no longer valid
#
# https://wiki.archlinux.org/title/AUR_submission_guidelines#Publishing_new_package_content
################################################################################

pkgbase='nginx-without-server-header'
_pkgbase='nginx'
pkgname=($pkgbase $pkgbase'-src')
pkgver='1.30.3'
pkgrel=1
_prefix_relative='etc/nginx'
_prefix_full='/'$_prefix_relative
arch=('x86_64')
url='https://nginx.org'
license=('BSD-2-Clause')
makedepends=('pcre2' 'zlib' 'openssl' 'geoip' 'mailcap' 'libxcrypt')
checkdepends=('perl' 'perl-gd' 'perl-io-socket-ssl' 'perl-fcgi' 'perl-cache-memcached'
              'memcached' 'ffmpeg')
conflicts=('nginx' 'nginx-src')
install='nginx.install'
source=($url'/download/nginx-'$pkgver'.tar.gz'{,'.asc'}
        'nginx.service'
        'logrotate'
        'ngx_http_core_module.c.patch'
        'ngx_http_core_module.h.patch'
        'ngx_http_header_filter_module.c.patch'
        'ngx_http_special_response.c.patch'
        'ngx_http_v2_filter_module.c.patch'
        'ngx_http_v3_filter_module.c.patch')

# https://nginx.org/en/pgp_keys.html
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8'  # Maxim Dounin <mdounin@mdounin.ru>
              '43387825DDB1BB97EC36BA5D007C8D7C15D87369'  # Roman Arutyunyan <r.arutyunyan@f5.com>
              'D6786CE303D9A9022998DC6CC8464D549AF75C0A'  # Sergey Kandaurov <s.kandaurov@f5.com>
              '13C82A63B603576156E30A4EA0EA981B66B0D967') # Konstantin Pavlov <thresh@nginx.com>
sha512sums=('13b479cb2e80bbe7e0b977bd762e70b0cb95c7ce5dc80da61ab59fbcf2da19eca266dc82a8ef1a8b8c8c19c22948abd1aa6a3817bf490880ae175f7e2f692495'
            'SKIP'
            '490e973fac48c0b27d35c722d190c1103fc0e6f71362580739f47eea4373f2a7206a8722866c740c916a4be7e789db80d4ce56a67e751f1183e420cb314a32d8'
            '25b1054176b694dda940528df45432bdc80191ad9dd6f11b7bb02da43b3c38c592448664774ccde779bb6953f9d32a4fd55349dbad9b43a7db38a1410a47dc24'
            '65365c26aec87e9023f62ab44e0793f518c5aa8e2eac5d101cfdbfd415946533bd4bf5b734d73e4f06ad0e49856d38892bc6cf70b1d043e73a554936ffa522bd'
            '173e0a7d213cbcfe1653c2c1c83c37808fda5a03da58cf4fe46f9240f23489267bd76c6925029452faf9c6b0a99eac95d697b25322e2274e3d86cffe815e8383'
            '0c66371e18871d1b4a4f9c23b467727229fae06f134ae7556fa98055141a2957d49641edf4835c730fdf65052da4a2237e8abfa17684e065b487f3353e62006a'
            '71d5deb40c77401b73f7b76750ee23a4eede990d3310fb32b983f2983b6c5769c99782172ef4dbad0e4aafa6c13f223cf0e80cc35c0b2e3f0cb113ea00947f15'
            '65894467a7b800b6c7a10c6e6c5d2ddf98432300b3d0f8795933142faaa60ea55513d50f3ece6acbe8458a97dc9c757c18891c224a29286b8d00046d00847dff'
            '5c41afb61dcaab4f3a751e399de47859691ca4878aad086bdd2c279d9b21467e89c4312c7cfacac1a59e94b3173a5c7dab58e884463bdc5f5b62c93cad7e7f9c')

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
  --with-http_random_index_module
  --with-http_realip_module
  --with-http_secure_link_module
  --with-http_slice_module
  --with-http_ssl_module
  --with-http_stub_status_module
  --with-http_sub_module
  --with-http_v2_module
  --with-http_v3_module
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

prepare() {
  ### START PATCHING ###
  local patch_src
  for patch_src in "${source[@]}"; do
    #src="${patch_src%%::*}"
    #src="${patch_src##*/}"
    [[ $patch_src = *'.patch' ]] || continue
    echo -n 'Applying "'$patch_src'"... '
    patch -d $srcdir'/'$_pkgbase'-'$pkgver -Np1 < $srcdir'/'$patch_src
  done
  ### END PATCHING ###
  cp -r $_pkgbase'-'$pkgver{,'-src'}
}


build() {
  cd $_pkgbase'-'$pkgver

  ./configure \
    --prefix=$_prefix_full \
    --conf-path=$_prefix_full'/nginx.conf' \
    --sbin-path='/usr/bin/nginx' \
    --pid-path='/run/nginx.pid' \
    --lock-path='/run/lock/nginx.lock' \
    --user='http' \
    --group='http' \
    --http-log-path='/var/log/nginx/access.log' \
    --error-log-path='/var/log/nginx/error.log' \
    --http-client-body-temp-path='/var/lib/nginx/client-body' \
    --http-proxy-temp-path='/var/lib/nginx/proxy' \
    --http-fastcgi-temp-path='/var/lib/nginx/fastcgi' \
    --http-scgi-temp-path='/var/lib/nginx/scgi' \
    --http-uwsgi-temp-path='/var/lib/nginx/uwsgi' \
    --modules-path='/usr/lib/nginx/modules' \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    "${_common_flags[@]}"

  make
}

package_nginx-without-server-header() {
  pkgdesc='Lightweight web server, IMAP/POP3 and TCP/UDP proxy server, without HTTP server header'
  depends=('pcre2' 'zlib' 'openssl' 'geoip' 'mailcap' 'libxcrypt')
  backup=($_prefix_relative'/fastcgi.conf'
          $_prefix_relative'/fastcgi_params'
          $_prefix_relative'/koi-win'
          $_prefix_relative'/koi-utf'
          $_prefix_relative'/nginx.conf'
          $_prefix_relative'/scgi_params'
          $_prefix_relative'/uwsgi_params'
          $_prefix_relative'/win-utf'
          'etc/logrotate.d/nginx')

  cd $_pkgbase'-'$pkgver
  make DESTDIR="$pkgdir" install


  sed -e '/^#user\s/s|nobody;|http;|' \
    -e '/^#error_log\s.*\sinfo;$/a error_log  /var/log/nginx/error.log  error;' \
    -e '/^\s*#log_format/,/;$/s|^\(\s*\)#|\1|' \
    -e '/^\s*#access_log\s\s*logs\/access\.log/,/;$/s|^\(\s*\)#|\1|' \
    -e 's|logs\/access\.log|/var/log/nginx/access\.log|' \
    -e '/^\s*#gzip\s\s*on;$/a\\n    types_hash_max_size 4096;\n\n    server_tokens off;\n\n    root /usr/share/nginx/html;' \
    -e 's| html;| /usr/share/nginx/html;|' \
    -i $pkgdir$_prefix_full'/nginx.conf'

  sed -e '/^\s*fastcgi_param\s\s*SERVER_SOFTWARE\s\s*nginx\/\$nginx_version;/s|^|#|' \
    -e '/^\s*#fastcgi_param\s\s*SERVER_SOFTWARE\s\s*nginx\/\$nginx_version;/a\fastcgi_param  SERVER_SOFTWARE    nginx;' \
    -i $pkgdir$_prefix_full'/fastcgi_params'

  rm $pkgdir$_prefix_full'/'*'.default'
  rm $pkgdir$_prefix_full'/mime.types'  # in mailcap

  install -d $pkgdir'/var/lib/nginx'
  install -dm700 $pkgdir'/var/lib/nginx/proxy'

  install -dm750 $pkgdir'/usr/lib/nginx/modules/'
  ln -s /usr/lib/nginx/modules/ $pkgdir$_prefix_full'/modules'

  chmod 755 $pkgdir'/var/log/nginx'
  chown root:root $pkgdir'/var/log/nginx'

  install -d $pkgdir'/usr/share/nginx'
  mv $pkgdir$_prefix_full'/html/' $pkgdir'/usr/share/nginx'

  install -Dm644 ../logrotate $pkgdir'/etc/logrotate.d/nginx'
  install -Dm644 ../nginx.service $pkgdir'/usr/lib/systemd/system/nginx.service'
  install -Dm644 LICENSE $pkgdir'/usr/share/licenses/'$_pkgbase'/LICENSE'

  rmdir $pkgdir'/run'

  install -Dm0644 'objs/nginx.8' $pkgdir'/usr/share/man/man8/nginx.8'

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 'contrib/vim/'$i'/nginx.vim' \
      $pkgdir'/usr/share/vim/vimfiles/'$i'/nginx.vim'
  done
}

package_nginx-without-server-header-src() {
  pkgdesc='Source code of patched NGINX '$pkgver', useful for building modules'
  install -d $pkgdir'/usr/src/'
  cp -r $_pkgbase'-'$pkgver'-src' $pkgdir'/usr/src/'$_pkgbase
  install -Dm644 $_pkgbase'-'$pkgver'-src/LICENSE' \
    $pkgdir'/usr/share/licenses/'$_pkgbase'-src/LICENSE'
}
