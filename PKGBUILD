# Maintainer: Eklairs <eklairs@proton.me>

pkgname=tlock-git
_pkgname=${pkgname%-git}
_binname=$pkgname-release
pkgver=1.0.0.r12.g6602694
pkgrel=1
pkgdesc="Two-Factor Authentication Tokens Manager in Terminal"
url="https://github.com/eklairs/tlock"
arch=("x86_64")
license=("MIT")
makedepends=('go' 'git')
conflicts=($_pkgname)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_pkgname
    git submodule update --init --quiet
}

build() {
    cd $_pkgname

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build -buildmode=pie -trimpath -ldflags "-X github.com/eklairs/tlock/tlock-internal/constants.VERSION=v$pkgver -s -w" -o $_binname $_pkgname/main.go
}

package() {
    cd $_pkgname

    install -Dm755 $_binname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

