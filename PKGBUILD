# Maintainer: Raphael Westphal <westphalraphael@gmail.com>
pkgname=marianne
pkgver=0.0.7
pkgrel=1
pkgdesc="A blazing-fast parallel downloader with automatic archive extraction and beautiful terminal UI"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/wesraph/marianne"
license=('MIT')
depends=('glibc')
optdepends=(
    'tar: for tar archive extraction'
    'gzip: for .tar.gz archive support'
    'lz4: for .tar.lz4 archive support'
    'zstd: for .tar.zst archive support'
    'xz: for .tar.xz archive support'
    'bzip2: for .tar.bz2 archive support'
)
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wesraph/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b10381ee77be4a4df845ce25da48f3c629f338d224e6d6c0445961431ebc12c7')

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags="-linkmode=external -s -w" -o "${pkgname}" .
}

check() {
    cd "${pkgname}-${pkgver}"
    go test -v ./...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
