# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=autobindings
pkgname=cwtch-$_pkgname

pkgver=0.0.14
pkgrel=1

pkgdesc="Automatically-generated C bindings for the Cwtch library"
provides=('libcwtch-go')
depends=('tor')
makedepends=('go' 'git')
# Likely works on others, please report your success
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
source=("$_pkgname-v$pkgver.tar.gz::https://git.openprivacy.ca/api/v1/repos/cwtch.im/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('20c5af1b4eba9c61db1d86c86ab3ffb23eb12f979c8cb94746f68bd0e62b4e91')

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
