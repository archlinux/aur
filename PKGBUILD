# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Maintainer:  Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab-git
pkgver=0.12.0.r7.g9032be9
_branch=master
pkgrel=1
pkgdesc="A hub-like tool for GitLab (git ${_branch} branch)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('git' 'go' 'dep')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("git://github.com/zaquestion/${pkgname%-git}.git#branch=${_branch}")
sha512sums=('SKIP')
_gourl="github.com/zaquestion/${pkgname%-git}"

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export GOPATH="${srcdir}/go"
    mkdir -p "$GOPATH"
    mkdir -p "$(dirname "$GOPATH/src/${_gourl}")"
    ln --no-target-directory -fs "${srcdir}/${pkgname%-git}" "$GOPATH/src/${_gourl}"
}

build () {
    export GOPATH="${srcdir}/go"
    cd "$GOPATH/src/${_gourl}"
    dep ensure
    go build -ldflags "-X \"main.version=${pkgver}\"" ${_gourl}
}

package() {
    cd "${pkgname%-git}"
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 lab $pkgdir/usr/bin/lab
}
