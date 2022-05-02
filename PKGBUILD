# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jonah <me@jon4hz.io>

pkgname=deadshot
pkgver=0.0.6
pkgrel=1
pkgdesc='terminal based trading bot'
url='https://github.com/jon4hz/deadshot'
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2cb0e0111fa2d9ba8eb29cc7617f9beff48657f0f3a949622f49de4c07baa79f')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build/deadshot cmd/deadshot/main.go
	# ./build/deadshot man > deadshot.1
	./build/deadshot completion bash > deadshot.bash
	./build/deadshot completion zsh > deadshot.zsh
	./build/deadshot completion fish > deadshot.fish
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/deadshot -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	# completions
	install -Dm644 deadshot.bash "$pkgdir/usr/share/bash-completion/completions/deadshot"
	install -Dm644 deadshot.zsh "$pkgdir/usr/share/zsh/site-functions/_deadshot"
	install -Dm644 deadshot.fish "$pkgdir/usr/share/fish/vendor_completions.d/deadshot.fish"
	# man pages
	# install -Dm644 deadshot.1 "$pkgdir/usr/share/man/man1/deadshot.1"
}
