# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=ytarchive-git
pkgver=r216.8d48052
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader."
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=("MIT")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(git go)
options=(!lto)
source=("${pkgname}::git+${url}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1
    cd "$pkgname"
    go build -o "${pkgname%-git}"
}
package(){
    depends=(ffmpeg)
    install -Dm755 "${pkgname}/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
