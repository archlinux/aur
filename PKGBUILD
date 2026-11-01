# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui
pkgver=3.11.0
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
makedepends=(
  go
  npm
)
optdepends=(
  '3x-ui-mtg-multi-core: MTproto support'
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'postgresql: recommended for high client counts or multi-node setups'
  'openldap: LDAP integration'
  'openssh: SSH Port Forwarding Management'
  'speedtest-cli: Speedtest by Ookla'
  'ufw: Firewall Management'
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('ca4545497eb6aca9a988334068c2ef47f0f58fb4417be1303e7765f614b1176d860bfc6644c7ee21fa169f663dbbb15f62acf1cda9cc7c7f78e7051a72d53ce0')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|:=/usr/local|:=/usr/lib|;s|:=/etc|:=/usr/lib|'                                   ${pkgname:1}.sh
  sed -i 's|&& legacy_version\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g' ${pkgname:1}.sh
  sed -i 's|&& uninstall\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g'      ${pkgname:1}.sh
  sed -i 's|&& update_menu|\&\& echo "Please use AUR helper for this function"|'             ${pkgname:1}.sh
  sed -i 's|&& update 0$|\&\& echo "Please use AUR helper for this function"|'               ${pkgname:1}.sh
  sed -i 's|&& update$|\&\& echo "Please use AUR helper for this function"|'                 ${pkgname:1}.sh

  sed -i 's|=/usr/local|=/usr/lib|'                                                          ${pkgname:1:4}.service.arch
  sed -i '/^ReadWritePaths=/s|$| -/usr/lib/x-ui|'                                            ${pkgname:1:4}.service.arch

  cd frontend
  npm ci
  npm run build
}

build() {
  cd $pkgname-$pkgver
  export GOCACHE="$srcdir"/go-build
  export GOPATH="$srcdir"/go
  export TMPDIR="$srcdir"
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
  install -vDm 755 ${pkgname:1}.sh           "$pkgdir"/usr/bin/${pkgname:1}
  install -vDm 755 build/$pkgname            "$pkgdir"/usr/lib/${pkgname:1}/${pkgname:1}
  install -vDm 644 ${pkgname:1}.service.arch "$pkgdir"/usr/lib/systemd/system/${pkgname:1}.service
}
