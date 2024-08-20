# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=syncyomi-git
pkgrel=2
pkgver=v1.1.1.r0.g347c5d8
pkgdesc="Synchronization for Tachiyomi manga reading progress and library across multiple devices"
arch=('x86_64')
url="https://github.com/syncyomi/syncyomi"
license=('MIT')
makedepends=('git' 'go' 'pnpm')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('syncyomi::git+https://github.com/syncyomi/syncyomi')
md5sums=('SKIP')
_gourl=github.com/syncyomi/syncyomi

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
	git describe --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}/web"
	pnpm install
	cd "$srcdir/${pkgname%-git}"
	go mod download
}

build() {
	cd "$srcdir/${pkgname%-git}/web"
	pnpm build
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GIT_COMMIT="$(git rev-parse HEAD 2> /dev/null)"
	export GIT_TAG="$(git describe --abbrev=0 --tags)"
	export BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -ldflags "-X main.commit=${GIT_COMMIT} -X main.version=${GIT_TAG} -X main.date=${BUILD_DATE}" -o bin/syncyomi main.go
}

check() {
	cd "$srcdir/${pkgname%-git}"
	go test ./...
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/${pkgname%-git}/bin/syncyomi" "$pkgdir/usr/bin"
}
