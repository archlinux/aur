# Maintainer: Ivan Nebotov <i.nebotov@gdllc.dev>

pkgname=trc
pkgver=0.2
pkgrel=1
pkgdesc='Yandex Tracker CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/fgazat/trc'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95c06f8f1b6460f17d6ed3beacc1f92c2b80b5043950f29a9173c4839beb52aa')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build completions
	go mod download
}

build() {
	cd "$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"

	go build -o build/$pkgname .

	local shell
	for shell in bash zsh fish; do
		TRACKER_TOKEN=x X_ORG_ID=x X_CLOUD_ORG_ID=x \
			build/$pkgname completion "$shell" >"completions/$shell"
	done
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 build/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 config/configexample.yaml \
		"$pkgdir/usr/share/doc/$pkgname/configexample.yaml"

	install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
