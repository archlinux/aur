# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=keploy
pkgver=3.6.162
pkgrel=1
_tag=v$pkgver
_srcdir="keploy-$pkgver"
pkgdesc="Record real API traffic and replay it as regression tests with auto-generated dependency mocks"
arch=('x86_64')
url="https://keploy.io"
license=('Apache-2.0')
depends=('glibc')
optdepends=('docker: ejecutar aplicaciones en contenedores' 'bpf: instrumentación EBPF para mocks')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keploy/keploy/archive/refs/tags/$_tag.tar.gz")
sha256sums=('e7b769413d5127266c1cd4eb0c0931dfb1615d6869afed524f7d5b7ebea13233')

prepare() {
	cd "$_srcdir"
	go mod download
}

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid= -X main.version=$pkgver" -o build/keploy .
}

check() {
	cd "$_srcdir"
	# Se excluyen paquetes que dependen de docker/temporizadores/red del entorno
	# (pkg/platform/http y pkg/service/replay fallan o se cuelgan en el sandbox) y los e2e.
	local -a pkgs
	mapfile -t pkgs < <(go list ./... | grep -v -E '/pkg/platform/http$|/pkg/service/replay$|/tests/e2e')
	go test -short "${pkgs[@]}"
}

package() {
	cd "$_srcdir"
	install -Dm755 build/keploy "$pkgdir/usr/bin/keploy"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
