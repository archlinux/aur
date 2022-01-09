# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=hut-git
_pkgname=hut
pkgver=r100.cb0e3c7
pkgrel=1
pkgdesc='A CLI tool for sr.ht'
arch=('x86_64')
url='https://sr.ht/~emersion/hut'
license=('AGPL3')
makedepends=('git' 'go' 'scdoc')
provides=('hut')
conflicts=('hut')
source=("$_pkgname::git+https://git.sr.ht/~emersion/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make -e

    ./$_pkgname completion bash > completion.bash
    ./$_pkgname completion fish > completion.fish
    ./$_pkgname completion zsh > completion.zsh
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr DESTDIR=$pkgdir install

    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
