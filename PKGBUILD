# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=openmeters
pkgver=1.15.2
pkgrel=1
pkgdesc="Fast and professional audio metering/visualization for Linux."

arch=("x86_64")
url="https://github.com/httpsworldview/openmeters"
license=("GPL-3.0-or-later")
depends=("pipewire" "wayland" "libxkbcommon" "vulkan-icd-loader")
makedepends=("git" "cargo" "pkgconf" "clang")
provides=("openmeters")
conflicts=("openmeters")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('4050315536c98a225e56d1fdef28a5e8adcecafe80fda5aff980e47268a9b8b1')
# force disable lto for this package; it fails linking if it's enabled
options=('!lto')

prepare() {
    cd "${srcdir}/openmeters"
    cargo fetch --locked
}

build() {
    cd "${srcdir}/openmeters"
    cargo build --frozen --release
}

check() {
    cd "${srcdir}/openmeters"
    cargo test --frozen
}

package() {
    cd "${srcdir}/openmeters"
    install -vDm755 target/release/openmeters -t "${pkgdir}/usr/bin/"
    install -vDm644 LICENSE                   -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 README.md                 -t "${pkgdir}/usr/share/doc/${pkgname}/"

    cd "misc/"
    install -vDm644 openmeters.desktop        -t "${pkgdir}/usr/share/applications/"
    install -vDm644 openmeters.svg            -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
