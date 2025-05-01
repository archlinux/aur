# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname='lnd'
pkgver=0.18.5_beta
_pkgver="${pkgver//_/-}"
pkgrel=3
pkgdesc='The Lightning Network Daemon, for secure off-chain bitcoin transactions.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/lightningnetwork/lnd'
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('lnd' 'lncli')
conflicts=('lnd-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lightningnetwork/lnd/archive/v${_pkgver}.tar.gz")
sha512sums=('19d6c5b4b5afa507e9e2139d8f5e249e65feda96f8627ffcc7c3828c136ff8af33425a30b06bb1456df0a5d68670aa29c5866b53ce3eb8f4ec94ba0712bb047d')

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
  GO111MODULE=on go install -v -tags experimental,autopilotrpc,signrpc,walletrpc,chainrpc,invoicesrpc,routerrpc,watchtowerrpc,monitoring,peersrpc,kvdb_postgres,kvdb_sqlite,kvdb_etcd ./...
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
