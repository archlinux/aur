# Maintainer: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.32.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://vcluster.com"
license=('apache')
makedepends=(
    'go'
)
depends=(
    'glibc'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/vcluster/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    "7c456cd0549a40374e97308a37a41b7fd95ccfe8098a0faac32e9e06562e5f66"
)

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
       -trimpath \
       -buildmode=pie \
       -mod=readonly \
       -modcacherw \
       -ldflags "
        -linkmode=external
        -buildid=''
        -extldflags '${LDFLAGS}'" \
       -o build/$pkgname ./cmd/vclusterctl/main.go
}

check() {
    cd "$pkgname-$pkgver"
    go test ./cmd/vclusterctl/...
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 build/"$pkgname" "$pkgdir/usr/bin/$pkgname"

    build/"$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    build/"$pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
