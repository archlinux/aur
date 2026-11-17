# Maintainer: Koen Hendriks <aur@koenhendriks.nl>

# publish.sh stamps pkgver from the tag being released and fills in b2sums;
# bump pkgrel here when the recipe changes without a new release.
pkgname=laneway
pkgver=0.23.0
pkgrel=1
pkgdesc='A terminal board for Jira'
arch=('x86_64' 'aarch64')
url='https://github.com/cornedor/laneway'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('445d71986c13c13585078ed62de5d81e062a6b06793bdd7330911f5e3e4dc427db498d666f40a7ef29cbcee24adae5779898fb9b1ff9cc90f746d81357555e0b')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download -modcacherw
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	go build -ldflags "-linkmode=external -X main.version=$pkgver" -o build/laneway .
	local shell
	for shell in bash zsh fish; do
		./build/laneway completion "$shell" >"build/laneway.$shell"
	done
}

check() {
	cd "$pkgname-$pkgver"
	go test -mod=readonly -modcacherw ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/laneway "$pkgdir/usr/bin/laneway"
	install -Dm644 build/laneway.bash "$pkgdir/usr/share/bash-completion/completions/laneway"
	install -Dm644 build/laneway.zsh "$pkgdir/usr/share/zsh/site-functions/_laneway"
	install -Dm644 build/laneway.fish "$pkgdir/usr/share/fish/vendor_completions.d/laneway.fish"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/guide" docs/guide/*.md
}
