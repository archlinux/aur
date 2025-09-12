# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-git
pkgver=v1.9.3
pkgrel=1
epoch=
pkgdesc="Command line utility for container images"
arch=("x86_64" "aarch64")
url="https://github.com/cnrancher/hangar"
license=("Apache-2.0")
conflicts=(
    "hangar"
    "hangar-bin"
    "hangar-debug"
    "hangar-bin-debug"
)
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
source=("git+$url")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/hangar"
    go mod tidy
    go mod verify
}

build() {
    cd "${srcdir}/hangar"
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
        -o hangar \
        .

    install -dm755 ./dist/man1
    go run ./docs/main.go ./dist/man1

    install -dm755 ./dist/completions/{bash,zsh,fish}
	./hangar completion bash >| ./dist/completions/bash/hangar
	./hangar completion zsh >| ./dist/completions/zsh/_hangar
	./hangar completion fish >| ./dist/completions/fish/hangar.fish
}

check() {
    cd "${srcdir}/hangar"
    go test ./...
    rm -r ~/.cache/hangar/
}

package() {
    cd "${srcdir}/hangar"
    # Binary
    install -Dm755 "hangar" "${pkgdir}/usr/bin/hangar"
    # Docs
    install -dm755 ${pkgdir}/usr/share/man/man1
	install -Dm644 dist/man1/*.1 ${pkgdir}/usr/share/man/man1
    # Completions
	install -Dm644 dist/completions/bash/hangar ${pkgdir}/usr/share/bash-completion/completions/hangar
	install -Dm644 dist/completions/zsh/_hangar ${pkgdir}/usr/share/zsh/site-functions/_hangar
	install -Dm644 dist/completions/fish/hangar.fish ${pkgdir}/usr/share/fish/vendor_completions.d/hangar.fish
    # LICENSE
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/hangar/LICENSE"
}
