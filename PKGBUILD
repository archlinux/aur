# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=shadowsocks-go
pkgname=$_pkgname-git
pkgver=1.0.0.r3.gaf83c9e
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
    '345e7fcc54f63812db25b35aa6bcca5ec156e200148876b8690ad77cad7ca91c9bbdb68f5a3eb7778521af030cd541a04258c968897727530778a6762f512844'
    'b7e547bf2e344fd0c85f4c62d9a61eb61cad20358eee31fd5b5aa55f0ab20e6452ca737b9d0f7faafb40ca18c828b505d8c725dbe974f9273b0e6e254cb466b5'
    '83a30277645ddac90bf3878b742f1c506a36c2a4dc50025fd7e08e9e200a227c3c468af51a21fc6a7d6f727d5088b689c43282b45869f31131d427d36adab6df'
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
