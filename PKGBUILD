# Maintainer: ComputerElite <ComputerElite.dev@gmail.com>
pkgname=sym-dirs
pkgver=1.0.0
pkgrel=1
pkgdesc="A C# console application for managing hard links between multiple directories"
arch=('x86_64')
url="https://github.com/ComputerElite/SymDirs"
license=('GPL3')
depends=(
    'gtk3'
    'libnotify'
    'libsystemd'
    'xdg-utils'
)
source=("https://github.com/ComputerElite/SymDirs/releases/download/${pkgver}/sym_dirs_linux_x64.refs.tags.${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    # Create installation directories
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"

    # Extract and copy release files
    tar -xzf "$srcdir/sym_dirs_linux_x64.refs.tags.${pkgver}.tar.gz" -C "$pkgdir/opt/$pkgname"

    # Create symlink for binary
    ln -s "/opt/$pkgname/sym-dirs" "$pkgdir/usr/bin/sym-dirs"

    # Desktop file handling (create if not included in release)
    install -d "$pkgdir/usr/share/applications"
    cat << EOF > "$pkgdir/usr/share/applications/sym-dirs.desktop"
[Desktop Entry]
Name=SymDirs
Comment=${pkgdesc}
Exec=/usr/bin/sym-dirs
Terminal=true
Type=Application
Categories=Utility;
EOF

    # License file (if included in release)
    if [ -f "$pkgdir/opt/$pkgname/LICENSE" ]; then
        install -Dm644 "$pkgdir/opt/$pkgname/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}