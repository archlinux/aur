# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui
pkgver=2.6.6
pkgrel=1
pkgdesc="Xray panel supporting multi-protocol multi-user expire day & traffic & IP limit"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/$pkgname"
license=(GPL-3.0-only)
depends=(
  glibc
  sh
  xray
)
makedepends=(go)
optdepends=(
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'openssh: SSH Port Forwarding Management'
  'speedtest-cli: Speedtest by Ookla'
  'ufw: Firewall Management'
)
options=(!debug)
install=$pkgname.install
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geo{ip,site}.dat
  geoip_IR.dat::https://github.com/chocolate4u/Iran-v2ray-rules/releases/latest/download/geoip.dat
  geosite_IR.dat::https://github.com/chocolate4u/Iran-v2ray-rules/releases/latest/download/geosite.dat
  geoip_RU.dat::https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/latest/download/geoip.dat
  geosite_RU.dat::https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/latest/download/geosite.dat
)
b2sums=('e5247f2683bdf6b2d3f2a78401e7c46744d809b6c099559c72e4ef57fb251ea1fedb386b279a50cbf2d8b43553189151db37da20945f096cd8dd86e8b5d473bf'
        'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOCACHE="$srcdir"/go-build
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${pkgname:1} main.go
}

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|/etc/systemd/system/|/usr/lib/systemd/system/|g'                      ${pkgname:1}.sh
  sed -i 's|/usr/local/x-ui/bin|/usr/share/x-ui/bin|g'                            ${pkgname:1}.sh
  sed -i -E 's|wget -O ([^ ]+) ?-?N? (https?://[^ ]+)|curl -L -o \1 \2|g'         ${pkgname:1}.sh
  sed -i -E 's|wget -N (https?://[^ ]+/([^/ ]+))|curl -L -o \2 \1|g'              ${pkgname:1}.sh
  sed -i 's|/usr/local/|/usr/lib/|g'                                              ${pkgname:1}.sh
  sed -i 's|WorkingDirectory=/usr/local/x-ui/|WorkingDirectory=/usr/share/x-ui/|' ${pkgname:1}.service
  sed -i 's|ExecStart=/usr/local/x-ui/x-ui|ExecStart=/usr/lib/x-ui/x-ui|'         ${pkgname:1}.service
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 ${pkgname:1}.sh                  "$pkgdir"/usr/bin/${pkgname:1}
  install -vDm 755 build/${pkgname:1}            -t "$pkgdir"/usr/lib/${pkgname:1}/
  install -vDm 644 ${pkgname:1}.service          -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm 644 ../geo{ip,site}{,_IR,_RU}.dat -t "$pkgdir"/usr/share/${pkgname:1}/bin/
}
