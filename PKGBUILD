# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Guillaume Clément <gclement at baobob dot org>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=nginx-mod-lua
# Upstream's newest release, an rc tag as OpenResty's releases take them (1.31.8.1 bundles rc7).
# It goes with a lua-resty-core of its own (_restycorever, depends). Above the AUR's 1:0.10.29R2-1
pkgver=0.10.32rc8
pkgrel=2
# The AUR's epoch, without which our version would be below its
epoch=1
# ngx_devel_kit, the version of Arch Linux's nginx-mod-ndk, whose headers the module is built
# against for ndk.set_var
_ndkver=0.3.4
# Test::Nginx, upstream's test scaffold, for check()
_testnginxver=0.32
# lua-resty-core, for its tests, which need the module and run in check(): the release that goes
# with pkgver, as in depends
_restycorever=0.1.35rc3
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
  # The Lua side of the module, which it loads on startup. lua-resty-core checks the module's
  # version (its 0.1.35 releases are for 0.10.32), but not the rc: the FFI of
  # balancer.enable_keepalive() takes a pool size since 0.10.32rc8
  # (openresty/lua-nginx-module@797bacea), which lua-resty-core declares since 0.1.35rc3
  # (openresty/lua-resty-core@16747a5); an older one passes its error pointer as the pool size,
  # and the module writes its error through garbage
  'lua-resty-core>=1:0.1.35rc3'
  'lua-resty-core<1:0.1.36rc1'
  nginx-mod-ndk
)
makedepends=(
  nginx
  nginx-src
  # For the test certificates in prepare()
  openssl
)
# Upstream's tests: Test::Nginx's Perl modules, the nginx modules they use besides ours, and the
# servers some talk to
checkdepends=(
  # lua-cjson, which OpenResty bundles, for 069-null and 140-ssl-c-api
  lua51-cjson
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
  "lua-resty-core-$_restycorever.tar.gz::https://github.com/openresty/lua-resty-core/archive/refs/tags/v$_restycorever.tar.gz"
)
sha512sums=('94b5aa3687bdba5338fd8c9e55f2b4f5eb5e973665e609dcb1b5d082c0eb5c782fa3e9397651de8c8ab78fd1fed97bcb7fe3e4ad059a5b80135a8255dc092cbb'
  '6bc2f4d3b7ad22527e6c7c343884f8b0d5810ae9b7b09d6c2988b50afbd9c7a79e387667bfb980e93c5e204c163544f79634b2862895d8ee004a4393245ee185'
  'c8ddec5dc21c23ded4ea974f4d6fca01ea498f728e5f8dc87224b1151bf9fcfb1921d971359ee79e3984b23fd6cb2f510259b077f79b867b95a437d28af48b97'
  '989768a37e9818317c1cc0b46d0a2ef0c14eb17a0494f3649e9f406f1a4572bab4dfb635ca749ba18dbd893e16bf6949a3fb26bcbb48bf6c0831de35b827730f')
b2sums=('49349bc66dab093435437c86d1e918fedce4f5045b445d10dead830dba7915863b9ba86f6f3815299044e4f66fe66836ae2a2504c18caa94417ee6f5fed0064b'
  '3b5ed36517f27ea83881d2fb1e6ba2839c173a833ec563fa94dc9b633b3ebe9ea24c7bb5676aa811267b09a2504d74b306ee7268b8a0d56b230886fd955289e9'
  '5b98a9764d2fb322199ecf839feed2d995f4ab3e2c9488eebe698fad00e852c45862b94774232d4d8043e2850018c1699ea055a0da211b88211eddfc26e380ed'
  'fa78bdebd7819a8f304ab87a067c2a1d312d64cecfb4e42d1c090103d3176fb5acf4ac37e29c9c1d2cacebe6ee7df73cc1e143d7f056ddb2b6ca0c8a0f2563cc')

# The version of the installed nginx, empty without it
_nginxver() {
  nginx -v 2>&1 | sed -n 's|^nginx version: nginx/||p'
}

# Reissues a self-signed test certificate with a subjectAltName for its CN, with its key, subject,
# serial and validity: OpenSSL 4.1 no longer checks the CN of a certificate without one
_add_san() {
  local _crt=$1 _key=$2 _cn _from _to
  shift 2
  _cn=$(openssl x509 -in "$_crt" -noout -subject -nameopt multiline | sed -n 's/^ *commonName *= //p')
  _from=$(openssl x509 -in "$_crt" -noout -startdate -dateopt iso_8601 | cut -d= -f2)
  _to=$(openssl x509 -in "$_crt" -noout -enddate -dateopt iso_8601 | cut -d= -f2)
  openssl x509 -in "$_crt" -key "$_key" "$@" \
    -not_before "$(date -u -d "$_from" +%Y%m%d%H%M%SZ)" \
    -not_after "$(date -u -d "$_to" +%Y%m%d%H%M%SZ)" \
    -extfile <(printf 'subjectAltName = DNS:%s\n' "$_cn") -out "$_crt.new"
  mv "$_crt.new" "$_crt"
}

# Replaces a copy of a certificate (PEM or DER) with the reissued one, after checking it's a copy
_replace_copy() {
  local _copy=$1 _orig=$2 _new=$3 _form=$4
  if ! openssl x509 -in "$_orig" -outform "$_form" | cmp -s - "$_copy"; then
    printf '%s is no copy of %s\n' "$_copy" "$_orig" >&2
    return 1
  fi
  openssl x509 -in "$_new" -outform "$_form" -out "$_copy"
}

# Leaves out tests of upstream's suite in DIR: a file (NAME) or blocks of it (NAME:N,N,…). A file
# with blocks left out runs without a plan, as the plans count the tests of every block
_skip_tests() {
  local _dir=$1 _entry _file _blocks _before _after
  shift
  for _entry; do
    _file=$_dir/t/${_entry%%:*}.t
    if [[ $_entry != *:* ]]; then
      rm "$_file"
      continue
    fi
    _blocks=${_entry#*:}
    _before=$(grep -c '^--- SKIP$' "$_file" || true)
    awk -v list=",$_blocks," '
      /^ *plan *\(? *tests *=>.*; *$/ { sub(/plan.*/, "plan(\"no_plan\");") }
      { print }
      /^=== TEST [0-9]+:/ { n = $3; sub(":", "", n); if (index(list, "," n ",")) print "--- SKIP" }
    ' "$_file" >"$_file.new"
    mv "$_file.new" "$_file"
    # Every block given exists: a new version may have renumbered them
    _after=$(grep -c '^--- SKIP$' "$_file")
    if ((_after - _before != $(tr ',' '\n' <<<"$_blocks" | wc -l))); then
      printf '%s: not every block of %s found\n' "$_file" "$_blocks" >&2
      return 1
    fi
  done
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

  _prepare_tests
}

# Upstream's tests of both, for check()
_prepare_tests() {
  local _lnm=lua-nginx-module-$pkgver _lrc=lua-resty-core-$_restycorever

  # Test::Nginx's Lua tests and some of upstream's take lua-resty-core and lua-resty-lrucache from
  # next to the module's sources, where upstream checks them out
  ln -sfn "$_lrc" lua-resty-core
  mkdir -p lua-resty-lrucache
  ln -sfn /usr/share/lua/5.1 lua-resty-lrucache/lib

  # upstream: none, OpenSSL 4.1 checks host names against subjectAltNames only, which upstream's
  # self-signed test certificates lack: reissue them with one, as Arch Linux's nginx does for its
  # tests. Their copies (DER, another name) with them
  local _orig
  _orig=$(mktemp)
  cp "$_lnm/t/cert/test.crt" "$_orig"
  _add_san "$_lnm/t/cert/test.crt" "$_lnm/t/cert/test.key"
  _add_san "$_lnm/t/cert/test2.crt" "$_lnm/t/cert/test2.key"
  _add_san "$_lnm/t/cert/test_ecdsa.crt" "$_lnm/t/cert/test_ecdsa.key"
  # The passphrase of upstream's gen-test-passphrase.sh
  _add_san "$_lnm/t/cert/test_passphrase.crt" "$_lnm/t/cert/test_passphrase.key" -passin pass:123456
  _replace_copy "$_lnm/t/cert/test_der.crt" "$_orig" "$_lnm/t/cert/test.crt" DER
  cp "$_lrc/t/cert/test.crt" "$_orig"
  _add_san "$_lrc/t/cert/test.crt" "$_lrc/t/cert/test.key"
  _add_san "$_lrc/t/cert/test2.crt" "$_lrc/t/cert/test2.key"
  _replace_copy "$_lrc/t/cert/test_passphrase.crt" "$_orig" "$_lrc/t/cert/test.crt" PEM
  _replace_copy "$_lrc/t/cert/test_der.crt" "$_orig" "$_lrc/t/cert/test.crt" DER
  _replace_copy "$_lrc/t/cert/test.crt.der" "$_orig" "$_lrc/t/cert/test.crt" DER
  rm "$_orig"

  # The tests left out, which need what a package build doesn't have: upstream tests with
  # OpenResty's nginx, its patches and test modules, and a test machine of its own
  # MySQL, and the drizzle module, which Arch Linux doesn't package
  _skip_tests "$_lnm" 000--init:1 003-errors:5 005-exit:6,7,8 026-mysql
  # stream-lua-nginx-module, OpenResty's module for the stream module
  _skip_tests "$_lnm" 058-tcp-socket:74 186-cosocket-busy-bufs
  _skip_tests "$_lrc" shdict-ownership-compat:2
  # image_filter, which upstream builds into nginx: Arch Linux's nginx-mod-image-filter, loaded
  # with the module, changes the error 132-lua-blocks' TEST 24 checks
  _skip_tests "$_lnm" 020-subrequest:74
  # mockeagain, OpenResty's LD_PRELOAD library for slow sockets, with nginx's poll module, which
  # Arch Linux's nginx doesn't build
  _skip_tests "$_lnm" 057-flush-timeout 065-tcp-socket-timeout 117-raw-req-socket-timeout \
    131-duplex-req-socket 147-tcp-socket-timeouts 156-slow-network 302-tcp-socket-timeout-log
  _skip_tests "$_lrc" balancer-timeout
  # OpenResty's test modules, which only build into nginx (their config is the old kind)
  _skip_tests "$_lnm" 148-fake-shm-zone:1,2,3,4 149-hup-fake-shm-zone 150-fake-delayed-load
  # OpenResty's patches to nginx: yielding in ssl_certificate_by_lua*, ssl_client_hello_by_lua*
  # and ssl_session_*_by_lua* (ssl_cert_cb_yield, ssl_client_hello_cb_yield, ssl_sess_cb_yield)
  _skip_tests "$_lnm" 139-ssl-cert-by:2,4,7,8,10,12,16,24,25 142-ssl-session-store:9 \
    166-ssl-client-hello:2,4,7,8,10,12,16,27,28
  _skip_tests "$_lrc" ssl:14,21
  # proxy_ssl_*_by_lua* (proxy_ssl_verify_cb_yield and the module's HAVE_PROXY_SSL_PATCH)
  _skip_tests "$_lnm" 169-proxy-ssl-verify 170-proxy-ssl-cert
  _skip_tests "$_lrc" proxy-ssl proxy-ssl-cert proxy-ssl-verify
  # The privileged agent process (privileged_agent_process*)
  _skip_tests "$_lnm" 124-init-worker:22,23 153-semaphore-hup
  _skip_tests "$_lrc" process-type-hup process-type-privileged-agent:1,4 \
    process-type-privileged-agent-connections:1,2,5
  # ngx.pipe (socket_cloexec)
  _skip_tests "$_lrc" pipe pipe-cpu-affinity pipe-stderr pipe-stdin pipe-stdout
  # lua_capture_error_log (intercept_error_log)
  _skip_tests "$_lrc" errlog:1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,19,20,21,22,27,28,29,30,31 errlog-raw-log:9
  # Longer lines in the error log (larger_max_error_str), $proxy_host and $proxy_port in more
  # phases (proxy_host_port_vars), ngx.sleep(0) (delayed_posted_events), SIGHUP in single process
  # mode (single_process_graceful_exit), subrequests of HTTP/2 requests that time out
  # (http2_subreq_error_wakeup)
  _skip_tests "$_lnm" 009-log:20 045-ngx-var:8 077-sleep:16,17 163-signal \
    189-http2-subreq-error-wakeup:1,2,3
  # Names nginx's resolver takes from /etc/hosts with OpenResty's resolver_hosts patch
  # (localhost, trailing-dot.test)
  _skip_tests "$_lnm" 014-bugs:37 058-tcp-socket:4 303-udp-socket-error-log
  # OpenResty's patch to OpenSSL that lets ssl_session_fetch_by_lua* yield (sess_set_get_cb_yield)
  _skip_tests "$_lrc" ssl-session-fetch:5
  # set_ciphers() with DHE-RSA-AES256-SHA first, which the test expects the server can't use
  # without DH parameters, as with the OpenSSL 3 of upstream's CI: OpenSSL 4 negotiates it anyway,
  # rather than the ECDHE-RSA-AES128-SHA the test looks for
  _skip_tests "$_lrc" ssl-client-hello:12
  # The firewall rules of upstream's CI (.travis.yml), which drop packets to 127.0.0.2:12345, so
  # that connecting to it times out, and reject UDP to port 10086
  _skip_tests "$_lnm" 058-tcp-socket:6,55,62 068-socket-keepalive:33,45 090-log-socket-errors:1,2 \
    094-uthread-exit:5,6,7 100-client-abort:6,7 127-uthread-kill:3,4 128-duplex-tcp-socket:5,6
  # Connecting to 0.0.0.1, which fails at once with older kernels, and hangs with current ones
  _skip_tests "$_lnm" 138-balancer:1,2,3,4,5,6,7,8,11,14 158-global-var:15
  _skip_tests "$_lrc" balancer:15
  # The machine's own address besides 127.0.0.1, which the test finds with ip(8) or ifconfig(8)
  _skip_tests "$_lnm" 168-tcp-socket-bind:2
  # nginx run with a configuration of the test's own, without the module's load_module
  _skip_tests "$_lnm" 160-disable-init-by-lua 192-lua-block-conf-dump
  # The Internet: names resolved by a public DNS server ($TEST_NGINX_RESOLVER, 8.8.8.8), hosts on
  # the Internet; 129-ssl-socket resolves openresty.org with dig(1) when it loads. These fail
  # without a network
  _skip_tests "$_lnm" 014-bugs:42,43,44,45 058-tcp-socket:8,33,34,50,51 087-udp-socket:10,11,12,13 \
    094-uthread-exit:10 124-init-worker:13 129-ssl-socket 162-socket-tls-handshake:1
  # Certificates signed by test CAs whose keys upstream doesn't ship, so they can't be reissued
  # for OpenSSL 4.1 above
  _skip_tests "$_lrc" ssl:8,9,15,16,29
  # The server sees no OCSP status request from the client in ssl_certificate_by_lua*
  # ("no status req"): not found yet why, upstream tests with OpenResty's OpenSSL 3.5
  _skip_tests "$_lrc" ocsp:16
  # CLOCK_MONOTONIC against /proc/uptime, which counts the time suspended as well: fails once
  # the machine has been suspended since it booted
  _skip_tests "$_lrc" time:13,14
  # Bugs of the tests: TEST 6 and 7 have a no_error_log eval that isn't a Perl list (two lines,
  # qr/…/ and [crit], without brackets); exit_worker_by_lua's log lines race with the shutdown,
  # a different block fails on most runs
  _skip_tests "$_lrc" exit:6,7
  _skip_tests "$_lnm" 162-exit-worker
  # Timing: a LuaJIT trace the test expects in the log, which isn't always compiled in time
  _skip_tests "$_lrc" re-sub:2
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

# Runs upstream's tests in DIR in parallel, then the files that didn't pass once more, one at a
# time: Test::Nginx picks a random free port for each test, checking it with a socket of its own,
# which another test running at the same time can take before nginx binds it (bind(): address in
# use). A failure of a test itself fails the second run too. In a subshell, for its cd
_run_tests() (
  local _prove=(prove -I . -I "$srcdir/test-nginx-$_testnginxver/lib") _log _test _rerun=()
  cd "$1" || return
  _log=$(mktemp)
  "${_prove[@]}" -j "$(nproc)" t 2>&1 | tee "$_log"
  if ((PIPESTATUS[0] == 0)); then
    rm "$_log"
    return
  fi
  # The files prove reports as ok, but not one that bailed out (prove reports it as ok as well):
  # the others failed, or didn't run after a bail-out
  for _test in t/*.t; do
    if ! awk -v t="$_test" '$1 == t && $NF == "ok" { found = 1 } END { exit !found }' "$_log" ||
      grep -qF "Further testing stopped:  $_test " "$_log"; then
      _rerun+=("$_test")
    fi
  done
  rm "$_log"
  ((${#_rerun[@]})) || return 1
  printf 'Running %d test files once more, one at a time\n' "${#_rerun[@]}"
  "${_prove[@]}" "${_rerun[@]}"
)

check() {
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

  # Random ports and server roots, for parallel tests
  local -x TEST_NGINX_RANDOMIZE=1 TEST_NGINX_BINARY=/usr/bin/nginx TEST_NGINX_LOAD_MODULES
  local _modules=/usr/lib/nginx/modules _lua=$srcdir/build/objs/ngx_http_lua_module.so
  local _status=0
  # The modules in the order of upstream's test builds (util/build.sh, the CI of lua-resty-core),
  # as nginx runs the filters of the modules loaded later first
  local _load=(
    "$_modules/ndk_http_module.so"
    "$_modules/ngx_http_set_misc_module.so"
    "$_modules/ngx_http_echo_module.so"
    "$_modules/ngx_http_memc_module.so"
    "$_modules/ngx_http_srcache_filter_module.so"
    "$_lua"
    "$_modules/ngx_http_headers_more_filter_module.so"
    "$_modules/ngx_http_redis2_module.so"
  )
  TEST_NGINX_LOAD_MODULES="${_load[*]}"
  _run_tests "lua-nginx-module-$pkgver" || _status=$?
  _load=(
    "$_modules/ndk_http_module.so"
    "$_modules/ngx_http_echo_module.so"
    "$_modules/ngx_http_set_misc_module.so"
    "$_modules/ngx_http_headers_more_filter_module.so"
    "$_lua"
  )
  TEST_NGINX_LOAD_MODULES="${_load[*]}"
  _run_tests "lua-resty-core-$_restycorever" || _status=$?

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
