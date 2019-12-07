# PKGBUILD Author: Hui Yiqun <huiyiqun@gmail.com>
# Maintainer: pan93412  <pan93412@gmail.com>

_pkgname=nginx
pkgname=$_pkgname-rtmp-sergey-git
_nginx_ver=1.17.6
_rtmp_commit_id=3bf752326
pkgver=$_nginx_ver"_"$_rtmp_commit_id
pkgrel=0
pkgdesc='NGINX-based Media Streaming Server, forked by Sergey Dryabzhinsky.'
arch=(x86_64)
url='https://github.com/sergey-dryabzhinsky/nginx-rtmp-module'
license=(custom)
depends=(pcre zlib openssl geoip mailcap)
backup=(etc/nginx/fastcgi.conf
        etc/nginx/fastcgi_params
        etc/nginx/koi-win
        etc/nginx/koi-utf
        etc/nginx/nginx.conf
        etc/nginx/scgi_params
        etc/nginx/uwsgi_params
        etc/nginx/win-utf
        etc/logrotate.d/nginx)
install=nginx.install
source=(https://nginx.org/download/nginx-$_nginx_ver.tar.gz
        "nginx-rtmp-module-$_rtmp_commit_id::git+https://github.com/sergey-dryabzhinsky/nginx-rtmp-module#commit=$_rtmp_commit_id"
        service
        logrotate)
provides=('nginx')
conflicts=('nginx')
md5sums=('55022aa5715386c994f6773478822853'
         'SKIP'
         'ef491e760e7c1ffec9ca25441a150c83'
         '6a01fb17af86f03707c8ae60f98a2dc2')

_common_flags=(
  --with-compat
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
)

build() {
  cd $_pkgname-$_nginx_ver

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
    --add-module=$srcdir/nginx-rtmp-module-$_rtmp_commit_id \
    ${_common_flags[@]} \
    ${_stable_flags[@]}

  make
}

package() {
  cd $_pkgname-$_nginx_ver
  make DESTDIR="$pkgdir" install

  sed -e 's|\<user\s\+\w\+;|user html;|g' \
    -e '44s|html|/usr/share/nginx/html|' \
    -e '54s|html|/usr/share/nginx/html|' \
    -i "$pkgdir"/etc/nginx/nginx.conf

  rm "$pkgdir"/etc/nginx/*.default
  rm "$pkgdir"/etc/nginx/mime.types  # in mailcap

  install -d "$pkgdir"/var/lib/nginx
  install -dm700 "$pkgdir"/var/lib/nginx/proxy

  chmod 755 "$pkgdir"/var/log/nginx
  chown root:root "$pkgdir"/var/log/nginx

  install -d "$pkgdir"/usr/share/nginx
  mv "$pkgdir"/etc/nginx/html/ "$pkgdir"/usr/share/nginx

  install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
  install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 ../nginx-rtmp-module-$_rtmp_commit_id/LICENSE "$pkgdir"/usr/share/licenses/nginx-rtmp-sergey-git/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/$i/nginx.vim \
      "$pkgdir/usr/share/vim/vimfiles/$i/nginx.vim"
  done
}
