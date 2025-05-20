pkgname=llama-swap
_fragment=tag=v121

pkgver=121
pkgrel=1
pkgdesc='Model swapping for llama.cpp (or any local OpenAPI compatible server)'

arch=(x86_64)
url="https://github.com/mostlygeek/$pkgname"
license=('MIT')

makedepends=(git go)

source=(
    "git+$url.git#$_fragment"
    llama-swap.service
)
sha256sums=('18d0395a593de1d64eb947af7e11681b5857890dc2341dbdffe8e3dc01802b07'
            '74bcd4bd61c21f48450ee24f47a449ecf25f5f46d10b55571c6716e57a0dee80')

pkgver() {
    git -C $pkgname describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}


prepare() {
	cd $pkgname
	go mod vendor
}

build() {
    cd $pkgname

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"

    local GOBUILDOPTS=(
        -v
        -trimpath
        -mod=readonly
        -modcacherw
        -buildmode=pie
        -ldflags="-linkmode=external -X main.version=$pkgver -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    )

    go build "${GOBUILDOPTS[@]}"
}

package() {
    cd $pkgname

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
    install -Dm755 -t "$pkgdir/usr/bin"                     $pkgname
    install -Dm644 -t "$pkgdir/etc/llama-swap"              config.example.yaml
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system"      ../llama-swap.service
    
}
