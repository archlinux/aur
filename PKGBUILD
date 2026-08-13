# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Roasbeef
# URL: https://github.com/lightningnetwork/lnd
# Upstream: https://github.com/lightningnetwork/lnd

pkgname='lnd-git'
pkgver=0.21.2.beta.rc1.r21141.g8ea98fd
pkgrel=1
pkgdesc='The Lightning Network Daemon, for secure off-chain bitcoin transactions.'
arch=('x86_64')
url='https://github.com/lightningnetwork/lnd'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('lnd' 'lncli')
conflicts=('lnd')
source=("$pkgname::git+https://github.com/lightningnetwork/lnd.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
	printf '%s.r%s.g%s\n' "$(git tag --sort=-v:refname | head -n1 | sed 's/^v//;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
   cd $pkgname
   cd cmd/lnd
   go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags '-extldflags=-Wl,-z,now,-z,relro' -tags="experimental autopilotrpc signrpc walletrpc chainrpc invoicesrpc routerrpc watchtowerrpc neutrinorpc monitoring peersrpc kvdb_postgres kvdb_sqlite kvdb_etcd" .
   cd ../lncli
   go build -trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags '-extldflags=-Wl,-z,now,-z,relro' -tags="experimental autopilotrpc signrpc walletrpc chainrpc invoicesrpc routerrpc watchtowerrpc neutrinorpc monitoring peersrpc kvdb_postgres kvdb_sqlite kvdb_etcd" .
}

package() {
  cd $pkgname
  install -Dm 755 "cmd/lnd/lnd" -t "$pkgdir/usr/bin";
  install -Dm 755 "cmd/lncli/lncli" -t "$pkgdir/usr/bin";
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/lncli.bash-completion "$pkgdir/usr/share/bash-completion/completions/lncli"
  install -Dm644 contrib/init/lnd.service "$pkgdir/usr/lib/systemd/system/lnd.service"
}
