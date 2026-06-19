# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.7.5
pkgrel=2
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://git.taurusxin.com/taurusxin/ncmdump-go"
license=("MIT")
makedepends=("go")
provides=("${pkgname}"{,-latest-bin})
conflicts=("${pkgname}"{,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('69aa760e9444068bf4d4cb839904a3e951faa2d3ed0faca9f20e901ce9c87e82')

prepare() {
    cd "ncmdump-go"
    sed -i "s|ncmdump version [^\"]\+|ncmdump version ${pkgver}|" main.go
}

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "ncmdump-go"
    go build -o "${pkgname}"
}

package() {
    cd "ncmdump-go"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
