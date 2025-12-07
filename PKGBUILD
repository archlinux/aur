# Maintainer: buckket <felix+arch at buckket dot org>
# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=autorestic
pkgver=1.8.3
pkgrel=3
pkgdesc='Config driven, easy backup cli for restic'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/$pkgname"
license=('Apache-2.0')
depends=('restic')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('fe3d21c522d39b0b98698e8868acfef061ea84668c3c5e5a97d4f377644441318b53d1e1d2d1e90c6ea8ccc6bf181060605619d0f6ed31bf6513abd20d001ca4')

prepare() {
	cd "$pkgname"
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "$pkgname"
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build

	for shell in bash zsh fish; do
		./build/$pkgname completion $shell > "build/${shell}_completion"
	done
}

package() {
	cd "$pkgname"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "build/bash_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "build/zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 "build/fish_completion" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

	install -Dm644 CHANGELOG.md DEVELOPMENT.md README.md -t "$pkgdir/usr/share/doc/$pkgname" 
	cp -r docs/pages "$pkgdir/usr/share/doc/$pkgname"
}
