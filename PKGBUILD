# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rowsafe
pkgver=0.10.26
pkgrel=1
_repo=rowsafe
_tag=v0.10.26
_srcdir="$_repo-$pkgver"
pkgdesc="Open-source PostgreSQL tooling for backups, restore testing, health checks and tuning, with an Apache-2.0 CLI, Linux server agent and MCP integration"
arch=('x86_64')
url="https://rowsafe.sh"
license=('Apache-2.0')
depends=('glibc' 'postgresql')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rowsafe/rowsafe/archive/refs/tags/$_tag.tar.gz")
sha256sums=('be479b43a69fe188a9597b447aa7928775068938e65f7618b37c8224c5792a3c')

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid=" -o build/rowsafe ./cmd/rowsafe
	go build -trimpath -buildmode=pie -ldflags "-buildid=" -o build/rowsafe-agent ./cmd/rowsafe-agent
}

package() {
	cd "$_srcdir"
	install -Dm755 build/rowsafe "$pkgdir/usr/bin/rowsafe"
	install -Dm755 build/rowsafe-agent "$pkgdir/usr/bin/rowsafe-agent"
	install -d "$pkgdir/usr/share/$pkgname/deploy"
	cp -r deploy/* "$pkgdir/usr/share/$pkgname/deploy/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
