# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>
pkgname=metadata
pkgver=0.3.0
pkgrel=2
_tag='0.3.0'
pkgdesc='Qt 6 metadata editor with Office and OpenDocument support'
arch=('x86_64')
url='https://github.com/yousefvand/metadata'
license=('MIT')
depends=('qt6-base' 'libzip' 'perl-image-exiftool' 'qpdf' 'hicolor-icon-theme')
optdepends=('dolphin: Show metadata context-menu integration')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('a64b4e02b514aa0fccd6e1cb0b61202b910278b2fb40934e3ab23914fb65faf9')

prepare() {
    cd "metadata-${_tag}"
    # Keep the published 0.3.0 tag immutable and correct the original generic
    # Dolphin action icon at package-build time.
    sed -i 's/^Icon=document-properties$/Icon=io.github.yousefvand.metadata/' \
        integration/dolphin/metadata-show.desktop
}

build() {
    cmake -S "metadata-${_tag}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DOLPHIN_SERVICE_MENU=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    # Also install the icon in the Actions context so Dolphin can resolve it
    # regardless of the active icon theme's inheritance behavior.
    install -Dm644 \
        "metadata-${_tag}/resources/io.github.yousefvand.metadata.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/actions/io.github.yousefvand.metadata.svg"
}
