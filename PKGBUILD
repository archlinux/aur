# Maintainer: Ivan Nebotov <i.nebotov@gdllc.dev>

pkgname=trc-git
_pkgname=trc
pkgver=0.3.2.r0.g42ab279
pkgrel=1
pkgdesc='Yandex Tracker CLI (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/GoldenDeals/trc'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	mkdir -p build completions
	go mod download
}

build() {
	cd "$_pkgname"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"

	go build -o build/$_pkgname ./cmd/trc

	local shell
	for shell in bash zsh fish; do
		TRACKER_TOKEN=x X_ORG_ID=x X_CLOUD_ORG_ID=x \
			build/$_pkgname completion "$shell" >"completions/$shell"
	done
}

package() {
	cd "$_pkgname"

	install -Dm755 build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 config/configexample.yaml \
		"$pkgdir/usr/share/doc/$pkgname/configexample.yaml"

	install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
