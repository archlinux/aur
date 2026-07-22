pkgname=aur-check-updates
pkgver=1.1.10
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
depends=('glibc' 'libgcc' 'libalpm.so' 'libcurl.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('27386fabfafa0c21ef8f60cc574f1ecd7f63d188ad6604f8edc90a2c1503b4b3')

prepare() {
    cd "${_snapshot}"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${_snapshot}"
    cargo build --frozen --release --target-dir "${srcdir}"
}

check() {
    cd "${_snapshot}"
    cargo test --frozen
}

package() {
    install -Dm755 "release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${_snapshot}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
