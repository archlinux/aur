# Maintainer: Fabiano Furtado < fusca14 _at_ gmail *dot* com >

pkgbase=freenginx
pkgname=($pkgbase $pkgbase'-src')
pkgver=1.28.0
pkgrel=1
_prefix_relative='etc/'$pkgbase
_prefix_full='/'$_prefix_relative
arch=(x86_64)
url='https://'$pkgbase'.org'
options=(strip !debug)
license=(custom)
makedepends=(pcre2 zlib openssl geoip mailcap libxcrypt)
checkdepends=(perl perl-gd perl-io-socket-ssl perl-fcgi 
              perl-cache-memcached memcached ffmpeg) 
source=($url/download/$pkgbase-$pkgver.tar.gz{,.asc}
        freenginx.service
        logrotate
        ngx_setproctitle.c.patch)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
sha512sums=('90694e0fc4d596bb9ff82c851b3b469e7cb350a719dfa68b5c32826727328895e9ae40e2115a707bc24eeb8faa91d7b0136a48b8bef9993bfdda436a09776b7b'
            'SKIP'
            '2fb3e090e0b44ed9dadf2dee11a045bf422ba80f427ff642e478c533cf756c9727a2bfafbb8e034ef45192699afb6e34fc662a7899e18808cb51ca02f3f30464'
            '24f5ee73b0e9d8775d36aa250d63401abd7c9d474babd6acc197a4e995eb6e668b15d08794145f3d5acd0a77b854be3e3d2cbc0e0f3e1b416b877baa95dc0f0f'
            'b5fa03c48f31e6e1f0fe3033f1a18c1740d38699d130f43094b60d309c2e32359830417a8c48e9c2a1969047e3df7cd350276e8a4a3923a6626ccbcd0e1c1e96')

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
)

prepare() {
  local patch_src
  for patch_src in "${source[@]}"; do
    #src="${patch_src%%::*}"
    #src="${patch_src##*/}"
    [[ $patch_src = *.patch ]] || continue
    echo -n "Applying \"$patch_src\"... "
    patch -d "$srcdir/$pkgbase-$pkgver" -Np1 < "$srcdir/$patch_src"
  done
  cp -r $pkgbase'-'$pkgver{,-src}
}

build() {
  cd $pkgbase-$pkgver

  ./configure \
    --prefix=$_prefix_full \
    --conf-path=$_prefix_full/freenginx.conf \
    --sbin-path=/usr/bin/$pkgbase \
    --pid-path=/run/$pkgbase.pid \
    --lock-path=/run/lock/$pkgbase.lock \
    --user=http \
    --group=http \
    --http-log-path=/var/log/$pkgbase/access.log \
    --error-log-path=/var/log/$pkgbase/error.log \
    --http-client-body-temp-path=/var/lib/$pkgbase/client-body \
    --http-proxy-temp-path=/var/lib/$pkgbase/proxy \
    --http-fastcgi-temp-path=/var/lib/$pkgbase/fastcgi \
    --http-scgi-temp-path=/var/lib/$pkgbase/scgi \
    --http-uwsgi-temp-path=/var/lib/$pkgbase/uwsgi \
    --modules-path=/usr/lib/$pkgbase/modules \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    "${_common_flags[@]}" \
    "${_stable_flags[@]}"

  make
}

package_freenginx() {
  pkgdesc='Lightweight web server, IMAP/POP3 and TCP/UDP proxy server'
  depends=(pcre2 zlib openssl geoip mailcap libxcrypt)
  backup=($_prefix_relative/fastcgi.conf
          $_prefix_relative/fastcgi_params
          $_prefix_relative/koi-win
          $_prefix_relative/koi-utf
          $_prefix_relative/freenginx.conf
          $_prefix_relative/scgi_params
          $_prefix_relative/uwsgi_params
          $_prefix_relative/win-utf
          etc/logrotate.d/$pkgbase)

  cd $pkgbase'-'$pkgver
  make DESTDIR="$pkgdir" install

  sed -e '2s|\<user\s\+\w\+;|user http;|' \
    -e '3s|1|auto|' \
    -e '8i \error_log  /var/log/'$pkgbase'/error.log  error;' \
    -e '18s|mime\.types;|\/etc\/nginx\/mime\.types;  # mailpcap reference|' \
    -e '21s|[#]||;22s|[#]||;23s|[#]||;25s|[#]||;25s|logs|/var/log/'$pkgbase'|' \
    -e '34i \\n    types_hash_max_size 4096;\n\n    server_tokens off;\n\n    root /usr/share/'$pkgbase'/html;' \
    -e '44s|html|/usr/share/'$pkgbase'/html|' \
    -e '54s|html|/usr/share/'$pkgbase'/html|' \
    -i $pkgdir$_prefix_full'/'$pkgbase'.conf'

  sed -e '16s|^|#|' \
    -e '17i fastcgi_param  SERVER_SOFTWARE    '$pkgbase';' \
    -i $pkgdir$_prefix_full'/fastcgi_params'

  rm $pkgdir$_prefix_full'/'*.default
  rm $pkgdir$_prefix_full'/mime.types'  # in mailcap

  install -d $pkgdir'/var/lib/'$pkgbase
  install -dm700 $pkgdir'/var/lib/'$pkgbase'/proxy'

  install -dm750 $pkgdir'/usr/lib/'$pkgbase'/modules/'
  ln -s /usr/lib/$pkgbase/modules/ $pkgdir$_prefix_full'/modules'

  chmod 755 $pkgdir'/var/log/'$pkgbase
  chown root:root $pkgdir'/var/log/'$pkgbase

  install -d $pkgdir'/usr/share/'$pkgbase
  mv $pkgdir$_prefix_full'/html/' $pkgdir'/usr/share/'$pkgbase

  install -Dm644 ../logrotate $pkgdir'/etc/logrotate.d/'$pkgbase
  install -Dm644 ../freenginx.service $pkgdir'/usr/lib/systemd/system/'$pkgbase'.service'
  install -Dm644 LICENSE $pkgdir'/usr/share/licenses/'$pkgbase'/LICENSE'

  rmdir $pkgdir'/run'

  gzip -q9 objs/nginx.8 && \
  install -Dm0644 'objs/nginx.8.gz' $pkgdir'/usr/share/man/man8/'$pkgbase'.8'

  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 'contrib/vim/'$i'/nginx.vim' \
      $pkgdir'/usr/share/vim/vimfiles/'$i'/'$pkgbase'.vim'
  done
}

package_freenginx-src() {
  pkgdesc='Source code of '$pkgbase' '$pkgver', useful for building modules'
  depends=()
  backup=()
  install -d $pkgdir'/usr/src/'
  cp -r $pkgbase'-'$pkgver'-src' $pkgdir'/usr/src/'$pkgbase
}
