# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Maintainer:  Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Reiser <simonfxr@gmail.com>

_pkgname=lab
pkgname=$_pkgname-git
pkgver=0.17.2.r1.gbe53a79
_branch=master
pkgrel=1
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
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver"
    ./lab completion bash > completion.bash
    ./lab completion zsh > completion.zsh
}

package() {
    cd "$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/lab"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_lab"
}
