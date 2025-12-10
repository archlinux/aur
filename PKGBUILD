# Maintainer: Manuel Wiesinger <manuel {you know what belongs here} unikraft {and here} io>

pkgname=kraftkit
pkgver=0.12.5
pkgrel=1
pkgdesc='Build and use highly customized and ultra-lightweight unikernels'
arch=('x86_64')
url='https://unikraft.org/docs/cli'
license=('BSD-3-Clause')
source=(
    "git+https://github.com/unikraft/kraftkit.git#tag=v$pkgver"
#    'ssh_allowed_signers'
)
depends=('bash' 'glibc')
makedepends=('git' 'go')
#checkdepens=('')
conflicts=("${pkgname}-bin" "${pkgname}-git")
b2sums=('56cd463f571bf3a69e5f871b53dfac55959947abe2aa4bae402df3f300130eaff4b9814cc0546032d15e90f81466d2e6c51943a7e37b250fcafc7844e811b2ee')

prepare() {
    cd $srcdir/$pkgname

    git clean -dxf

    # TODO: Double check with upstream
    # Check SSH signature
    #
    # Taken from https://gitlab.archlinux.org/archlinux/packaging/packages/python-structlog/-/blob/main/PKGBUILD
    #
    # XXX: move to verify() when devtools supports it
    # https://gitlab.archlinux.org/archlinux/devtools/-/issues/224
    #
    # git -c gpg.ssh.allowedSignersFile="$srcdir/ssh_allowed_signers" verify-tag "v${pkgver}"

    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd $srcdir/$pkgname

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Build kraft
    go build -v -tags "containers_image_storage_stub,containers_image_openpgp,netgo,osusergo" ./cmd/kraft/main.go

    # Build man pages
    go run -tags "containers_image_storage_stub,containers_image_openpgp,osusergo,netgo" ./tools/genman --uncompressed generate ./docs/man/
}

# TODO: Figure out how to idiomatically clean up buildkit containers
# check() {
#     cd $srcdir/$pkgname-$pkgver
#     make test-unit
# }

package() {
    cd $srcdir/$pkgname

    # Executables
    install -Dm755 main $pkgdir/usr/bin/kraft
    install -Dm755 scripts/kraftld -t $pkgdir/usr/bin/

    # License
    install -Dm644 LICENSE.md -t $pkgdir/usr/share/licenses/$pkgname/

    # Man pages
    cd docs/man/
    find . -exec install -Dm644 {} -t $pkgdir/usr/share/man/man1/ \;
}
