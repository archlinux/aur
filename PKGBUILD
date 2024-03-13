# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=autobindings
pkgname=cwtch-$_pkgname-git

pkgver=0.0.14.r1.g7a65efa
pkgrel=1

pkgdesc="Automatically-generated C bindings for the Cwtch library (git)"
provides=('libcwtch-go' 'cwtch-autobindings')
conflicts=('libcwtch-go' 'cwtch-autobindings')
depends=('tor')
makedepends=('go' 'git')
# Likely works on others, please report your success
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("git+https://git.openprivacy.ca/cwtch.im/autobindings.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v\.\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$_pkgname"
    make clean
}

build() {
    cd "$srcdir/$_pkgname"

    export GOPATH="$srcdir/go"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go mod download
    go run generate/generate_bindings.go >/dev/null
    make linux
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0644 build/linux/libCwtch.h -t "$pkgdir/usr/include/"
    install -Dm0644 build/linux/libCwtch.x64.so "$pkgdir/usr/lib/libCwtch.so"
}
