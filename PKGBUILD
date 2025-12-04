# Maintainer: Manuel Wiesinger <manuel {you know what belongs here} unikraft {and here} io>

_name=kraftkit
pkgname=$_name-git
pkgver=v0.12.4.r0.gef72e31
pkgrel=1
pkgdesc='Build and use highly customized and ultra-lightweight unikernels'
arch=('x86_64')
url='https://unikraft.org/docs/cli'
license=('BSD-3-Clause')
source=("git+https://github.com/unikraft/kraftkit.git")
depends=('bash' 'glibc')
makedepends=('git' 'go')
#checkdepens=('')
provides=($_name)
conflicts=("${_name}-bin")
b2sums=('SKIP')

pkgver() {
    cd $srcdir/$_name
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/$_name

    git -C $srcdir/$_name clean -dfx

    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd $srcdir/$_name

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Build kraft
    go build -tags "containers_image_storage_stub,containers_image_openpgp,netgo,osusergo" ./cmd/kraft/main.go

    # Build man pages
    go run -tags "containers_image_storage_stub,containers_image_openpgp,osusergo,netgo" ./tools/genman --uncompressed generate ./docs/man/
}

# TODO: Figure out how to idiomatically clean up buildkit containers
# check() {
#     cd $srcdir/$_name
#     make test-unit
# }

package() {
    cd $srcdir/$_name

    # Executables
    install -Dm755 main $pkgdir/usr/bin/kraft
    install -Dm755 scripts/kraftld -t $pkgdir/usr/bin/

    # License
    install -Dm644 LICENSE.md -t $pkgdir/usr/share/licenses/$pkgname/

    # Man pages
    cd docs/man/
    find . -exec install -Dm644 {} -t $pkgdir/usr/share/man/man1/ \;
}
