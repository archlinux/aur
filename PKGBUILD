# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-git
pkgver=v1.9.1
pkgrel=1
epoch=
pkgdesc="Command line utility for container images"
arch=("x86_64" "aarch64")
url="https://github.com/cnrancher/hangar"
license=("Apache-2.0")
conflicts=("hangar" "hangar-bin" "hangar-debug" "hangar-bin-debug")
depends=(
    "gpgme"
    "device-mapper"
    "containers-common"
)
makedepends=(
    "make"
    "go"
    "git"
    "btrfs-progs"
    "goreleaser"
)
provides=()
source=("git+$url")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/hangar"
    go mod tidy && go mod verify
}

build() {
    cd "${srcdir}/hangar"
    make build
}

package() {
    cd ${srcdir}
    install -Dm644 "${srcdir}/hangar/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ARCH="$([[  $(uname -m) = x86_64 ]] && echo amd64 || echo arm64)"
    cd ${srcdir}/hangar/dist/hangar_linux_$ARCH*/
    install -Dm755 "hangar" "${pkgdir}/usr/bin/hangar"
}
