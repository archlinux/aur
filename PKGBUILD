# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar
pkgver=1.9.1
pkgrel=2
epoch=
pkgdesc="Command line utility for container images"
arch=("x86_64" "aarch64")
url="https://github.com/cnrancher/hangar"
license=("Apache-2.0")
conflicts=("hangar-bin" "hangar-git" "hangar-bin-debug" "hangar-git-debug")
depends=(
    "gpgme"
    "device-mapper"
    "containers-common"
)
makedepends=(
    "go"
    "git"
    "btrfs-progs"
)
provides=()
source=("git+${url}#tag=v${pkgver}")
sha256sums=("SKIP")

prepare() {
    cd "${pkgname}"
    go mod tidy
    go mod verify
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    GO_LDFLAGS="-linkmode external"
    GO_LDFLAGS="${GO_LDFLAGS} -X github.com/cnrancher/hangar/pkg/utils.Version=${pkgver}"
    GO_LDFLAGS="${GO_LDFLAGS} -X github.com/cnrancher/hangar/pkg/utils.GitCommit=$(git rev-parse HEAD)"
    GO_LDFLAGS="${GO_LDFLAGS} -extldflags \"${LDFLAGS}\""

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -tags "containers_image_openpgp exclude_graphdriver_btrfs exclude_graphdriver_devicemapper" \
        -ldflags "${GO_LDFLAGS}" \
        -o ${pkgname} \
        .
}

check() {
    cd "${pkgname}"
    go test ./...
}

package() {
    cd "${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
