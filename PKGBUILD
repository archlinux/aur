# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=gittuf
pkgver=0.18.0
pkgrel=1
pkgdesc="A security layer for Git repositories"
arch=('any')
license=('Apache-2.0')
url="https://github.com/gittuf/gittuf"
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3e34359a1ba15aed1f6bea942614033fe8bee71356817d6cf97dd861a126b206')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    cd "$pkgname-$pkgver"
    go build \
        -o bin/${pkgname} \
        -buildmode=pie \
        -trimpath \
        -ldflags="-linkmode=external -buildid= -X github.com/gittuf/gittuf/internal/version.gitVersion=v$pkgver" \
        -mod=readonly \
        -modcacherw
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/${pkgname}
}
