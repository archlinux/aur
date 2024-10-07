# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten
pkgver=0.2.3
pkgrel=1
pkgdesc="Stay informed without leaving your command line"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/zMoooooritz/${pkgname}"
license=('MIT')
makedepends=('git' 'go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5300b95467497f66109bd409d7e5998345493a185bdcc2e267e99c451603f54f')

build() {
	local commit
	local extraflags
	commit=$(zcat ${pkgname}-${pkgver}.tar.gz | git get-tar-commit-id)
	extraflags="-X main.Version=${pkgver} -X main.CommitSHA=${commit}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$pkgname-$pkgver"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "${extraflags} -extldflags \"${LDFLAGS}\"" \
		-o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "configs/config.yaml" "$pkgdir/usr/share/doc/$pkgname/example_config.yaml"
}
