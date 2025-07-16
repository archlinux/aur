# Maintainer: ComputerElite <ComputerElite.dev@gmail.com>
pkgname=symdirs-bin
pkgver=1.0.2
pkgrel=1
replaces=("sym-dirs")
pkgdesc="A C# console application for managing links between multiple directories"
arch=('x86_64')
url="https://github.com/ComputerElite/SymDirs"
license=('GPL3')
depends=(
    'gtk3'
    'libnotify'
    'libsystemd'
    'xdg-utils'
)
source=("https://github.com/ComputerElite/SymDirs/releases/download/${pkgver}/symdirs_linux_x64.refs.tags.${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    # Create installation directories
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"

    # Extract and copy release files
    tar -xzf "$srcdir/symdirs_linux_x64.refs.tags.${pkgver}.tar.gz" -C "$pkgdir/opt/$pkgname"

    # Create symlink for binary
    ln -s "/opt/$pkgname/symdirs" "$pkgdir/usr/bin/symdirs"

    # Desktop file handling (create if not included in release)
    install -d "$pkgdir/usr/share/applications"
    cat << EOF > "$pkgdir/usr/share/applications/symdirs.desktop"
[Desktop Entry]
Name=SymDirs
Comment=${pkgdesc}
Exec=/usr/bin/symdirs
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