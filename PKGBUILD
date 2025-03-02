# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Simon Ser <@emersion>
# Contributor: Cookie Engineer <@cookiengineer>

_pkgname=hydroxide
pkgname=$_pkgname-git
pkgver=0.2.29.r0.c964219
pkgrel=1
pkgdesc='A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge'
arch=(x86_64)
url=https://github.com/emersion/hydroxide
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(git go)
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$srcdir"/$_pkgname
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build ./cmd/...
}

check() {
    cd "$srcdir"/$_pkgname
    go test ./...
}


package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 -t "$pkgdir"/usr/bin $_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname README.md
}
