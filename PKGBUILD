pkgname=aur-check-updates
pkgver=1.1.6
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libalpm.so' 'libcurl.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('7d74cbf27781b1f7b0d9f09b4b2fe05d420f64c58b793342bb473a8f82aa0d10')

prepare() {
    cd "${_snapshot}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
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
    install -Dm0755 "release/${pkgname}" -t "${pkgdir}/usr/bin"
}
