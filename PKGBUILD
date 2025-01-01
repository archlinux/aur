# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ncmdump 
pkgver=1.7.2
pkgrel=2
pkgdesc="Convert Netease Cloud Music ncm files to mp3/flac files."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://git.taurusxin.com/taurusxin/ncmdump-go"
license=("MIT")
makedepends=("go")
provides=("${pkgname}"{,-go,-latest-bin})
conflicts=("${pkgname}"{,-go,-latest-bin})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f5e7acca59e4d5026177816a44ef94e178d27476b4edff21cd4274d4c04ba2ea')

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
    # install -Dm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
