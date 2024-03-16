pkgname=aur-check-updates
pkgver=1.0.11
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
depends=('libalpm.so' 'libcurl.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('859e5a029afe8d42a3fe9e40d3b5645b3896b018cd59a24e856ff19725193437')

prepare() {
    cd "${_snapshot}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
