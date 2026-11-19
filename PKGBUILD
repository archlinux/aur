# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: FirstAirBender <noblechuk5 at web dot de>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=crowdsec-nginx-bouncer
pkgver=1.2.4
# lua-cs-bouncer, the Lua half that upstream's release puts together with the nginx configuration:
# the version its Makefile clones (LUA_BOUNCER_BRANCH), which check() compares
_luaver=1.0.19
# Test::Nginx, the test scaffold of lua-cs-bouncer, for check()
_testnginxver=0.32
pkgrel=1
pkgdesc="CrowdSec bouncer for Nginx"
arch=(any)
url="https://github.com/crowdsecurity/cs-nginx-bouncer"
license=(MIT)
replaces=(cs-nginx-bouncer)
provides=(cs-nginx-bouncer)
conflicts=(cs-nginx-bouncer)
# lua-resty-http as a package rather than the copy upstream's release vendors since 1.2.4
# (vendor/lua-resty-http), which isn't installed
depends=(
  crowdsec
  gettext # envsubst in the install script
  lua51-cjson
  lua-resty-http
  lua-resty-string
)
optdepends=('luajit-openresty: OpenResty optimised luajit'
  'nginx-mainline-mod-lua: Support for nginx-mainline'
  'nginx-mod-lua: Support for nginx')
# lua-cs-bouncer's tests, in nginx with the module: Test::Nginx's Perl modules
checkdepends=(
  nginx
  nginx-mod-lua
  openssl
  perl-http-response-encoding
  perl-ipc-run
  perl-libwww
  perl-list-moreutils
  perl-test-base
  perl-test-longstring
  perl-text-diff
  perl-uri
)
backup=(
  etc/nginx/lua/templates/crowdsec/{ban,captcha}.html
  etc/nginx/conf.d/crowdsec_nginx.conf
  etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf
)
install=cs-nginx-bouncer.install
# The sources upstream's release puts together (make release), from their tags: its archive's folder
# is named after the newest tag in git's version order, crowdsec-nginx-bouncer-v1.2.4-rc1 for 1.2.4
source=(
  "cs-nginx-bouncer-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "lua-cs-bouncer-$_luaver.tar.gz::https://github.com/crowdsecurity/lua-cs-bouncer/archive/refs/tags/v$_luaver.tar.gz"
  "test-nginx-$_testnginxver.tar.gz::https://github.com/openresty/test-nginx/archive/refs/tags/v$_testnginxver.tar.gz"
)
sha512sums=('fc87624bf77a2d8464aec9b99184ea501611394bd1a1426583b9b2ddae3e0606e78dabf5c337941e405474065a17a2bc05ef3254822ca2613b8cdf62c1f0a0e2'
  '0ecc7da6a9d56cfdb336b8ef72d8398f54fb500b95fcc96531a9d6639980b98298bf4732c1a001c796f3dc317316fd1236104d57cad08709d775aac399797643'
  'c8ddec5dc21c23ded4ea974f4d6fca01ea498f728e5f8dc87224b1151bf9fcfb1921d971359ee79e3984b23fd6cb2f510259b077f79b867b95a437d28af48b97')
b2sums=('5db2e8ed3192a6a3034f9e698c2f3c7bc2bbb2a23856c5ca4235e69fc90a157b08d7fe12e2d0066f9fafcd08987262b8353fc02f8dff40cd15667e23ec405926'
  '103249ad91499730e7432ef988616795bcddc31d015084714acc7104b5e30b807f61b352c047886f978b48485a21ca4334cfba64de5847981bbefe63a607a114'
  '5b98a9764d2fb322199ecf839feed2d995f4ab3e2c9488eebe698fad00e852c45862b94774232d4d8043e2850018c1699ea055a0da211b88211eddfc26e380ed')

prepare() {
  sed -i 's@var/lib/crowdsec/lua/templates@etc/nginx/lua/templates/crowdsec@' \
    "lua-cs-bouncer-$_luaver/config_example.conf"
  # $prefix see https://openresty-reference.readthedocs.io/en/latest/Directives/#lua_package_path
  # shellcheck disable=SC2016
  sed -i 's@/usr/local/lua/crowdsec/@$prefix/lua/plugins/crowdsec/@' \
    "cs-nginx-bouncer-$pkgver/nginx/crowdsec_nginx.conf"
}

# A certificate of a test CA, NAME-cert.pem and NAME-key.pem in DIR, for SUBJECT, with OPENSSL_X509
# extensions
_test_cert() {
  local _dir=$1 _name=$2 _subject=$3 _extensions=$4
  openssl req -newkey rsa:2048 -nodes -subj "$_subject" -keyout "$_dir/$_name-key.pem" \
    -out "$_dir/$_name.csr"
  openssl x509 -req -in "$_dir/$_name.csr" -CA "$_dir/rootCA.pem" -CAkey "$_dir/rootCA-key.pem" \
    -days 1 -extfile <(printf '%s\n' "$_extensions") -out "$_dir/$_name-cert.pem"
}

check() {
  # The lua-cs-bouncer of upstream's release
  grep -qx "LUA_BOUNCER_BRANCH?=v$_luaver" "cs-nginx-bouncer-$pkgver/Makefile" || exit

  cd "lua-cs-bouncer-$_luaver" || exit
  # The certificates upstream's CI makes with mkcert in /tmp/ca-test, for the mock API with TLS: a
  # CA, the server's for 127.0.0.1, and the bouncer's client certificate. The test trusts the CA
  # itself, as it isn't in the system's store that mkcert installs it into
  local _ca=$srcdir/ca-test
  mkdir -p "$_ca"
  openssl req -x509 -newkey rsa:2048 -nodes -days 1 -subj /CN=test-ca \
    -addext basicConstraints=critical,CA:TRUE -addext keyUsage=critical,keyCertSign,cRLSign \
    -keyout "$_ca/rootCA-key.pem" -out "$_ca/rootCA.pem"
  _test_cert "$_ca" server /CN=localhost \
    $'subjectAltName = DNS:localhost, IP:127.0.0.1\nextendedKeyUsage = serverAuth'
  _test_cert "$_ca" client /CN=bouncer 'extendedKeyUsage = clientAuth'

  # Free ports for the ones the tests take as fixed: the mock API (8081), the mock AppSec (7422,
  # which is CrowdSec's own) and Test::Nginx's server (1984, in the tests' URLs too), as the build
  # shares the host's network. Held together while they're picked, so they differ. And the modules
  # the tests load themselves, from Debian's folder
  local _ports
  _ports=$(perl -MIO::Socket::INET -e 'print join(" ", map { $_->sockport }
    map { IO::Socket::INET->new(Listen => 1) or die "no free port: $!" } 1 .. 3)')
  CA=$_ca PORTS=$_ports perl -pi -e 'BEGIN { @p = split " ", $ENV{PORTS};
    %n = (1984 => $p[0], 8081 => $p[1], 7422 => $p[2]) }
    s/\b(1984|8081|7422)\b/$n{$1}/g; s{/tmp/ca-test}{$ENV{CA}}g;
    s{/etc/ssl/certs/ca-certificates\.crt}{$ENV{CA}/rootCA.pem}g;
    s{/usr/share/nginx/modules/}{/usr/lib/nginx/modules/}g' t/*.t t/conf_t/*

  # One after the other, as upstream's CI runs them: some share their configuration
  local -x TEST_NGINX_BINARY=/usr/bin/nginx TEST_NGINX_SERVER_PORT=${_ports%% *}
  prove -I "$srcdir/test-nginx-$_testnginxver/lib" t
}

package() {
  install -dm755 "$pkgdir"/etc/nginx/lua/plugins/crowdsec/
  install -dm755 "$pkgdir"/etc/nginx/lua/templates/crowdsec/

  install -Dm644 "cs-nginx-bouncer-$pkgver/nginx/crowdsec_nginx.conf" -t "$pkgdir"/etc/nginx/conf.d/
  cd "lua-cs-bouncer-$_luaver" || exit
  cp -R lib/* "$pkgdir"/etc/nginx/lua/plugins/crowdsec/
  cp -R templates/* "$pkgdir"/etc/nginx/lua/templates/crowdsec/
  install -Dm600 config_example.conf "$pkgdir"/etc/crowdsec/bouncers/crowdsec-nginx-bouncer.conf

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
