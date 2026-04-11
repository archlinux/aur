# Maintainer: Thomas Ramfjord <your-email@example.com>
pkgname=lem-editor
pkgver=nightly.20260410
pkgrel=1
pkgdesc="A Lisp-based text editor for the modern world"
arch=('x86_64')
url="https://github.com/lem-project/lem"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('lem-editor' 'lem')
conflicts=('lem' 'lem-git')
source=("lem-appimage::https://github.com/lem-project/lem/releases/download/nightly-latest/Lem-x86_64.AppImage")
sha256sums=('f4ce7a02c51bcf7fa3c388f1ef22b8acd9e48222869e5a5a63350440111e6da9')

prepare() {
    chmod +x "lem-appimage"
    # Extract AppImage (no FUSE required)
    ./lem-appimage --appimage-extract > /dev/null 2>&1
}

package() {
    # Install the extracted binary (no FUSE dependency needed)
    # The AppImage extracts to squashfs-root/ directory
    # Install the actual executable directly to /usr/bin/lem
    install -Dm755 "squashfs-root/usr/libexec/lem.real" "${pkgdir}/usr/bin/lem"

    # Create a symlink for the -editor variant
    ln -sf /usr/bin/lem "${pkgdir}/usr/bin/lem-editor" || true
}
