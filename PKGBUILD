# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=boxesandglue-glu
pkgver=0.0.31
pkgrel=1
pkgdesc='a command line interface for boxes and glue using Lua scripting'
arch=(x86_64)
url='https://github.com/boxesandglue/glu'
license=(MIT)
depends=(glibc) # libc.so
makedepends=(go)
_archive="${pkgname#*-}-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('092a6021043d7409b0997eaa5751d41c014d8eafaff3f0a69447d1bbe9e1a272')

prepare() {
	cd "$_archive"
	mkdir -p build
}

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X main.Version=$pkgver -extldflags \"$LDFLAGS\"" \
		-o build \
		./...
}

_compgen() {
	cd "$_archive"
	./build/glu completion $1
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" build/glu
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm0644 <(_compgen bash) "$pkgdir/usr/share/bash-completion/completions/glu"
	install -Dm0644 <(_compgen fish) "$pkgdir/usr/share/fish/vendor_completions.d/glu.fish"
	install -Dm0644 <(_compgen zsh)  "$pkgdir/usr/share/zsh/site-functions/_glu"
}
