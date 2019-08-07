# Maintainer: Matthias Fulz <mfulz at olzenet dot de>

pkgname=shellbuddy
pkgver=0.5
pkgrel=1
pkgdesc="History and path tracking for shells"
arch=('x86_64')
url="https://github.com/mfulz/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://github.com/mfulz/shellbuddy/archive/$pkgver.tar.gz")
sha256sums=('399f92fec910ab2fafecd45c89a5decc2f866a55cef285bd49b247fb47ca8044')

prepare() {
    GOPATH="$srcdir/go" go get github.com/manifoldco/promptui
    GOPATH="$srcdir/go" go get github.com/mattn/go-sqlite3
    GOPATH="$srcdir/go" go get github.com/pelletier/go-toml
    GOPATH="$srcdir/go" go get github.com/mitchellh/go-ps
}

build() {
    cd $pkgname-$pkgver
    GOPATH="$srcdir/go" go build \
        -buildmode=pie \
        -gcflags "all=-trimpath=$PWD" \
        -asmflags "all=-trimpath=$PWD" \
        -ldflags "-extldflags $LDFLAGS" \
        -o $pkgname .
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 shells/zsh_include.sh "$pkgdir"/usr/share/$pkgname/zsh_include.sh
    install -Dm644 shells/bash_include.sh "$pkgdir"/usr/share/$pkgname/bash_include.sh
}
