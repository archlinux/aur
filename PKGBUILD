# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Maintainer:  Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Reiser <simonfxr@gmail.com>

_pkgname=lab
pkgname=$_pkgname-git
pkgver=0.18.0.r1.gb7be1c1
_branch=master
pkgrel=1
pkgdesc="A hub-like tool for GitLab (git $_branch branch)"
arch=('x86_64')
url="https://zaquestion.github.io/$_pkgname"
license=('custom:CC0')
depends=('git')
optdepends=('hub')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/zaquestion/$_pkgname.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    go mod download
}

build () {
    cd "$_pkgname"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"$LDFLAGS\" -X main.version=$pkgver" \
        .
    ./lab completion bash > completion.bash
    ./lab completion zsh > completion.zsh
}

package() {
    cd "$_pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/lab"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_lab"
}
