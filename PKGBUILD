# Maintainer: Stephanie Wilde-Hobbs <git@stephanie.is>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: SanskritFritz (gmail)

pkgname=netdata-git
_gitname=netdata
pkgver=v1.40.0.r101.g9a5a59885
pkgrel=1
pkgdesc="Real-time performance monitoring, in the greatest possible detail, over the web"
url="https://github.com/netdata/netdata/wiki"
arch=('x86_64')
license=('GPL')
backup=('etc/netdata/netdata.conf')
depends=('libmnl' 'libnetfilter_acct' 'zlib' 'judy' 'libuv' 'json-c' 'libcap' 'lz4' 'openssl' 'which' 'snappy' 'protobuf'
         'libwebsockets' 'mongo-c-driver' 'libyaml')
makedepends=('cups' 'git')
optdepends=('nodejs: for monitoring named and SNMP devices'
            'lm_sensors: for monitoring hardware sensors'
            'iproute2: for monitoring Linux QoS'
            'python: for most of the external plugins'
            'python-psycopg2: for monitoring PostgreSQL databases'
            'python-mysqlclient: for monitoring MySQL/MariaDB databases'
            'python-requests: for monitoring elasticsearch'
            'hddtemp: for monitoring hhd temperature'
            'fping: for for fping module'
            'apcupsd: for monitoring APC UPS'
            'cups: for CUPS plugin'
            'iw: for monitoring Linux as access point')
source=("$_gitname::git+https://github.com/netdata/netdata"
        "submodule-mqtt_websockets::git+https://github.com/underhood/mqtt_websockets.git"
        "submodule-c-rbuf::git+https://github.com/underhood/c-rbuf.git"
        "submodule-c_rhash::git+https://github.com/underhood/c_rhash.git"
        "submodule-aclk-schemas::git+https://github.com/netdata/aclk-schemas.git"
        "submodule-h2o::git+https://github.com/h2o/h2o.git"
        "${_gitname}.sysusers")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a910809a823ba58ca7bdaa72e8d68427b48f452c1fbb2343fa182ecb0a091a7640e73af24b8ba2fdd90e00aed8ef53b7fccd25cb8f04ca9b9fa6c8e52223ca66')
provides=('netdata')
conflicts=('netdata')
install="$_gitname.install"

prepare() {
  cd "$_gitname"
  git submodule set-url mqtt_websockets "$srcdir"/submodule-mqtt_websockets
  git submodule set-url aclk/aclk-schemas "$srcdir"/submodule-aclk-schemas
  git submodule set-url web/server/h2o/libh2o "$srcdir"/submodule-h2o
  git -c protocol.file.allow=always submodule update --init --no-fetch mqtt_websockets aclk/aclk-schemas web/server/h2o/libh2o

  git -C mqtt_websockets submodule set-url c-rbuf "$srcdir"/submodule-c-rbuf
  git -C mqtt_websockets submodule set-url c_rhash "$srcdir"/submodule-c_rhash
  git -c protocol.file.allow=always -C mqtt_websockets submodule update --init --no-fetch c-rbuf c_rhash

  sed -e 's|\# AX_CXX_COMPILE_STDCXX(17, noext, optional)|AX_CXX_COMPILE_STDCXX(17, noext, optional)|' -i configure.ac
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  autoreconf -ivf

  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --libexecdir="/usr/lib" \
    --localstatedir="/var" \
    --with-zlib --with-math --with-user=netdata
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install

  install -Dm644 system/netdata.conf "$pkgdir"/etc/netdata/netdata.conf
  chown -R 0:134 "$pkgdir"/usr/share/netdata/web

  install -Dm0644 "system/systemd/netdata.service.v235" "$pkgdir/usr/lib/systemd/system/netdata.service"
  install -Dm0644 "system/logrotate/netdata" "$pkgdir/etc/logrotate.d/netdata"
  install -Dm0644 "${srcdir}/${_gitname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_gitname}.conf"
}
