# Maintainer: Vladimir Magyar <vladimir at mgyar dot me>

pkgname=photon-rss-git
pkgver=r54.e85a2d4
pkgrel=1
pkgdesc="RSS reader as light as a photon with terminal + sixel frontend"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://git.sr.ht/~ghost08/photon"
license=("GPL3")
depends=('glibc')
makedepends=('git' 'go')
optdepends=(
	"yt-dlp: A youtube-dl fork with additional features and fixes"
	"mpv: a free, open source, and cross-platform media player"
	"imv: Image viewer for Wayland and X11",
	"w3m: Text-based Web browser as well as pager"
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -Dm 755 photon -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
