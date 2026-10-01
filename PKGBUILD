# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname='lnd'
pkgver=0.21.4_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Lightning Network Daemon, for secure off-chain bitcoin transactions.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/lightningnetwork/lnd'
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('lnd' 'lncli')
conflicts=('lnd-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lightningnetwork/lnd/archive/v${_pkgver}.tar.gz")
sha512sums=('d45e0c3ada09c3a26156b0de5c10d3ca6e1903269b207c93b908d81fdaf81e234fbc73e637248e7fe1adeaf0706ee065cb27cc64ff67fe3e13661f47bdfbdf40')

prepare() {
  cd "$pkgname-$_pkgver"
  mkdir -p build/
}

build() {
  # Use suggested GOFLAGS for Arch Linux.
  # https://wiki.archlinux.org/title/Go_package_guidelines
  cd "$pkgname-$_pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  GO111MODULE=on go install -v -tags experimental,autopilotrpc,signrpc,walletrpc,chainrpc,invoicesrpc,routerrpc,watchtowerrpc,neutrinorpc,monitoring,peersrpc,kvdb_postgres,kvdb_sqlite,kvdb_etcd ./...
  go build -o build ./cmd/...
}

package() {
  cd "$pkgname-$_pkgver"
  for _bin in lnd lncli; do
   install -Dm755 build/$_bin -t "${pkgdir:?}/usr/bin";
  done
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/lncli.bash-completion "$pkgdir/usr/share/bash-completion/completions/lncli"
  install -Dm644 contrib/init/lnd.service "$pkgdir/usr/lib/systemd/system/lnd.service"
}
