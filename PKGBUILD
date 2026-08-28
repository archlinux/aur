# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=boxesandglue-glu
pkgver=0.0.33
pkgrel=1
pkgdesc='a command line interface for boxes and glue using Lua scripting'
arch=(x86_64)
url='https://github.com/boxesandglue/glu'
license=(MIT)
depends=(glibc) # libc.so
makedepends=(go)
_archive="${pkgname#*-}-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('f263519cadab4358ea208f6b16027e0079b01b1e8f9607d8f306c7d5b56c1d37')

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
