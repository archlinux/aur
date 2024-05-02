# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui
pkgver=0.6.2
pkgrel=8
pkgdesc="Web user interface to manage your WireGuard setup"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/ngoduykhanh/$pkgname"
license=(MIT)
depends=(
  glibc
  wireguard-tools
)
makedepends=(
  go
  npm
  yarn
)
options=(!debug)
backup=(usr/bin/wgiptables)
install=$pkgname.install
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname.service
  99-wg.conf
  wgui.path
  wgui.service
  wgiptables.sh
  001.patch::$url/commit/73108f7f21904a7afe0cc1829f1b80d84fb04555.patch # Fix updateSearchList js error (#524)
  002.patch::$url/commit/ecea82d1724359cd7a1b554bdd87b68da449fd16.patch # Support for notes about clients (#527)
  003.patch::$url/commit/7856ce9555a4c6bfba63029947f1e03a7505c70f.patch # Status page: display peers IPs only to admins (#521)
  004.patch::$url/commit/1aa6bf3b9e0258ccc707b797de3cfb7f5b9deeb8.patch # Case-insensitive search by notes; display notes on the client card (#532)
  005.patch::$url/commit/32339d5d5a606874257589d74664f76f2cd60d89.patch # Cache user crc32 on db init (fix for #523) (#534)
  006.patch::$url/commit/2fdafd34ca6c8f7f1415a3a1d89498bb575a7171.patch # Fix dependencies (#535)
)
b2sums=(
  '78b972b802bdc9da33a3cd17682dc435b4855a4eef06b1b60b0919e8dfb098c31bf677483b4923e847017481963f30a2067495200034afabf8bf43a7a29739de'
  '89d9e0ccc55a2b01b7625ddc7da70a260960c77e1fc2c876cd92934e41bb59bef2097af56813ab8cad1f8db7dc596fd5500f324722b626abeb4a8fa4b303a703'
  '9c018527a70120edbf2bd70279e61c1f257158e70f7c74d73ed74ec449b02538bae2ccacb722106eb66002e8704d51ffc279052f3e590691102d6577db346923'
  'd7ea6f2c405abd6b2a07e6c216387e8eb085476899e8bf6101cbed41115934816d0362e2030e3165b481314d65b88adcc5bd4928071e34ceb602fa45ffe1db4d'
  'f7045f01d73757129cc98675d7fa87b477b780548fe2d72562c2aef33bdfb87c661fd6306c6e55a1d757f9c920bbcdc80f38f32b2a38df7029e5413ddc0b03aa'
  'a71cb02226b039b569cf22e7f1be6a9b5ec3cf096128b3a091141ca15192c59ef2c7f4989d04532ccdf6df1ce5f59ed1d4026a069793c343dd208332ee2f744a'
  'f4e0cd01dfdfea94f85d21d8013cb101378ee47530948477407f3241880e58e6b74280954b1920c6ce8534306d77771125c1faf702ace5bc101f155fe8157d5f'
  '853d21715630ba3102053d22df7b72bdd6d87321a2ffa49b4ef2014c251de27fce6e99ac8f7c962d6e6c217e76ed6675532a07d7198d2c094fefdd7872b9799c'
  'e5793986448babe01f7a6c2195cad99b700162d365c095c3dd459d149c21ffe1b1af3d38edeb123d6f9e0c1fafb68f765c855504e94237f3c35a076936ef8565'
  '1bf448c50b9357b3ba3109b669f18be0e5d96e76818b9912e2e38c533913168d54a6c945213d2631f2c6ede6c786f5e8669ece489855dd4b0322189d549a93ef'
  'd7b30e6df921984a26e5e3c6b8ca36e80ae61607fafe500cc6e8b8cfb7b19d1d1e458c603628fe88804d8209832c1250517b0d39657f0571a96db2b361c3ab1a'
  '8e0cac0e0211d7e39b3b87eba9d10f2afed96ecbe647446b66720ba8c02c0db740d327fabf45a1c70ed3ffd1e8612623489dc844712096071c724c2241c0819a'
)

prepare() {
  cd $pkgname-$pkgver
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  export NPM_CONFIG_USERCONFIG="$srcdir"/.npmrc
  export NPM_CONFIG_CACHE="$srcdir"/npm_cache
  export YARN_CACHE_FOLDER="$srcdir"/yarn_cache
  ./prepare_assets.sh
}

build() {
  cd $pkgname-$pkgver
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
  install -vDm644 99-wg.conf                -t "$pkgdir"/etc/sysctl.d/
  install -vDm755 $pkgname-$pkgver/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm755 wgiptables.sh                "$pkgdir"/usr/bin/wgiptables
  install -vDm644 $pkgname.service          -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 wgui.{path,service}       -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 $pkgname-$pkgver/LICENSE  -t "$pkgdir"/usr/share/licenses/$pkgname/
}
