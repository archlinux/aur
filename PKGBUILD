# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Guillaume Clément <gclement at baobob dot org>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=nginx-mod-lua
pkgver=0.10.29R2
# Above the AUR's 1:0.10.29R2-1, which is built against Arch Linux's luajit and without
# ngx_devel_kit, and doesn't depend on the exact nginx it's built for: our build, until the AUR's
# next release
pkgrel=1.1
# The AUR's epoch, without which our version would be below its
epoch=1
# ngx_devel_kit, the version of Arch Linux's nginx-mod-ndk, whose headers the module is built
# against for ndk.set_var
_ndkver=0.3.4
# Test::Nginx, upstream's test scaffold, for check()
_testnginxver=0.32
pkgdesc="Lua scripting for nginx: the ngx_http_lua module of OpenResty, built for Arch Linux's nginx"
arch=(x86_64)
url="https://github.com/openresty/lua-nginx-module"
license=(BSD-2-Clause)
# The exact version of nginx it's built against is added in package()
depends=(
  glibc
  # OpenResty's LuaJIT, not Arch Linux's luajit: the module uses its extensions where it's built
  # against it (OPENRESTY_LUAJIT), so a module built against one doesn't work with the other
  luajit-openresty
  # The Lua side of the module, which it loads on startup: lua-resty-core checks the module's
  # version exactly, 0.1.32 is the release for 0.10.29
  'lua-resty-core>=1:0.1.32R1'
  'lua-resty-core<1:0.1.33RC1'
  nginx-mod-ndk
)
makedepends=(
  nginx
  nginx-src
)
# Upstream's tests: Test::Nginx's Perl modules, the nginx modules they use besides ours, and the
# servers some talk to
checkdepends=(
  memcached
  nginx-mod-echo
  nginx-mod-headers-more
  nginx-mod-memc
  nginx-mod-redis2
  nginx-mod-set-misc
  nginx-mod-srcache
  perl-http-response-encoding
  perl-ipc-run
  perl-libwww
  perl-list-moreutils
  perl-test-base
  perl-test-longstring
  perl-text-diff
  perl-uri
  valkey
)
backup=(etc/nginx/modules.d/30-lua.conf)
source=(
  "lua-nginx-module-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "ngx_devel_kit-$_ndkver.tar.gz::https://github.com/vision5/ngx_devel_kit/archive/refs/tags/v$_ndkver.tar.gz"
  "test-nginx-$_testnginxver.tar.gz::https://github.com/openresty/test-nginx/archive/refs/tags/v$_testnginxver.tar.gz"
)
sha512sums=('4933e8d250ee8cceae5b42e95235df9e2e63536b158a57c57c6846af42d52e65c39aa5cdac74564255ded40b77f1c1262fe3f3581e485d5d156f7bdda51a93d2'
  '6bc2f4d3b7ad22527e6c7c343884f8b0d5810ae9b7b09d6c2988b50afbd9c7a79e387667bfb980e93c5e204c163544f79634b2862895d8ee004a4393245ee185'
  'c8ddec5dc21c23ded4ea974f4d6fca01ea498f728e5f8dc87224b1151bf9fcfb1921d971359ee79e3984b23fd6cb2f510259b077f79b867b95a437d28af48b97')
b2sums=('fb323ffe97785837f6f9973072a26c224439448e58e61510d63524f7480a559741367b257140f0e77049299a24824adf104c5c54f319e311fc4fdd9aa076306d'
  '3b5ed36517f27ea83881d2fb1e6ba2839c173a833ec563fa94dc9b633b3ebe9ea24c7bb5676aa811267b09a2504d74b306ee7268b8a0d56b230886fd955289e9'
  '5b98a9764d2fb322199ecf839feed2d995f4ab3e2c9488eebe698fad00e852c45862b94774232d4d8043e2850018c1699ea055a0da211b88211eddfc26e380ed')

# The version of the installed nginx, empty without it
_nginxver() {
  nginx -v 2>&1 | sed -n 's|^nginx version: nginx/||p'
}

prepare() {
  # The module is built against nginx's sources, which have to be the version of the installed
  # nginx it's loaded into
  local _srcver
  _srcver=$(sed -n 's/^#define NGINX_VERSION *"\(.*\)"$/\1/p' /usr/src/nginx/src/core/nginx.h)
  if [[ $_srcver != "$(_nginxver)" ]]; then
    printf 'nginx-src %s does not match nginx %s\n' "$_srcver" "$(_nginxver)" >&2
    return 1
  fi

  # nginx's configure runs in the source tree: our build directory, with its scripts and sources
  mkdir -p build
  ln -sf /usr/src/nginx/auto /usr/src/nginx/src build/
}

build() {
  # Arch Linux's nginx's own configure arguments, so that the module sees the same features (SSL,
  # HTTP/2 and HTTP/3, threads), as Arch Linux's modules only pass --with-compat, which leaves out
  # the module's SSL API (ngx.ssl, ssl_certificate_by_lua*, cosockets' TLS); without its dynamic
  # modules and its compiler and linker flags, which are makepkg's below. The module keeps the
  # arguments for ngx.config.nginx_configure(), so they don't name $srcdir: the compiler flags
  # (makepkg's -ffile-prefix-map) come from CFLAGS, which nginx's configure takes as it is, and
  # the modules' paths are relative, as Arch Linux's modules do
  local _args
  mapfile -t _args < <(nginx -V 2>&1 | sed -n 's/^configure arguments: //p' | xargs printf '%s\n' |
    grep -v -e '=dynamic$' -e '^--with-cc-opt=' -e '^--with-ld-opt=')
  if [[ ! " ${_args[*]} " =~ " --with-compat " ]]; then
    echo 'nginx is not built with --with-compat' >&2
    return 1
  fi

  cd build || exit
  # LuaJIT: OpenResty's, which installs to /usr like luajit
  CFLAGS+=" $CPPFLAGS" \
    LUAJIT_INC=$(pkg-config --variable=includedir luajit) \
    LUAJIT_LIB=$(pkg-config --variable=libdir luajit) \
    auto/configure \
    "${_args[@]}" \
    --with-ld-opt="$LDFLAGS" \
    --add-dynamic-module="../ngx_devel_kit-$_ndkver" \
    --add-dynamic-module="../lua-nginx-module-$pkgver"
  make modules
}

check() {
  cd "lua-nginx-module-$pkgver" || exit

  # The test files left out, which need what a package build doesn't have. Upstream tests against
  # OpenResty's nginx, with its patches and test modules, and with services and Internet access;
  # these fail for that, not for our build
  local _skip=(
    # MySQL, and the drizzle module, which Arch Linux doesn't package
    000--init 003-errors 005-exit 026-mysql
    # Modules built into OpenResty's test nginx: the stream module (static), image_filter
    020-subrequest 058-tcp-socket 186-cosocket-busy-bufs
    # mockeagain, OpenResty's LD_PRELOAD library that simulates slow sockets
    057-flush-timeout 065-tcp-socket-timeout 117-raw-req-socket-timeout 131-duplex-req-socket
    147-tcp-socket-timeouts 156-slow-network
    # OpenResty's test modules (fake shared memory zones, ngx.delayed_load)
    148-fake-shm-zone 149-hup-fake-shm-zone 150-fake-delayed-load
    # lua-cjson, which OpenResty bundles
    069-null
    # Internet access (openresty.org, 8.8.8.8)
    129-ssl-socket
    # The ssl_*_by_lua* phases, which need OpenResty's patches to nginx, as its README says
    # (https://openresty.org/en/nginx-ssl-patches.html), proxy_ssl_verify_by_lua*, which the patched
    # nginx has, and the balancer's tests, which fail against stock nginx as well
    138-balancer 139-ssl-cert-by 140-ssl-c-api 142-ssl-session-store 143-ssl-session-fetch
    155-tls13 166-ssl-client-hello 169-proxy-ssl-verify 187-ssl-two-verification
    # Some tests each that expect the behaviour of OpenResty's nginx (1.27), not of nginx 1.30,
    # which upstream doesn't test yet: e.g. proxy_http_version is 1.1 by default since nginx 1.29.7,
    # and other log lines and timings
    002-content 009-log 016-resp-header 025-codecache 028-req-header 030-uri-args 045-ngx-var
    068-socket-keepalive 077-sleep 090-log-socket-errors 094-uthread-exit 100-client-abort
    123-lua-path 124-init-worker 127-uthread-kill 128-duplex-tcp-socket 153-semaphore-hup
    158-global-var 160-disable-init-by-lua 162-exit-worker 163-signal 168-tcp-socket-bind
  )
  local _tests=() _test
  for _test in t/*.t; do
    [[ " ${_skip[*]} " == *" $(basename "$_test" .t) "* ]] || _tests+=("$_test")
  done

  # memcached and Redis (valkey) for the tests that talk to them, on free ports, as the build
  # shares the host's network
  local _free_port='print IO::Socket::INET->new(Listen => 1, LocalAddr => "127.0.0.1")->sockport'
  local -x TEST_NGINX_MEMCACHED_PORT TEST_NGINX_REDIS_PORT
  TEST_NGINX_MEMCACHED_PORT=$(perl -MIO::Socket::INET -e "$_free_port")
  TEST_NGINX_REDIS_PORT=$(perl -MIO::Socket::INET -e "$_free_port")
  memcached -d -l 127.0.0.1 -p "$TEST_NGINX_MEMCACHED_PORT" -U "$TEST_NGINX_MEMCACHED_PORT" \
    -P "$srcdir/memcached.pid"
  valkey-server --bind 127.0.0.1 --port "$TEST_NGINX_REDIS_PORT" --daemonize yes \
    --pidfile "$srcdir/valkey.pid" --dir "$srcdir" --save ''

  # Ours, after ngx_devel_kit, and the others the tests use
  local _modules=/usr/lib/nginx/modules _status=0
  local _load=(
    "$_modules/ndk_http_module.so"
    "$srcdir/build/objs/ngx_http_lua_module.so"
    "$_modules/ngx_http_echo_module.so"
    "$_modules/ngx_http_headers_more_filter_module.so"
    "$_modules/ngx_http_memc_module.so"
    "$_modules/ngx_http_redis2_module.so"
    "$_modules/ngx_http_set_misc_module.so"
    "$_modules/ngx_http_srcache_filter_module.so"
  )
  # Random ports and server roots, for parallel tests
  TEST_NGINX_RANDOMIZE=1 \
    TEST_NGINX_BINARY=/usr/bin/nginx \
    TEST_NGINX_LOAD_MODULES="${_load[*]}" \
    prove -j "$(nproc)" -I . -I "$srcdir/test-nginx-$_testnginxver/lib" "${_tests[@]}" || _status=$?
  # Stop the servers before reporting
  kill "$(<"$srcdir/memcached.pid")" "$(<"$srcdir/valkey.pid")"
  return "$_status"
}

package() {
  # makepkg also evaluates this outside the build, where nginx may be missing (--printsrcinfo)
  local _ver
  _ver=$(_nginxver)
  depends+=("nginx${_ver:+=$_ver}")

  install -Dm755 -t "$pkgdir/usr/lib/nginx/modules" build/objs/ngx_http_lua_module.so
  # After nginx-mod-ndk's 20-ndk.conf: the module uses ngx_devel_kit's functions
  install -dm755 "$pkgdir/etc/nginx/modules.d"
  echo 'load_module "/usr/lib/nginx/modules/ngx_http_lua_module.so";' >"$pkgdir/etc/nginx/modules.d/30-lua.conf"

  cd "lua-nginx-module-$pkgver" || exit
  # The licence is in the README
  sed -n '/^Copyright and License$/,/^\[Back to TOC\]/{/^\[Back to TOC\]/d;p}' README.markdown |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.markdown
}
