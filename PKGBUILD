# Maintainer: taotieren <admin@taotieren.com>

pkgname=wireguard-ui
pkgver=0.6.2
pkgrel=11
pkgdesc="Web user interface to manage your WireGuard setup"
arch=($CARCH)
url="https://github.com/ngoduykhanh/$pkgname"
license=(MIT)
depends=(
  glibc
  wireguard-tools
)
makedepends=(
  git
  go
  npm
  yarn
)
options=(!debug)
backup=(usr/bin/wgiptables)
install=$pkgname.install
source=(
  "${pkgname}::git+$url.git#tag=v$pkgver"
  $pkgname.service
  99-wg.conf
  wgui.path
  wgui.service
  wgiptables.sh
)
b2sums=('a27023b174ef3a5f9544e43e35916241c3499234e346d0c838dd6318040d287bec7df1050d07b079d1e2ebd44b4aed7a35ea12540a036e09e7c07e19d541d3e8'
        '89d9e0ccc55a2b01b7625ddc7da70a260960c77e1fc2c876cd92934e41bb59bef2097af56813ab8cad1f8db7dc596fd5500f324722b626abeb4a8fa4b303a703'
        '9c018527a70120edbf2bd70279e61c1f257158e70f7c74d73ed74ec449b02538bae2ccacb722106eb66002e8704d51ffc279052f3e590691102d6577db346923'
        'd7ea6f2c405abd6b2a07e6c216387e8eb085476899e8bf6101cbed41115934816d0362e2030e3165b481314d65b88adcc5bd4928071e34ceb602fa45ffe1db4d'
        'f7045f01d73757129cc98675d7fa87b477b780548fe2d72562c2aef33bdfb87c661fd6306c6e55a1d757f9c920bbcdc80f38f32b2a38df7029e5413ddc0b03aa'
        'a71cb02226b039b569cf22e7f1be6a9b5ec3cf096128b3a091141ca15192c59ef2c7f4989d04532ccdf6df1ce5f59ed1d4026a069793c343dd208332ee2f744a')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgname}"
  # Update wg.conf to print FwMark if it exists (#437)
  git cherry-pick -n 2cdd50b4cba8d7af8858441f6ebd5bfc395240a1
  # Fix updateSearchList js error (#524)
  git cherry-pick -n 73108f7f21904a7afe0cc1829f1b80d84fb04555
  # Support for notes about clients (#527)
  git cherry-pick -n ecea82d1724359cd7a1b554bdd87b68da449fd16
  # Status page: display peers IPs only to admins (#521)
  git cherry-pick -n 7856ce9555a4c6bfba63029947f1e03a7505c70f
  # Case-insensitive search by notes; display notes on the client card (#532)
  git cherry-pick -n 1aa6bf3b9e0258ccc707b797de3cfb7f5b9deeb8
  # Cache user crc32 on db init (fix for #523) (#534)
  git cherry-pick -n 32339d5d5a606874257589d74664f76f2cd60d89
  # Fix dependencies (#535)
  git cherry-pick -n 2fdafd34ca6c8f7f1415a3a1d89498bb575a7171
  # Add chmod of unix socket (#579)
  git cherry-pick -n d33dc40b76ff534ed004da2f9ead65e858585861
  # Add login logging for banning brute force attacks (#653)
  git cherry-pick -n 8b75583a0470035d93320fc14c8d8e7f69e4a61a

  export NPM_CONFIG_USERCONFIG="$srcdir"/.npmrc
  export NPM_CONFIG_CACHE="$srcdir"/npm_cache
  export YARN_CACHE_FOLDER="$srcdir"/yarn_cache
  ./prepare_assets.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS=$CFLAGS
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOCACHE="$srcdir"/go-build
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname
}

package() {
  install -vDm644 99-wg.conf                      -t "$pkgdir"/etc/sysctl.d/
  install -vDm755 "${srcdir}/${pkgname}/$pkgname" -t "$pkgdir"/usr/bin/
  install -vDm755 wgiptables.sh                   "$pkgdir"/usr/bin/wgiptables
  install -vDm644 $pkgname.service                -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 wgui.{path,service}             -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 "${srcdir}/${pkgname}/LICENSE"  -t "$pkgdir"/usr/share/licenses/$pkgname/
}
