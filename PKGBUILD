# Maintainer: Jojii <jojii@gmx.net>
pkgname=gitjacker-git
pkgver=v0.0.2
pkgrel=1
pkgdesc="leak git repositories from misconfigured websites"
arch=('i686' 'x86_64')
url="https://github.com/liamg/gitjacker"
license=('custom:unilicense')
groups=()
depends=('git')
makedepends=(
    'git'
    'go'
)

options=()
install=
changelog=
source=("git+$url")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/gitjacker"
    git describe --tags --abbrev=0 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/gitjacker"

    _binary=gitjacker
    _tag=${TRAVIS_TAG:-development}
    go build -mod=vendor -o bin/linux/${_binary}-linux-amd64 -ldflags "-X github.com/liamg/gitjacker/internal/app/version.Version=${_tag}" ./cmd/gitjacker
}

package() {
    cd "$srcdir/gitjacker"
    mkdir -p $pkgdir/usr/bin

    install -DT bin/linux/gitjacker-linux-amd64 $pkgdir/usr/bin/gitjacker
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
