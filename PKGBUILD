# Maintainer: Mark Stenglein <aur@markstenglein.com>

pkgname=slides
pkgver=0.9.0
pkgrel=2
pkgdesc='Terminal based presentation tool'
arch=('x86_64')
url="https://github.com/maaslalani/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
changelog='CHANGELOG.md'

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go clean -cache
    go clean -testcache
    go build -buildmode=pie -trimpath -ldflags "-linkmode external -X main.Version=${pkgver} -s -w"
}

check() {
    cd $pkgname
    go test ./...
}

package() {
    cd $pkgname
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

