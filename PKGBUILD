# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=twitch-cli
pkgver=1.1.24
pkgrel=4
pkgdesc='The official Twitch CLI to make developing on Twitch easier'
arch=(x86_64)
url=https://github.com/twitchdev/twitch-cli
license=(Apache-2.0)

provides=($pkgname)
conflicts=($pkgname)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(8f796e1413b5b9f6d159cbdf5296acb22851822c024f6545acd707a71219a239)

build () {
    cd "$srcdir"/$pkgname-$pkgver
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    _ldflags="-s -w -X main.buildVersion=$pkgver -linkmode external -extldflags '$LDFLAGS'"
    go build -ldflags "$_ldflags" .
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir"/usr/bin/${pkgname%-cli}
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md docs/*.md
}
