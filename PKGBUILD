# Maintainer: Jqs7 <7@jqs7.com>
pkgname=goproxy-git
_pkgname=goproxy
pkgver=v2.1.2.r77.gb1e59a4
pkgrel=1
pkgdesc="a proxy tunnel wirtten in go"
url="https://github.com/shell909090/goproxy"
license=('GPL')
arch=('x86_64' 'i686' 'arm')
makedepends=('go' 'git')
install=
source=('git+https://github.com/shell909090/goproxy.git'
        'goproxy@.service')
md5sums=('SKIP'
         'f0e3e1cd3b33c7a8c6cac0f8e58215bc')
backup=('etc/goproxy/client.json'
        'etc/goproxy/server.json')

pkgver() {
   cd "$srcdir/$_pkgname"
   ( set -o pipefail
     git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir"
    export GOPATH="$srcdir"
    mkdir -p "$GOPATH/src/github.com/shell909090"
    cp -r "$srcdir/$_pkgname" "$GOPATH/src/github.com/shell909090"

    sed -i 's/"logfile": "client.log"/"logfile": ""/g' "$srcdir/$_pkgname/client.json"
    sed -i 's/"logfile": "server.log"/"logfile": ""/g' "$srcdir/$_pkgname/server.json"

    cd "$GOPATH/src/github.com/shell909090/goproxy/goproxy"
    go get -v
    mkdir "$GOPATH/bin"
    go build -o "$srcdir/$_pkgname/bin/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm775 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/$_pkgname/README.md"
    install -Dm644 client.json "$pkgdir/etc/$_pkgname/client.json"
    install -Dm644 server.json "$pkgdir/etc/$_pkgname/server.json"
    install -Dm644 ../../goproxy@.service "$pkgdir/usr/lib/systemd/system/goproxy@.service"
}
