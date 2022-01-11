# Maintainer: Vladimir Magyar <vladimir at mgyar dot me>

pkgname=photon-rss-git
_pkgname=photon
pkgver=r67.0047864
pkgrel=1
pkgdesc="RSS reader as light as a photon with terminal + sixel"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://git.sr.ht/~ghost08/photon"
license=("GPL3")
depends=()
makedepends=('git' 'go' 'scdoc')
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
	( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	make PREFIX=/urs
}

check() {
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR=$pkgdir install
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
