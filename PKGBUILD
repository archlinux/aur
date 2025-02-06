# Maintainer: @aardbol
pkgname=picocrypt-git
pkgver=1.46.r0.670d284
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('x86_64')
url="https://github.com/Picocrypt/Picocrypt"
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(gtk3)
makedepends=(git go)
options=(!lto)
source=("${pkgname}::git+${url}.git"
        picocrypt.desktop)
sha512sums=('SKIP'
            '1c499ed01d8550a0be97084903776e1b3c8922401e6a73270457ffdcfe879449d3d718ed4c3ae9dc2cf90a98952b76c9bf455871fbace77a563a8681dddf1d81')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1
    cd "$pkgname/src"
    go build -o "${pkgname%-git}" ./Picocrypt.go
}
package(){
    install -Dm755 "${pkgname}/src/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}/images/key.svg" "${pkgdir}/usr/share/pixmaps/picocrypt.svg"
    install -Dm644 picocrypt.desktop -t "${pkgdir}/usr/share/applications"
}
