# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## GPG Keys: 784DF7A14968C5094E16839C904FC49417B44DCD
## Get from the Ubuntu keyserver
## gpg --keyserver keyserver.ubuntu.com --recv-keys 784DF7A14968C5094E16839C904FC49417B44DCD

pkgname=hilbish
pkgver=2.1.2
pkgrel=1
_commit=5541e22
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('lua-lunacolors' 'lua-succulent' 'lua-inspect')
makedepends=('git' 'go')
install="$pkgname.install"
options=('!emptydirs')
changelog=CHANGELOG.md
# source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD') ## sammyette

prepare() {
	cd "$pkgname"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -ldflags "-linkmode=external -X main.dataDir=/usr/share/hilbish"
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	## do not use the taskfile, install everything manually
	cd "$pkgname"
	install -Dv "$pkgname" -t "$pkgdir/usr/bin/"
	install -dv "$pkgdir/usr/share/hilbish/"
	cp -av libs docs emmyLuaDocs nature .hilbishrc.lua "$pkgdir/usr/share/hilbish/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
