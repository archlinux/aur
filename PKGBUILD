# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.14.0
pkgrel=1
pkgdesc="A hub-like tool for GitLab (tagged release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go' 'dep')
conflicts=("$pkgname-git" "$pkgname-bin")
source=("https://github.com/zaquestion/lab/archive/v$pkgver.tar.gz")
sha512sums=('65bfacc380a80d089426c451094184be3721e033de954ee33778d1cdf017c1636a163dd790c28c863385621a4085b60c64a65c9981651abf06056e4c82961dad')
_gourl="github.com/zaquestion/$pkgname"

prepare() {
    export GOPATH="$srcdir/go"
    mkdir -p "$GOPATH"
    mkdir -p "$(dirname "$GOPATH/src/$_gourl")"
    ln --no-target-directory -fs "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_gourl"
}

build () {
    export GOPATH="$srcdir/go"
    cd "$GOPATH/src/$_gourl"
    dep ensure
    go build -ldflags "-X \"main.version=$pkgver\"" "$_gourl"
}

package() {
    cd "${pkgname%-bin}-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
