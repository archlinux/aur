# Maintainer: 咸粽子 <xianzongzi aliyun.com>
pkgname=angie-tongsuo
_pkgname=angie
pkgver=1.3.0
_tongsuo_version=8.3.3
pkgrel=1
pkgdesc="Angie is an efficient, powerful, and scalable web server that was forked from angie.With Tongsuo.带了铜锁密码库的 angie，可能支持国密（没测试）。"
arch=("x86_64")
url="https://angie.software"
license=(custom)
groups=()
depends=(gd geoip pcre2 zlib glibc libxcrypt)
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
backup=(etc/angie/fastcgi.conf
        etc/angie/fastcgi_params
        etc/angie/koi-win
        etc/angie/koi-utf
	etc/angie/mime.types
        etc/angie/angie.conf
        etc/angie/scgi_params
        etc/angie/uwsgi_params
        etc/angie/win-utf
        etc/logrotate.d/angie)
source=(https://download.angie.software/files/$_pkgname-$pkgver.tar.gz
        Tongsuo-$_tongsuo_version.tar.gz::https://github.com/Tongsuo-Project/Tongsuo/archive/refs/tags/$_tongsuo_version.tar.gz
)
sha256sums=('bc39d307f1644964f394c65ca4f416b81e03cbcfa0b4106931f84def39a87474'
            '038a75a02d8f7063fbc36d6b9a28f136f25959acda2caa577276849b57c4f698')


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
  --with-http_image_filter_module
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
  --with-openssl=../Tongsuo-$_tongsuo_version
    --with-openssl-opt=enable-ntls
    --with-ntls
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
  cd "$_pkgname-$pkgver"
  ./configure \
    --prefix=/etc/angie \
    --conf-path=/etc/angie/angie.conf \
    --sbin-path=/usr/bin/angie \
    --pid-path=/run/angie.pid \
    --lock-path=/run/lock/angie.lock \
    --user=http \
    --group=http \
    --http-log-path=/var/log/angie/access.log \
    --error-log-path=stderr \
    --http-client-body-temp-path=/var/lib/angie/client-body \
    --http-proxy-temp-path=/var/lib/angie/proxy \
    --http-fastcgi-temp-path=/var/lib/angie/fastcgi \
    --http-scgi-temp-path=/var/lib/angie/scgi \
    --http-uwsgi-temp-path=/var/lib/angie/uwsgi \
    --with-cc-opt="$CFLAGS $CPPFLAGS" \
    --with-ld-opt="$LDFLAGS" \
    ${_common_flags[@]} \
    ${_stable_flags[@]}

  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm "$pkgdir"/etc/angie/*.default
  # rm "$pkgdir"/etc/angie/mime.types  # in mailcap ==> /etc/nginx/mime.types

  install -d "$pkgdir"/var/lib/angie
  install -dm700 "$pkgdir"/var/lib/angie/proxy

  chmod 755 "$pkgdir"/var/log/angie
  chown root:root "$pkgdir"/var/log/angie

  install -Dm644 ../../logrotate "$pkgdir"/etc/logrotate.d/angie
  install -Dm644 ../../service "$pkgdir"/usr/lib/systemd/system/angie.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE_angie
  install -Dm644 ../Tongsuo-$_tongsuo_version/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE_Tongsuo

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c man/angie.8 > "$pkgdir"/usr/share/man/man8/angie.8.gz

}
