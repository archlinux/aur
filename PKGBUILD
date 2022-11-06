# Maintainer: Johannes Larsen <mail@johslarsen.net>
pkgname=grdl-git-get-git
pkgver=v0.5.0.r1.8cd27a8
pkgrel=1
pkgdesc="A better way to clone, organize and manage multiple git repositories"
arch=('x86_64')
url="https://github.com/grdl/git-get"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    for cmd in ./cmd/*; do
        go build -o git-${cmd##*/} $cmd
    done
}

check() {
    cd "$srcdir/${pkgname%-git}"
    # The tests runs actual git commands, so setting EMAIL to avoid commit
    # failures, and fiddling with HOME to avoid user specific .gitconfig
    # impacting the tests. The default GOPATH is relative to HOME so make sure
    # to set this explicitly to the expanded default so we can reuse the cache.
    GOPATH=${GOPATH:-$HOME/go} EMAIL=build-user@example.com GIT_CONFIG_NOSYSTEM=1 HOME="$srcdir" XDG_CONFIG_HOME="$srcdir" go test ./...
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 git-get "${pkgdir}/usr/bin/git-get"
    install -Dm755 git-list "${pkgdir}/usr/bin/git-list"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
