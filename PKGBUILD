# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui
pkgver=2.8.5
pkgrel=1
pkgdesc="Xray panel supporting multi-protocol multi-user expire day & traffic & IP limit"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/$pkgname"
license=(GPL-3.0-only)
depends=(
  glibc
  sh
  x-ui-xray-core
)
makedepends=(go)
optdepends=(
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'openldap: LDAP integration'
  'openssh: SSH Port Forwarding Management'
  'speedtest-cli: Speedtest by Ookla'
  'ufw: Firewall Management'
)
options=(!debug)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('9408a4cead4d56c8c70217aba031c61accea4ece6de540f590f86c3e3a7889e39636f680588180d2c1d9b535edfea6c9bf99df34d3ecd29a33a5a554ce8c3233')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|/etc/systemd/system/|/usr/lib/systemd/system/|g'                                            ${pkgname:1}.sh
  sed -i -E 's|wget -O ([^ ]+) ?-?N? (https?://[^ ]+)|curl -L -o \1 \2|g'                               ${pkgname:1}.sh
  sed -i -E 's|wget -N (https?://[^ ]+/([^/ ]+))|curl -L -o \2 \1|g'                                    ${pkgname:1}.sh
  sed -i 's|/usr/local/|/usr/lib/|g'                                                                    ${pkgname:1}.sh
  sed -i 's|log_folder="\${XUI_LOG_FOLDER:=/var/log}"|log_folder="\${XUI_LOG_FOLDER:=/var/log/3x-ui}"|' ${pkgname:1}.sh
  sed -i '/Environment="XRAY_VMESS_AEAD_FORCED=false"/a Environment="XUI_LOG_FOLDER=/var/log/3x-ui"'    ${pkgname:1}.service
  sed -i 's|WorkingDirectory=/usr/local/x-ui/|WorkingDirectory=/usr/lib/x-ui/|'                         ${pkgname:1}.service
  sed -i 's|ExecStart=/usr/local/x-ui/x-ui|ExecStart=/usr/lib/x-ui/x-ui|'                               ${pkgname:1}.service
}

build() {
  cd $pkgname-$pkgver
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/$pkgname main.go
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 ${pkgname:1}.sh          "$pkgdir"/usr/bin/${pkgname:1}
  install -vDm 755 build/$pkgname           "$pkgdir"/usr/lib/${pkgname:1}/${pkgname:1}
  install -vDm 644 ${pkgname:1}.service  -t "$pkgdir"/usr/lib/systemd/system/
}
