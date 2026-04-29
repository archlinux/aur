# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: zneix <zneix@zneix.eu>

_pkgname=twitch-cli
pkgname=$_pkgname-git
pkgver=1.1.25.r8.fd7dac6
pkgrel=1
pkgdesc='The official Twitch CLI to make developing on Twitch easier'
arch=(x86_64)
url=https://github.com/twitchdev/twitch-cli
license=(Apache-2.0)

provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(git go)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^production\///;s/^v//'
}

build() {
    cd "$srcdir"/$_pkgname
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    make build
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/${_pkgname%-cli}
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname README.md docs/*.md
}
