# Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=mmp-go-git
pkgver=20201201.r36.02a98fe
pkgrel=1
pkgdesc="Reuse a single port for multiple Shadowsocks AEAD servers"
arch=('x86_64')
url="https://github.com/Qv2ray/mmp-go"
license=('AGPL3')
depends=('git' 'glibc')
makedepends=('go')
provides=('mmp-go')
conflicts=('mmp-go')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "$srcdir"/$pkgname
    
    CGO_ENABLED=1 GO111MODULE=on go build -v \
        -buildmode=pie -trimpath \
        -ldflags="-s -w -X github.com/Qv2ray/mmp-go/config.Version=$pkgver -extldflags=-Wl,-z,now,-z,relro" \
        -o mmp-go .
}

package() {
    cd "$srcdir"/$pkgname
    
    install -Dm755 -t "$pkgdir"/usr/bin/                ./mmp-go
    install -Dm644 -t "$pkgdir"/usr/share/doc/mmp-go    ./README.md
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system  ./systemd/mmp-go.service
    install -Dm644 -t "$pkgdir"/etc/mmp-go/             ./example.json
}
