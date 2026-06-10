# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli-git
pkgver=4.23.0.dev.1.r0.g1d73d7fa
pkgrel=1
pkgdesc="Efficient creation and management of applications on Azion Edge Platform"
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/aziontech/azion"
license=(MIT)
depends=(glibc)
makedepends=(git go)
provides=(azion-cli)
conflicts=(azion-cli)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname"
    make build
}

# check() {
#     cd "$pkgname"
#     go test ./...
# }

package() {
    cd "$pkgname"
    install -Dm755 bin/azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md SUPPORT.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
