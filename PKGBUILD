# Maintainer: DuckSoft <realducksoft@gmail.com>
# Maintainer: mzz2017 <mzz@tuta.io>
pkgname=mmp-go-git
pkgver=20210218.r117.92ace24
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
    
    # Binary
    install -Dm755 ./mmp-go                    -t "$pkgdir"/usr/bin/
    
    # Documentation
    install -Dm644 ./README.md                 -t "$pkgdir"/usr/share/doc/mmp-go
    install -Dm644 ./systemd/README.md         "$pkgdir"/usr/share/doc/mmp-go/README-systemd.md
    
    # Configuration
    install -Dm644 ./example.json              "$pkgdir"/etc/mmp-go/config.example.json
    
    # Intergration
    install -Dm644 ./systemd/*.{service,timer} -t "$pkgdir"/usr/lib/systemd/system
}
