# Maintainer: Mohannad Ahmed <mohannadabdo21@hotmail.com>
pkgname=cpumon
pkgver=0.2.11
pkgrel=1
pkgdesc='Real-time CPU monitoring for Linux - temperatures, frequencies, throttling, and fan status'
arch=('x86_64' 'aarch64')
url='https://github.com/Mohabdo21/cpumon'
license=('MIT')
makedepends=('go' 'git')
depends=('libcap')
install=cpumon.install
source=("$pkgname::git+https://github.com/Mohabdo21/cpumon.git#tag=v$pkgver")
sha256sums=('214aaaa926847df0098b1204aec6e0a47445a9c411811c4bcbf9f09fd486d928')

build() {
	cd "$pkgname"
	export CGO_ENABLED=0
	export GOAMD64=v3
	export GOFLAGS='-buildmode=pie'
	commit=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
	go build -trimpath -ldflags="-s -w -X main.version=$pkgver -X main.commit=$commit" -o "$pkgname" .
}

package() {
	cd "$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
