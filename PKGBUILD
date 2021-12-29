# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gregory G Danielson III <gregdan3@protonmail.com>

## GPG key is available for download from upstream's repo

pkgname=doppler-cli
pkgver=3.37.0
pkgrel=1
pkgdesc="CLI utility for Doppler, environment and secrets manager"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
url='https://github.com/dopplerhq/cli'
depends=('glibc')
makedepends=('go')
source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/doppler_${pkgver}_src.tar.gz"
  "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/$pkgver/doppler_${pkgver}_src.tar.gz.sig")
sha256sums=('3d57bd1db451557f8479883e3aae452cb8b08bd52b66ab1a8397b1771ca66f63'
            'SKIP')
validpgpkeys=('B70BD7FCA460C4A3D0EEB965D3D593D50EE79DEC')

prepare() {
	mkdir -p build
	## remove self-update functionality
	sed -i '/rootCmd.AddCommand/d' pkg/cmd/update.go
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o build -ldflags="-linkmode=external -X github.com/DopplerHQ/cli/pkg/version.ProgramVersion=$pkgver"
	build/cli completion bash > build/doppler.bash
	build/cli completion zsh > build/_doppler
	build/cli completion fish > build/doppler.fish
}

check() {
	go test ./...
}

package() {
	install -D build/cli "$pkgdir/usr/bin/doppler"
	install -Dm644 build/doppler.bash "$pkgdir/usr/share/bash-completion/completions/doppler"
	install -Dm644 build/_doppler -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm644 build/doppler.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
