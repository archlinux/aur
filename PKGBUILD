# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=age-plugin-tpm
pkgver=0.2.0
pkgrel=2
pkgdesc='TPM plugin for age'
arch=('x86_64')
url="https://github.com/Foxboron/${pkgname}"
license=('MIT')
depends=('glibc')
optdepends=(
    'age: for use with age'
    'rust-rage: for use with rage'
)
makedepends=('go')
_archive="${pkgname}-${pkgver}"
source=("${_archive}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c5edd021342013a6513716cd4cda0ee6cc0a64d130ed88e3d86cde221fa6cbe5029e1b4c6c04528cebd6b1c758ef5bfb6ddd36e0b8c02bd25ca30233008c4833')

build() {
    cd "${_archive}"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-X main.Version=${pkgver} -linkmode external -extldflags \"$LDFLAGS\"" \
        -o . ./...
}

check() {
    cd "${_archive}"
    go test ./...
}

package() {
    cd "${_archive}"
    install -Dm755 -t "${pkgdir}/usr/bin/" age-plugin-tpm
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
