pkgname=matrix-media-repo
pkgver=1.3.7
pkgrel=1
pkgdesc="Highly configurable multi-domain media repository for Matrix."
arch=("any")
url="https://github.com/t2bot/matrix-media-repo"
license=("MIT")
depends=("glibc" "libheif" "libde265" "imagemagick")
makedepends=("go" "git")
backup=()
provides=("matrix-media-repo")
source=("git+https://github.com/t2bot/matrix-media-repo.git#tag=v${pkgver}" "matrix-media-repo.service")
sha256sums=("SKIP" "SKIP")

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

function package() {
	mkdir -p "${pkgdir}/usr/lib/matrix-media-repo"
	cp "${srcdir}/matrix-media-repo/bin"/* "${pkgdir}/usr/lib/matrix-media-repo"
	chmod 755 -R "${pkgdir}/usr/lib/matrix-media-repo"
	install -Dm644 "${srcdir}/matrix-media-repo.service" "${pkgdir}/usr/lib/systemd/system/matrix-media-repo.service"
	echo "Home directory for Matrix Media Repo is at: /var/lib/matrix-media-repo"
	echo "Configure MMR in /etc/matrix-media-repo.yaml"
	install -d "${pkgdir}/etc"
	touch "${pkgdir}/etc/matrix-media-repo.yaml"
}
