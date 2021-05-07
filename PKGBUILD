# Maintainer: cubercsl <2014cais01 at gmail dot com>
# Contributor:  Ilya Revenko <i.revenko at ct-college dot net>

pkgname=tsukae-git
pkgver=20210419.r21.8111ddd
pkgrel=1
provides=('tsukae')
conflicts=('tsukae')
pkgdesc='Show off your most used shell commands'
arch=('x86_64')
url='https://github.com/irevenko/tsukae'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "$srcdir/$pkgname"
    go get -d -u ./...
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 tsukae -t "$pkgdir/usr/bin/"
}
