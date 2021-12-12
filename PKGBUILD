# Maintainer: bbaovanc <bbaovanc@bbaovanc.com>

_pkgname=linx-client
pkgname=$_pkgname-git
pkgver=r28.f5b1589
pkgrel=1
pkgdesc="Command-line client for linx-server"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/andreimarcu/linx-client"
license=('GPLv3')
makedepends=('go' 'git')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # See the PKGBUILD of `linx-client` for this part
    case $CARCH in
        x86_64) go_arch=amd64 ;;
        i686) go_arch=386 ;;
        arm) go_arch=arm ;;
    esac

    cd "$srcdir/$_pkgname"
    GOPATH=$PWD/go
    GOBIN=$GOPATH/bin go get
    GOOS=linux GOARCH=$go_arch go build -o $_pkgname
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 linx-client -t "$pkgdir/usr/bin"
}
