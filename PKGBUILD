# Maintainer: nicknb <nicknb at posteo dot com>
# Contributor: Marcel Röthke <marcel@roethke.info>
pkgname=dblab
pkgver=0.33.0
pkgrel=2
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
arch=(x86_64 i686 aarch64 armv7h armv7h)
url="https://github.com/danvergara/dblab"
license=('MIT')
makedepends=(go)
provides=("$pkgname")
conflicts=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a2d664cfe8ae553aa71598bcaecbaff0ce554ad05d9f0cbd4f18b3e941c2273')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    go build -o dblab -ldflags "-compressdwarf=false -linkmode=external" .
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 dblab "${pkgdir}/usr/bin/dblab"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/share/zsh/site-functions"
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -d "${pkgdir}/usr/share/bash-completion/completions"
    ./dblab completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    ./dblab completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    ./dblab completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
