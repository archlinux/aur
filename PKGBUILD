# Maintainer: Kaz Wilson <me@kazatron.com>
# SPDX-License-Identifier: Apache-2.0

pkgname=anvil
pkgver=0.0.1
pkgrel=1
pkgdesc='Build, sign, and manage Linux kernels for Firecracker and Kata Containers'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Anvil'
license=('Apache-2.0')
depends=('glibc' 'libguestfs')
makedepends=('go')
optdepends=(
    'flex: kernel compilation'
    'bison: kernel compilation'
    'bc: kernel compilation'
    'perl: kernel compilation'
    'xz: kernel compression'
    'libelf: kernel compilation'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/cli-v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "Anvil-cli-v${pkgver}"

    export CGO_ENABLED=1
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    # Build static vsock server (embedded into anvil binary)
    CGO_ENABLED=0 go build -ldflags "-w -s" -trimpath \
        -o build/vsock-server-standalone ./cmd/vsock-server-standalone
    cp build/vsock-server-standalone pkg/firecracker/embedded/vsock-server-standalone

    # Build anvil
    go build \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
                  -X github.com/Work-Fort/Anvil/cmd.Version=${pkgver} \
                  -X github.com/Work-Fort/Anvil/cmd.DisableUpdate=true \
                  -w -s" \
        -o anvil
}

check() {
    cd "Anvil-cli-v${pkgver}"
    go test ./...
}

package() {
    cd "Anvil-cli-v${pkgver}"
    install -Dm755 anvil "${pkgdir}/usr/bin/anvil"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
