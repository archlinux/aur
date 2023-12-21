# Maintainer: ml <ml-aur@ransomware.download>
pkgname=vacuum
pkgver=0.6.3
pkgrel=1
pkgdesc='fast, lightweight OpenAPI linter and quality checking tool'
arch=('aarch64' 'i686' 'x86_64')
url=https://quobix.com/vacuum/
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/daveshanley/vacuum/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('21add5f7398fbaff90d553c55095690f489c593c509b2ad7ceec44e6566ea0c2')

build() {
	_commit=$(bsdcat "$pkgname"-"$pkgver".tar.gz | git get-tar-commit-id)
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=1
	export CGO_LDFLAGS=$LDFLAGS
	export CGO_CFLAGS=$CFLAGS
	export CGO_CPPFLAGS=$CPPFLAGS
	export CGO_CXXFLAGS=$CXXFLAGS
	export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
	TZ=UTC printf -v _date '%(%FT%TZ)T' "$SOURCE_DATE_EPOCH"
	go build -ldflags "-linkmode=external \
    -X main.version=$pkgver -X main.commit=$_commit -X 'main.date=$_date'"

	./"$pkgname" completion bash >completion.bash
	./"$pkgname" completion fish >completion.fish
	./"$pkgname" completion zsh >completion.zsh
}

check() {
  cd "$pkgname-$pkgver"
  go test -ldflags "-linkmode=external" ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
	install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
	install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
	install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
