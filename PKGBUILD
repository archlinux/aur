# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=restic-rest-server
_reponame=rest-server
pkgver=0.12.0
pkgrel=1
pkgdesc="High-performance HTTP server that implements restic's REST backend API"
url='https://github.com/restic/rest-server'
license=(BSD)
arch=(x86_64)
makedepends=(go)
optdepends=('apache: htpasswd manipulation')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1032d6bfd8847f99027c748c0ae8e3a5993534a924069aa23e5b99954118f8c7')
sha512sums=('d8913539eedff662b827a27a3778e8885a3142e52bdb9c5bcbcbd8ba5e85ec0539a3eb656d7dfe3035fae8dd40b1c756abcb094b6b3541a2027193e726895e83')
b2sums=('8aabde68546769dd7333684f46b056f811fc7626e9ad8bc2df7a762c808ce9641b62b99ee48f96726ec9053d09f59a78a442d00a20955512c286649ae7619ade')

build() {
    cd ${_reponame}-$pkgver
    export CGO_ENABLED=0
    # 0.12.0 incorrectly reports the version as 0.11.0, so we manually overwrite it
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" -mod=readonly -modcacherw -o restic-rest-server ./cmd/rest-server
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
