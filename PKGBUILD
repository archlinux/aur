# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Maintainer:  Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Reiser <simonfxr@gmail.com>

_pkgname=lab
pkgname=$_pkgname-git
pkgver=0.16.0.r18.gd114488
_branch=master
pkgrel=2
pkgdesc="A hub-like tool for GitLab (git $_branch branch)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('git' 'go')
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git://github.com/zaquestion/$_pkgname.git#branch=$_branch")
sha512sums=('SKIP')
_gourl="github.com/zaquestion/$_pkgname"

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    export GOPATH="$srcdir/go"
    mkdir -p "$GOPATH"/bin

    local S="$srcdir/$_pkgname"

    export PATH="$GOPATH"/bin:"$PATH"
    echo "Using goimports to remove unused packages"
    command -v goimports &>/dev/null ||
        go get golang.org/x/tools/cmd/goimports
    find "$S" -name '*.go' -print0 | xargs -r0 goimports -w

    make -C "$S" build || true
}

package() {
    cd "$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
