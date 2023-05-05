# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=ytarchive-git
pkgver=r256.b40d0a1
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader."
arch=('x86_64' 'aarch64')
url="https://github.com/Kethsar/ytarchive"
license=("MIT")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(git go)
options=(!lto)
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    cd "$pkgname"
    go build -o "${pkgname%-git}" -ldflags \
    "-linkmode=external -extldflags $LDFLAGS -X main.Commit=${pkgver#*.}"
}
package(){
    depends=(ffmpeg)
    install -Dm755 "${pkgname}/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
