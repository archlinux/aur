# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=shadowsocks-go
pkgname=$_pkgname-git
pkgver=1.1.0.r0.g7ceae19
pkgrel=1
pkgdesc="A versatile and efficient proxy platform for secure communications"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('AGPL3')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(
    "etc/$_pkgname/config.json"
    "etc/$_pkgname/server.json"
    "etc/$_pkgname/client.json"
)
source=(
    "$pkgname::git+$url.git"
    "$_pkgname.service"
    "$_pkgname@.service"
    'config.json'
    'server.json'
    'client.json'
)
b2sums=(
    'SKIP'
    '78640d18aa9f343c594f5c2afee139767e1c25642de595b3a4dfae67399f973404502f31dc9f3894df82cf8ff8af7df2e01993f6c61a2434f655e59623d353a9'
    'c6e2c2b21a41c87b0136c07df305d4d031a5b5040baa1a4ea760fb568c3864499a9ac43ea7e82220c895f274eb0e2913bc2fcdff270ca8aa37af4d4f43050a2f'
    '6fa6e8d11f26d7cc8515fa0ee65e63f6c4f9de6513e146de360c09a22cd7821abdfdbca82fca385b0cdc1315d73f1b12fb79b0aff634c24b65904d1bc7958552'
    '525739cbdd22feba92dc28c0db6cce48793a293e967541ab7fa31379f7f8a252041ed2bc77194e8e3fbf73489a7b5b1980db0c3db74b04685391a4b6157ef59a'
    '16e0b360754b455a97d26a9d3c5854a6a1de36618358f12309dd6a3a086f87c310514a8d8bcfd44da0f0068512a2226088f685aa4137b47e88f24a1c57cc1dfa'
)

pkgver() {
    cd $pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$_pkgname
}

package() {
    install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm644 $_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 config.json "$pkgdir"/etc/$_pkgname/config.json
    install -Dm644 server.json "$pkgdir"/etc/$_pkgname/server.json
    install -Dm644 client.json "$pkgdir"/etc/$_pkgname/client.json
    cd $pkgname
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
