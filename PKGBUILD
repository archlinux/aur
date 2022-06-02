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
        picocrypt.desktop)
sha512sums=('SKIP'
            '38c48400411613744ee77c662373a4966a55edd00717107383de9a3c7e2ef161bf6b4d75f6f2b6e714d8c67245f1f027ff80b96a12d1c15c79feb3525978cb76')

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
