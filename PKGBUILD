# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=gotlsaflare
pkgver=2.5.0
pkgrel=1
pkgdesc="Update TLSA DANE records on Cloudflare from X509 certificate"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Stenstromen/gotlsaflare"
depends=('glibc')
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('e581c8af9c233a04284599943da127471cf0acdcbfc895190189359592c614cc')

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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
