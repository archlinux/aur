# Maintainer: aksr <aksr at t-com dot me>
pkgname=torrent-git
pkgver=1.26.1.r767.g8c267645
pkgrel=1
pkgdesc="Full-featured BitTorrent client package and utilities"
arch=('i686' 'x86_64')
url="https://github.com/anacrolix/torrent"
license=('MPL')
makedepends=('git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe | cut -c2- | sed 's!-!.r!' | tr - .)"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	
	cd "$srcdir/${pkgname}"
	[[ -d build ]] || mkdir build
	go build -o build ./...

}

package() {
	cd "$srcdir/${pkgname}/build"
	for i in *; do
		install -Dm755 $i "$pkgdir/usr/bin/$i"
	done
	rm -rf $pkgdir/usr/bin/issue-*
	install -Dm644 ../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
