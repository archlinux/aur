# Maintainer:   Simon Legner <Simon.Legner@gmail.com>
# Maintainer:   Caleb Maclennan <caleb@alerque.com>
# Contributor:  Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=lab
pkgver=0.13.1
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
sha512sums=('7b4d89348f588c2680ad0706441b8ad9df8483e11664892ee510596e9be250ce7689dc3b6c67bc8e5afab5265863255fd335b356df75a0e5c356c8c19abffb5e')
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
