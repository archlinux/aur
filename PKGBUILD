pkgname=matrix-media-repo
pkgver=1.3.4
_tag=4fc0d96c8311f5c9d7af54303c0acdf223b4be1e
pkgrel=2
pkgdesc="Highly configurable multi-domain media repository for Matrix."
arch=("any")
url="https://github.com/t2bot/matrix-media-repo"
license=("MIT")
depends=("glibc" "libheif" "libde265")
makedepends=("go" "git")
backup=()
provides=("matrix-media-repo")
source=("git+https://github.com/t2bot/matrix-media-repo.git#tag=${_tag}")
sha256sums=('SKIP')

function pkgver() {
	cd "${srcdir}/matrix-media-repo"
	git describe --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/matrix-media-repo"
}

function build() {
	cd "${srcdir}/matrix-media-repo"
	GOBIN=$PWD/bin go install -v ./cmd/utilities/compile_assets
	$PWD/bin/compile_assets
	GOBIN=$PWD/bin go \
		install \
		-ldflags \
		"-X github.com/t2bot/matrix-media-repo/common/version.Version=$(git describe --tags)" \
		./cmd/...
	GOBIN=$PWD/bin go \
		install \
		-pgo=pgo_media_repo.pprof \
		-ldflags \
		"-X github.com/t2bot/matrix-media-repo/common/version.Version=$(git describe --tags)" \
		./cmd/workers/media_repo
}

function check() {
	cd "${srcdir}/matrix-media-repo"
	go test ./...
}

function package() {
	mkdir -p "${pkgdir}/usr/lib/matrix-media-repo"
	cp "${srcdir}/matrix-media-repo/bin"/* "${pkgdir}/usr/lib/matrix-media-repo"
	chmod 755 -R "${pkgdir}/usr/lib/matrix-media-repo"
}
