# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Jameson Pugh <imntreal at gmail dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=cheat
pkgver=3.0.3
pkgrel=2
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('x86_64')
url="https://github.com/cheat/cheat"
license=('MIT')
makedepends=('go-pie')
optdepends=('fzf: for Fuzzy Finder integration')
conflicts=('cheat-bash-git' 'cheat-git')
replaces=('python-cheat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheat/cheat/archive/$pkgver.tar.gz")
sha256sums=('a9c0d7f46fe4dd19b17fadb4c071629d8dd118a775ee842218a2e9199ec75923')

prepare() {

    # create gopath
    mkdir -p "$srcdir/gopath"
    export GOPATH="$srcdir/gopath"

    # fetch dependencies
    msg "Fetching Go dependencies"
    cd "$pkgname-$pkgver"
    go get -d ./...
}

build() {
    cd "$pkgname-$pkgver"
    GOOS=linux \
    GOARCH=amd64 \
    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -gcflags "all=-trimpath=$srcdir" \
        -asmflags "all=-trimpath=$srcdir" \
        -ldflags "-extldflags $LDFLAGS" \
        -o "./dist/$pkgname" "./cmd/$pkgname"

    # Clean mod cache for makepkg -C
    go clean -modcache
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 scripts/fzf.bash "$pkgdir/usr/share/$pkgname/fzf.bash"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
