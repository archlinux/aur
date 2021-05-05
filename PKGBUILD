# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=restic-rest-server
_reponame=rest-server
pkgver=0.10.0
pkgrel=1
pkgdesc="High-performance HTTP server that implements restic's REST backend API"
url='https://github.com/restic/rest-server'
license=(BSD)
arch=(x86_64)
optdepends=('apache: htpasswd manipulation')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d109cf9e9c3f36c9c8eb6d4a2bd530c5dfcd62b11687d93034e2edc0fdecf479')
sha512sums=('b209edf2cb6e8ae11ff4800ffd84195c6052180ee81e5b79cb71895b9b559e0c6455835255f0b34d5d70482c4917f8491747bf0487ec3766432ae57e07d93884')
b2sums=('48a07f7fbd05de39246813772905ba21487ee77640b70d4e086c29cc0b3b4885d38158be487f846bbada725444fdbccd3d0a3bc2ce24f25d81c069f734d36854')

build() {
    cd ${_reponame}-$pkgver
    export CGO_ENABLED=0
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"${LDFLAGS}\"" -mod=readonly -modcacherw -o restic-rest-server ./cmd/rest-server
}

# Tests were broken and got fixed two commits after the last release
# check() {
#     cd ${_reponame}-$pkgver
#     go test ./...
# }

package() {
    cd ${_reponame}-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
}
