# Maintainer: database64128 <free122448@hotmail.com>

pkgname=shadowsocks-go
pkgver=1.0.0
pkgrel=1
pkgdesc="A versatile and efficient proxy platform for secure communications"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL3')
makedepends=('go')
backup=(
    "etc/$pkgname/config.json"
    "etc/$pkgname/server.json"
    "etc/$pkgname/client.json"
)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.service"
    "$pkgname@.service"
    'config.json'
    'server.json'
    'client.json'
)
b2sums=(
    '7607da33cb495e28a7ab5ce2d1ccc361d4538cd214ef9eaab36376e488dc84a4f5adb054524345221402c93eca18aa70c92814ee8f477e1afc0226d1bde6b974'
    '78640d18aa9f343c594f5c2afee139767e1c25642de595b3a4dfae67399f973404502f31dc9f3894df82cf8ff8af7df2e01993f6c61a2434f655e59623d353a9'
    'c6e2c2b21a41c87b0136c07df305d4d031a5b5040baa1a4ea760fb568c3864499a9ac43ea7e82220c895f274eb0e2913bc2fcdff270ca8aa37af4d4f43050a2f'
    '345e7fcc54f63812db25b35aa6bcca5ec156e200148876b8690ad77cad7ca91c9bbdb68f5a3eb7778521af030cd541a04258c968897727530778a6762f512844'
    'b7e547bf2e344fd0c85f4c62d9a61eb61cad20358eee31fd5b5aa55f0ab20e6452ca737b9d0f7faafb40ca18c828b505d8c725dbe974f9273b0e6e254cb466b5'
    '83a30277645ddac90bf3878b742f1c506a36c2a4dc50025fd7e08e9e200a227c3c468af51a21fc6a7d6f727d5088b689c43282b45869f31131d427d36adab6df'
)

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname
}

package() {
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 config.json "$pkgdir"/etc/$pkgname/config.json
    install -Dm644 server.json "$pkgdir"/etc/$pkgname/server.json
    install -Dm644 client.json "$pkgdir"/etc/$pkgname/client.json
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
