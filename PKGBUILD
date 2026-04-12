# Maintainer: rakoo <m@rako.space>
pkgname=anvil-editor
_pkgname=anvil
pkgver=0.7
pkgrel=1
pkgdesc="Multi-pane tiling editor inspired by Plan9 Acme"
arch=("any")
url="https://github.com/jeffwilliams/anvil"
license=("MIT")
depends=('libx11' 'libglvnd' 'libxkbcommon' 'glibc' 'wayland' 'libxfixes' 'libxcursor' 'libxkbcommon-x11')
makedepends=('go')
source=(
	"https://github.com/jeffwilliams/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    "ab1ed054117e6d987ae0b4ff172a0718b74cec048dbc43418e74c441fdd342f6"
)


build() {
    cd $_pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH=${srcdir}
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"


    [ ! -e "build" ] && mkdir build
    [ ! -e "go.work" ] && go work init ./editor ./extras ./api/go/anvil
    
    pushd ./editor
    go build -ldflags="-linkmode external -X main.buildVersion=$pkgver -extldflags \"${LDFLAGS}\"" -o ../build ./cmd/...
    popd
}

package() {
    cd $_pkgname-$pkgver
    mkdir -p "$pkgdir"/usr/bin
    install -Dm755 build/* "$pkgdir"/usr/bin/
    mv "$pkgdir"/usr/bin/${_pkgname} "$pkgdir"/usr/bin/$pkgname
    
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

