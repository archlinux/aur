# Maintainer: sty <pbk at tuta dot io>
pkgname=spotitube-git
pkgver=1.1.1.r20.g0de6d4e
pkgrel=1
pkgdesc="Synchronize your Spotify collections downloading from external providers (Git package)"
arch=(x86_64)
url=https://davidepucci.it/doc/spotitube
license=(LicenseRef-streambinder)
groups=()
depends=(glibc docker bash)
makedepends=(git go)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/streambinder/spotitube"
	"server.sh")
noextract=()
sha256sums=(SKIP
	"4a6da86f3743d72fe8d4f001fd16bff092ab0a51a3be1ad5ff4dc7c507e10ec4")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export LDFLAGS="${LDFLAGS} -lpthread -lutil"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o output-binary .
    echo "All rights reserved" > streambinder
}

package() {
	cd "$srcdir"
	install -Dm0755 server.sh "$pkgdir/usr/bin/spotitube-server"
	cd "$pkgname"
	go install
	install -Dm0755 output-binary "$pkgdir/usr/bin/spotitube"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" streambinder
	echo "Spotitube server has been installed as spotitube-server"
	echo "Check the docs at https://davidepucci.it/doc/spotitube"
	echo "You can create a Spotify API ID/secret pair at https://developer.spotify.com/dashboard/create"
	echo "You can create a Genius API token at https://genius.com/api-clients/new"
}
