# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=jsonnet-bundler-git
pkgver=r25.c28ae90
pkgrel=1
pkgdesc="Jsonnet package manager (jb)"
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
arch=('x86_64')
optdepends=(
  'jsonnet: to be able to actually render the jsonnet packages you download'
)
makedepends=('git' 'go')
source=("git+https://github.com/jsonnet-bundler/jsonnet-bundler.git")
md5sums=('SKIP')

function pkgver() {
	cd "$srcdir/src/github.com/jsonnet-bundler/jsonnet-bundler"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "$srcdir/src"
	mkdir -p "$srcdir/src/github.com/jsonnet-bundler"
	mv -T "$srcdir/jsonnet-bundler" "$srcdir/src/github.com/jsonnet-bundler/jsonnet-bundler"
}

build() {
	export GOPATH="$srcdir"
	cd "$GOPATH/src/github.com/jsonnet-bundler/jsonnet-bundler"
	mkdir -p "$GOPATH/bin"
	make build install
}

package() {
	install -Dm755 "$srcdir/bin/jb" -t "$pkgdir/usr/bin"
}
