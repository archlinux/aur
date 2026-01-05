# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui
pkgver=2.8.7
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
b2sums=('2dbd9b75846da2cf3b58a217400d5fd516a24dff7ed3006f7a709e901f0d9dfcc12be51dc92c208d5a9e3ae7337eb0b021cef9c9c447e99d6311aa78bcca1b1d')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|:=/usr/local|:=/usr/lib|'                                                        ${pkgname:1}.sh
  sed -i 's|:=/etc|:=/usr/lib|'                                                              ${pkgname:1}.sh
  sed -i 's|&& legacy_version\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g' ${pkgname:1}.sh
  sed -i 's|&& uninstall\( 0\)\?|\&\& echo "Please use AUR helper for this function"|g'      ${pkgname:1}.sh
  sed -i 's|&& update_menu|\&\& echo "Please use AUR helper for this function"|'             ${pkgname:1}.sh
  sed -i 's|&& update 0$|\&\& echo "Please use AUR helper for this function"|'               ${pkgname:1}.sh
  sed -i 's|&& update$|\&\& echo "Please use AUR helper for this function"|'                 ${pkgname:1}.sh

  sed -i 's|EnvironmentFile=-/etc/default/x-ui|EnvironmentFile=-/etc/x-ui/x-ui.env|'         ${pkgname:1}.service.debian
  sed -i 's|WorkingDirectory=/usr/local/x-ui/|WorkingDirectory=/usr/lib/x-ui/|'              ${pkgname:1}.service.debian
  sed -i 's|ExecStart=/usr/local/x-ui/x-ui|ExecStart=/usr/lib/x-ui/x-ui|'                    ${pkgname:1}.service.debian
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
  install -vDm 755 ${pkgname:1}.sh             "$pkgdir"/usr/bin/${pkgname:1}
  install -vDm 755 build/$pkgname              "$pkgdir"/usr/lib/${pkgname:1}/${pkgname:1}
  install -vDm 644 ${pkgname:1}.service.debian "$pkgdir"/usr/lib/systemd/system/${pkgname:1}.service
}
