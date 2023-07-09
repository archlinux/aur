# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=restic-rest-server
_reponame=rest-server
pkgver=0.12.1
pkgrel=1
pkgdesc="High-performance HTTP server that implements restic's REST backend API"
url='https://github.com/restic/rest-server'
license=(BSD)
arch=(x86_64)
makedepends=(go)
optdepends=('apache: htpasswd manipulation')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfbeb4a66cac6fc36b1cb11256f06c6e4fcc7a28c2ef590550adf1c199b9aa4b')
sha512sums=('113a1b310845bafe92fc4ee60aadd0f0dc8c5f4f1676706c89c48e291937c616ee33b57febd7a41d99dc57adb250e7f34de1c302cf685a44f009585acaccde44')
b2sums=('52400755fb4986659f529f416588f45ec64e1d546c6a8d07bc239bbf0dc779d4740e28cf99525fb4e1276e49564efe663819b50f4e16b657301c313d13975504')

build() {
    cd ${_reponame}-$pkgver
    export CGO_ENABLED=0
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"${LDFLAGS}\"" -mod=readonly -modcacherw -o restic-rest-server ./cmd/rest-server
}

check() {
    cd ${_reponame}-$pkgver
    go test ./...
}

package() {
    cd ${_reponame}-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
}
