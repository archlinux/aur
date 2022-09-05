# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=restic-rest-server
_reponame=rest-server
pkgver=0.11.0
pkgrel=1
pkgdesc="High-performance HTTP server that implements restic's REST backend API"
url='https://github.com/restic/rest-server'
license=(BSD)
arch=(x86_64)
makedepends=(go)
optdepends=('apache: htpasswd manipulation')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd9b35ad2224244207a967ebbc78d84f4298d725e95c1fa9341ed95a350ea68f')
sha512sums=('2c26dee8d6fdc5d6c79c1565a29dbecbf90b7fecd969542d1596631623fff83e4fd42e73bd70fb9f8404acbb32e48cc14224681c7c2d5895c4b643974630af92')
b2sums=('a936d06830302a935d86e34751cf328319e441e2696ffc72f90a577bd9d6d3ee32994081a0e5d0820c82fe0a281ce6c5b376d750c62d4f3d8f940282f051f23b')

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
