# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=gotlsaflare
pkgver=2.4.0
pkgrel=1
pkgdesc="Update TLSA DANE records on Cloudflare from X509 certificate"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Stenstromen/gotlsaflare"
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('58e2ee1a78d405c5d7e5f9891c46a0e277b6da4f1c3c31d280d28a14cc8d07d9')

build() {
    GOPATH=$(pwd)/..
    export GOPATH
    cd "${srcdir}/${pkgname}" || exit

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS} -Wl,-z,ibt -Wl,-z,shstk"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
    cd "$srcdir/${pkgname}" || exit
    install -Dm755 ${pkgname} "$pkgdir/usr/bin/$pkgname"
}
