# Maintainer:  Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>
# Contributor: DasSkelett <dasskelett@dasskelett.dev>
# Contributor: Kasei Wang <kasei@kasei.im>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Drew DeVault

_pkgbase=nginx
_commit=cc16989c6d61
pkgbase=nginx-quic-libressl
pkgname=(nginx-quic-libressl nginx-quic-libressl-src)
pkgver=1.25.3
pkgrel=4
pkgdesc='Lightweight HTTP server and IMAP/POP3 proxy server, HTTP/3 QUIC branch'
arch=('i686' 'x86_64')
url='https://nginx.org'
license=('custom')
depends=('geoip' 'libxcrypt' 'pcre2' 'zlib' 'glibc')
makedepends=('cmake' 'git' 'go' 'mercurial')
backup=('etc/nginx/fastcgi.conf'
        'etc/nginx/fastcgi_params'
        'etc/nginx/koi-win'
        'etc/nginx/koi-utf'
        'etc/nginx/nginx.conf'
        'etc/nginx/scgi_params'
        'etc/nginx/uwsgi_params'
        'etc/nginx/win-utf'
        'etc/logrotate.d/nginx')
install=nginx.install
provides=('nginx' 'nginx-mainline')
conflicts=('nginx')
source=("hg+https://hg.nginx.org/nginx#revision=$_commit"
        "https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.8.2.tar.gz"
        "service"
        "logrotate")
sha256sums=('SKIP'
            '6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954'
            '05fdc0c0483410944b988d7f4beabb00bec4a44a41bd13ebc9b78585da7d3f9b'
            'b9af19a75bbeb1434bba66dd1a11295057b387a2cbff4ddf46253133909c311e')

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

_mainline_flags=(
)

_quic_flags=(
  --with-http_v3_module
#  --with-stream_quic_module
)

prepare() {
  # Backup pristine version of nginx source for -src package
  test -d ${srcdir}/${pkgname}-src && rm -r ${srcdir}/${pkgname}-src
  cp -r ${srcdir}/nginx ${srcdir}/nginx-src
}

build() {
  # Clear -D_FORTIFY_SOURCE from C++ build flags, it causes Boringssl tests to fail to compile
  export CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=[1-9]/-D_FORTIFY_SOURCE=0}
  export CXXFLAGS=${CXXFLAGS/-D_FORTIFY_SOURCE=[1-9]/-D_FORTIFY_SOURCE=0}

  export CXXFLAGS="$CXXFLAGS -fPIC"
  export CFLAGS="$CFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS"

  if [[ $CC == "clang" ]];then
    _cc_opt="-flto"
    _ld_opt="-flto -fuse-ld=lld $LDFLAGS"
  else
    _cc_opt=""
    _ld_opt="$LDFLAGS"

    # Disable some warnings that make Boringssl fail to compile due to a forced -Werror in CMakeLists.txt
    # -Wno-array-bounds: 2022-05-21 for compatiblity with GCC 12.1 (https://bugs.chromium.org/p/boringssl/issues/detail?id=492&sort=-modified)
    export CFLAGS="$CFLAGS -Wno-stringop-overflow -Wno-array-parameter -Wno-array-bounds"
  fi

#  cd ${srcdir}/boringssl
#  mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release ../ && make crypto ssl
#  cd ${srcdir}/boringssl
#  mkdir -p .openssl/lib && cd .openssl && ln -s ../include . && cd ../
#  cp ${srcdir}/boringssl/build/crypto/libcrypto.a ${srcdir}/boringssl/build/ssl/libssl.a .openssl/lib && cd ..

  cd ${srcdir}/nginx
  ./auto/configure \
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
    --with-openssl=${srcdir}/libressl-3.8.2 \
    --with-cc-opt="${_cc_opt}" \
    --with-ld-opt="${_ld_opt}" \
    ${_common_flags[@]} \
    ${_mainline_flags[@]} \
    ${_quic_flags[@]}

  #touch ${srcdir}/boringssl/.openssl/include/openssl/ssl.h
  make
}

package_nginx-quic-libressl() {
  cd nginx
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
  install -Dm644 docs/text/LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$provides/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  rmdir "$pkgdir"/run

  install -d "$pkgdir"/usr/share/man/man8/
  gzip -9c docs/man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz

  for i in ftdetect indent syntax; do
    install -Dm644 contrib/vim/${i}/nginx.vim \
      "${pkgdir}/usr/share/vim/vimfiles/${i}/nginx.vim"
  done
}

package_nginx-quic-libressl-src() {
  pkgdesc="Source code of nginx-quic $pkgver, useful for building modules"
  arch=('any')
  provides=('nginx-src' 'nginx-mainline-src')
  conflicts=($_pkgbase-src)
  depends=("sh" "bash" "perl")
  backup=()
  install -d "$pkgdir/usr/src"
  test -d "$pkgdir/usr/src/nginx" && rm -r "$pkgdir/usr/src/nginx"
  cp -r ${srcdir}/nginx-src "$pkgdir/usr/src/nginx"
  # Delete the .hg directory, it is huge and not needed
  rm -r ${pkgdir}/usr/src/nginx/{.hg,.hgtags}
  # Link the 'configure' script to its location in release tarballs,
  # as this is where modules expect it
  ln -s /usr/src/nginx/auto/configure "$pkgdir/usr/src/nginx"
  cd nginx-src
  install -Dm644 docs/text/LICENSE "$pkgdir"/usr/share/licenses/$provides/LICENSE
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$provides/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
