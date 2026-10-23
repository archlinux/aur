# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-search-git
_pkgname=dux-search
_binname=dsearch
pkgver=2.0.0.r1.g646b0e0
pkgrel=1
pkgdesc='Fast filesystem search service (git)'
arch=('x86_64' 'aarch64')
url="https://github.com/duxlabs-dev/$_pkgname"
license=('MIT')
makedepends=('git' 'go')
provides=("$_binname=$pkgver" "$_pkgname=$pkgver")
conflicts=("$_binname" "$_pkgname" 'dsearch-bin' 'dsearch-git' 'dux-search-bin')
replaces=('dsearch-git')
source=("git+$url.git"
        "dsearch.service")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.1.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	local VERSION BUILD_TIME COMMIT LDFLAGS_GO
	VERSION="$(git describe --tags --always 2>/dev/null || echo dev)"
	BUILD_TIME="$(date -u '+%Y-%m-%d_%H:%M:%S')"
	COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"

	LDFLAGS_GO="-s -w -X main.Version=${VERSION} -X main.buildTime=${BUILD_TIME} -X main.commit=${COMMIT} -linkmode=external"

	GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "${LDFLAGS_GO}" ${GOFLAGS} -o "$_binname" "./cmd/$_binname"
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_binname" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "$srcdir/dsearch.service" "$pkgdir/usr/lib/systemd/user/dsearch.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
