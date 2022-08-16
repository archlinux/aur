# Maintainer: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Joshua Wong <joshuawong AT anticentri DOT st>
pkgname=vcluster
pkgver=0.11.1
pkgrel=1
pkgdesc='Create fully functional virtual Kubernetes clusters'
arch=('x86_64')
url="https://vcluster.com"
license=('Apache')
makedepends=('go')
depends=('glibc')
conflicts=('vcluster-bin')
replaces=('vcluster-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/vcluster/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6e5392cedbf2d7f6c05c02bcd87c32fcecc3f2f350d62aa32e19a24520781676')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
	GOARCH='amd64' GOOS='linux' go build -trimpath -buildmode=pie \
	-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	-o build/$pkgname ./cmd/vclusterctl/main.go
}

check() {
	cd "$pkgname-$pkgver"
	go test ./cmd/vclusterctl/...
}

package() {
	cd "$pkgname-$pkgver"
	build/"$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	build/"$pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm755 build/"$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
