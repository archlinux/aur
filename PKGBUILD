# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>
pkgname=metadata
pkgver=0.4.0
pkgrel=1
_tag='0.4.0'
pkgdesc='Qt 6 metadata editor with MP3, Office and OpenDocument support'
arch=('x86_64')
url='https://github.com/yousefvand/metadata'
license=('MIT')
depends=('qt6-base' 'libzip' 'taglib' 'perl-image-exiftool' 'qpdf' 'hicolor-icon-theme')
optdepends=('dolphin: Show metadata context-menu integration')
makedepends=('cmake' 'ninja' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('5d3cac8e98ba6d7d3b2f3abce51af875644407200ae4ea77db65a6b56a6d579b')

prepare() {
    cd "metadata-${_tag}"
    # Keep release sources immutable while ensuring the Dolphin action uses
    # the application icon.
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
