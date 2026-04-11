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
options=(!strip)
source=("lem-appimage::https://github.com/lem-project/lem/releases/download/nightly-latest/Lem-x86_64.AppImage")
sha256sums=('f4ce7a02c51bcf7fa3c388f1ef22b8acd9e48222869e5a5a63350440111e6da9')

package() {
    # Install AppImage to /opt/
    install -Dm755 "lem-appimage" "${pkgdir}/opt/lem-editor/lem.AppImage"

    # Create wrapper script that uses --appimage-extract-and-run
    # This avoids the FUSE dependency entirely while preserving the AppImage environment
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/lem" << 'EOF'
#!/bin/bash
exec /opt/lem-editor/lem.AppImage --appimage-extract-and-run "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/lem"

    # Create a symlink for the -editor variant
    ln -s "lem" "${pkgdir}/usr/bin/lem-editor"
}
