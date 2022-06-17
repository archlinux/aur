# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname="aur-cli-git"
_pkgname="aur-cli"
pkgver=1.0.1.r2.g297a716
pkgrel=2
pkgdesc="Client for simple AUR queries"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Jguer/aur"
license=('GPL3')
makedepends=('go' 'git')
conflicts=('aur-cli')
provides=('aur-cli')
source=("aur-cli::git+https://github.com/Jguer/aur.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/$_pkgname"
    mkdir -p build
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/aur-cli
}

check() {
    cd "$srcdir/$_pkgname"
    go test ./...
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
