# Maintainer: László Várady <laszlo.varady@anno.io>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=axosyslog
pkgver=4.16.0
pkgrel=1
pkgdesc="Scalable security data processor"
arch=(x86_64)
url="https://github.com/axoflow/axosyslog"
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  bash
  curl
  gawk
  gcc-libs
  glib2
  glibc
  json-c
  libcap
  libnet
  openssl
  pcre2
  systemd-libs
)
makedepends=(
  autoconf-archive
  bpf
  clang
  docbook-xsl
  git
  gperf
  grpc
  hiredis
  libbpf
  libdbi
  libesmtp
  libmaxminddb
  librabbitmq-c
  librdkafka
  libxslt
  mongo-c-driver
  net-snmp
  protobuf
  python
  python-boto3
  python-botocore
  python-cachetools
  python-certifi
  python-charset-normalizer
  python-dateutil
  python-google-auth
  python-idna
  python-kubernetes
  python-oauthlib
  python-ply
  python-pyasn1
  python-pyasn1-modules
  python-pyyaml
  python-requests
  python-requests-oauthlib
  python-rsa
  python-setuptools
  python-six
  python-tornado
  python-urllib3
  python-websocket-client
  systemd
)
checkdepends=(
  criterion
  python-pytest
  python-pytest-mock
)
optdepends=(
  'grpc: for the gRPC module'
  'hiredis: for the Redis plugin'
  'libbpf: for the eBPF module'
  'libdbi: for the SQL plugin'
  'libesmtp: for the SMTP plugin'
  'libmaxminddb: for the GeoIP2 plugin'
  'librabbitmq-c: for the AMQP plugin'
  'librdkafka: for the Kafka C plugin'
  'logrotate: for rotating log files'
  'mongo-c-driver: for the MongoDB plugin'
  'net-snmp: for the SNMP plugin'
  'protobuf: for the gRPC module'
  'python-boto3: for Python S3 module'
  'python-botocore: for Python S3 module'
  'python-kubernetes: for Python Kubernetes module'
  'python-ply: for debugger CLI'
  'python-requests: for Python hypr module'
  'python-tornado: for Python webhook module'
  'python: for Python-based plugins'
)
conflicts=(syslog-ng eventlog)
replaces=(syslog-ng eventlog)
backup=(
  "etc/syslog-ng/syslog-ng.conf"
  "etc/logrotate.d/syslog-ng"
  "etc/default/syslog-ng@default"
)
options=()
source=(
  "git+$url.git#tag=$pkgname-$pkgver"
  "git+https://github.com/buytenh/ivykis.git"
  "git+https://github.com/open-telemetry/opentelemetry-proto.git"
  "git+https://github.com/Thalhammer/jwt-cpp.git"
  "syslog-ng.logrotate"
  "syslog-ng-systemd-integration.patch"
)
sha256sums=('93499df48d644c47980846eda824c961973bb6adda6b89811895c727368d12e9'
            'SKIP'
            'SKIP'
            'SKIP'
            '93c935eca56854011ea9e353b7a1da662ad40b2e8452954c5b4b5a1d5b2d5317'
            '12e7d38ca2b79aae9417207a7b3a777f8f7646cc23bddfd383a6a6e9b7014d6e')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.lib/ivykis.url "$srcdir/ivykis"
  git config submodule.modules/grpc/protos/opentelemetry-proto.url "$srcdir/opentelemetry-protos"
  git config submodule.modules/cloud-auth/jwt-cpp.url "$srcdir/jwt-cpp"
  git -c protocol.file.allow=always submodule update

  patch -Np1 -i "$srcdir/syslog-ng-systemd-integration.patch"        # Fix paths for systemd integration.

  # Remove tests failing in a chroot but not on host. Not sure why.
  sed -i '/include lib\/secret-storage\/tests\/Makefile.am/d' lib/secret-storage/Makefile.am
  rm -r lib/secret-storage/tests

  ./autogen.sh
}

build() {
  cd $pkgname
  local configure_options=(
    --datadir=/usr/share
    --disable-java
    --disable-java-modules
    --disable-mqtt
    --disable-riemann
    --enable-all-modules
    --enable-ebpf
    --enable-ipv6
    --enable-manpages
    --enable-pacct
    --enable-spoof-source
    --enable-systemd
    --libexecdir=/usr/lib
    --localstatedir="/var/lib/syslog-ng"
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir="/etc/syslog-ng"
    --with-jsonc=system
    --with-pidfile-dir=/run
    --with-python-packages=system
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  )
  ./configure "${configure_options[@]}"

  # Prevent excessive overlinking due to libtool.
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir/etc/default" contrib/systemd/syslog-ng@default
  install -vdm755 "$pkgdir/var/lib/syslog-ng"
  install -vDm644 "$srcdir/syslog-ng.logrotate" "$pkgdir/etc/logrotate.d/syslog-ng"
}
