# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=openmeters
pkgver=1.15.1
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
sha256sums=('673ac4df8553fbb1b14c98b38f5fe5ca729d6213b24f8e8ad6a97b1ce20eac85')
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
    install -Dm755 target/release/openmeters "${pkgdir}/usr/bin/openmeters"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 misc/openmeters.desktop "${pkgdir}/usr/share/applications/openmeters.desktop"
    install -Dm644 misc/openmeters.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openmeters.svg"
}
