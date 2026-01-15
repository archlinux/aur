# Maintainer: Andrew Johnson <ajohnson@fluree.com>
pkgname=yati-bin
pkgver=0.1.0_rc7
pkgrel=1
pkgdesc='Lightweight desktop app for team visibility and alignment'
arch=('x86_64')
url='https://github.com/fluree/yati'
license=('MIT')
provides=('yati')
conflicts=('yati' 'yati-git')
depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=('binutils')
options=('!strip' '!debug')
# _realver is the upstream version (may contain hyphens for pre-releases)
# pkgver is the AUR-compatible version (hyphens replaced with underscores)
_realver=0.1.0-rc7
source=("${pkgname}-${pkgver}.deb::https://github.com/fluree/yati/releases/download/v${_realver}/yati_${_realver}_amd64.deb")
sha256sums=('c71874edde5066f08d3c63cf1e912cc575a8dbc9fe7ee5b1c4d701f64961d40f')

package() {
    cd "${srcdir}"
    ar x "${pkgname}-${pkgver}.deb"

    # Handle multiple compression formats (Tauri uses different formats across versions)
    if [[ -f data.tar.gz ]]; then
        tar -xzf data.tar.gz -C "${pkgdir}"
    elif [[ -f data.tar.zst ]]; then
        tar --zstd -xf data.tar.zst -C "${pkgdir}"
    elif [[ -f data.tar.xz ]]; then
        tar -xJf data.tar.xz -C "${pkgdir}"
    fi

    # Fix permissions
    chmod -R g-w "${pkgdir}"
}
