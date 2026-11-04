pkgname=lddtree
pkgver=0.5.1
pkgrel=1
pkgdesc='Read the dynamic library dependency tree'
arch=('x86_64' 'i686' 'aarch64')
_repo='lddtree-rs'
url="https://github.com/messense/${_repo}"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')

_snapshot="${_repo}-${pkgver}"
source=("${url}/archive/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('e056a7a04e21c00c8eb1fdb5dd0b7f55e3e7dd5820551696cbbd08381c954bc8')

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
