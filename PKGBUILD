# Maintainer: Paul Harvey <hed-phsuarnaba@smu.edu.ph>
pkgname=hyprsettings-git
pkgver=0.6.1.r3.g347dff6
pkgrel=1
pkgdesc="Configurator for Hyprland (alpha, development version, git snapshot)"
arch=('x86_64')
url="https://github.com/acropolis914/hyprsettings"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'python-pywebview' 'python-tomlkit' 'python-rich' 'webkit2gtk' 'python-packaging')
makedepends=('git')
provides=('hyprsettings')
conflicts=('hyprsettings')
source=("$pkgname::git+https://github.com/acropolis914/hyprsettings.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git fetch --tags
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    # 1. Install directories
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"

    # 2. Copy source code
    cp -r --no-preserve=ownership "$srcdir/$pkgname"/* "$pkgdir/usr/lib/$pkgname/"

    # Clean up git artifacts
    rm -rf "$pkgdir/usr/lib/$pkgname/.git"
    rm -rf "$pkgdir/usr/lib/$pkgname/.gitignore"

    # 3. Optimize Python (Compile Bytecode)
    # The -d flag ensures the compiled files point to /usr/lib, not the temporary build dir
    python -m compileall -d "/usr/lib/$pkgname" -q "$pkgdir/usr/lib/$pkgname"

    # 4. Create Internal run.sh (Relative)
    # This script runs ui.py relative to itself.
    # We use 'dirname $0' so it works regardless of where /usr/lib is located.
    cat > "$pkgdir/usr/lib/$pkgname/run.sh" <<EOF
#!/usr/bin/env bash
cd "\$(dirname "\$0")"
exec python3 src/ui.py "\$@"
EOF
    chmod 755 "$pkgdir/usr/lib/$pkgname/run.sh"

    # 5. Create System Wrapper (Absolute)
    # This is the only file with a hardcoded path.
    cat > "$pkgdir/usr/bin/hyprsettings" <<EOF
#!/usr/bin/env bash
exec /usr/lib/$pkgname/run.sh "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/hyprsettings"

    # 6. Install Desktop Entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/hyprsettings.desktop" <<EOF
[Desktop Entry]
Name=HyprSettings
Comment=A gui configurator for Hyprland
Exec=hyprsettings
Icon=hyprsettings
Terminal=false
Type=Application
Categories=Utility;
StartupNotify=true
EOF
    chmod 644 "$pkgdir/usr/share/applications/hyprsettings.desktop"

    # 7. Install Icon
    install -Dm644 "$srcdir/$pkgname/assets/icon-48.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/hyprsettings.png"

    # 8. Install License
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}