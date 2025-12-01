# Maintainer: Manuel Wiesinger <manuel {you know what belongs here} unikraft {and here} io>

pkgname=kraftkit
pkgver=0.12.3
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
b2sums=('09fe60a4ac87e5e4189f46a1fc2e9387687fab259a396ebf9611bace6ce275ac943f822f01f941956fd5b887ad3663e1b04d4f7541a0cb25440633ce10e3c826')

prepare() {
    cd $srcdir/$pkgname

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
    go build -tags "containers_image_storage_stub,containers_image_openpgp,netgo,osusergo" ./cmd/kraft/main.go

    # Build man pages
    make man
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
