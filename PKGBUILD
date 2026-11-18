# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=gpu-mcp-server
pkgver=0.2.0
pkgrel=1
pkgdesc='MCP server exposing NVIDIA GPU utilization, memory, temperature and power metrics to AI agents'
arch=('x86_64' 'aarch64')
url='https://github.com/pmady/gpu-mcp-server'
license=('Apache-2.0')
# NVML (libnvidia-ml) is loaded at runtime; without it the server exits on start.
depends=('glibc' 'nvidia-utils')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('036a48e9d14e89b31bc6a60e56e03285a8f049114ca34cd0ccb946b306decb6f')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw'
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_ENABLED=1 # upstream's release binary is CGO_ENABLED=0, which compiles out NVML
    # go-nvml calls NVML through lazily bound PLT stubs; libnvidia-ml is only dlopen()ed in
    # nvml.Init(). makepkg's -z now and -fno-plt both force those symbols to resolve at
    # startup, so drop -fno-plt and link with -z lazy (as Arch's nvidia-container-toolkit does).
    local _ldflags="$LDFLAGS -Wl,-z,lazy"
    export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="${CFLAGS//-fno-plt/}" CGO_CXXFLAGS="${CXXFLAGS//-fno-plt/}"
    export CGO_LDFLAGS="$_ldflags"
    # -buildvcs=false: srcdir sits inside the AUR/packaging git checkout, not upstream's repo
    export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
    go build -ldflags "-linkmode=external -extldflags \"$_ldflags\" -X main.version=$pkgver" \
        -o gpu-mcp-server ./cmd/gpu-mcp-server
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 gpu-mcp-server "$pkgdir/usr/bin/gpu-mcp-server"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
