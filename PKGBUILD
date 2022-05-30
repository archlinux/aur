# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=picocrypt-git
pkgver=1.29.r11.g38a0256
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool."
arch=('x86_64')
url="https://github.com/HACKERALERT/Picocrypt"
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(gtk3)
makedepends=(git go)
options=(!lto)
source=("${pkgname}::git+${url}.git#branch=main"
        picocrypt.svg
        picocrypt.desktop
) 
sha512sums=('SKIP'
            '7fd03c82479b44b6a83cb2bd8d0052a833924d2c62312db90460d34fe30ebd53ac14ea8cd739bcb1470f99023db45a56806388e6cba2343e82c099d4e6e84a33'
            'af4ab8fb1765563e4cdc3baedde147cb1b979dee9b71ba4c41b0dec95046cc9cc99d76c89b5a002d6c9c5fb4f737876b857e564dadb3187605f0c7c957b4e967')

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
    install -Dm644 picocrypt.svg -t "${pkgdir}/usr/share/icons"
    install -Dm644 picocrypt.desktop -t "${pkgdir}/usr/share/applications"
}
