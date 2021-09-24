# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Gregory G Danielson III <gregdan3@protonmail.com>

pkgname=doppler-cli
pkgver=3.32.0
pkgrel=1
pkgdesc="CLI utility for Doppler, environment and secrets manager."
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
url='https://doppler.com'
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dopplerhq/cli/archive/$pkgver.tar.gz")
sha256sums=('2f9912096dd6f9dfb427b4a9d26de207a57a1a2e611a1afbc86824499410b778')

prepare() {
	mkdir -p "cli-$pkgver/build"
	## remove self-update functionality
	sed -i '/rootCmd.AddCommand/d' pkg/cmd/update.go
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "cli-$pkgver"
	go build -o build -ldflags="-linkmode=external -X github.com/DopplerHQ/cli/pkg/version.ProgramVersion=$pkgver"
	build/cli completion bash > build/doppler.bash
	build/cli completion zsh > build/_doppler
	build/cli completion fish > build/doppler.fish
}

check() {
	cd "cli-$pkgver"
	go test ./...
}

package() {
	cd "cli-$pkgver"
	install -D build/cli "$pkgdir/usr/bin/doppler"
	install -Dm 644 build/doppler.bash "$pkgdir/usr/share/bash-completion/completions/doppler"
	install -Dm 644 build/_doppler -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm 644 build/doppler.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
