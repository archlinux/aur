# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.7.5
pkgrel=1
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://git.taurusxin.com/taurusxin/ncmdump-go"
license=("MIT")
makedepends=("go")
provides=("${pkgname}"{,-latest-bin})
conflicts=("${pkgname}"{,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('98423dc245eaa7967ad49d4f0c7f2c057ca71676e6c8305a6e57ba2c43bb3387')

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
