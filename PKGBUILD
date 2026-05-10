# Maintainer: Paul Harvey <hed-phsuarnaba@smu.edu.ph>
pkgname=hyprsettings-git
pkgver=0.9.3.r85.g651b6c5
pkgrel=1
pkgdesc="Configurator for Hyprland (alpha, development version, git snapshot)"
arch=('x86_64')
url="https://github.com/acropolis914/hyprsettings"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'python-pywebview' 'python-tomlkit' 'python-rich' 'webkit2gtk' 'python-packaging' 'python-flask' 'python-dotenv' 'python-flask-cors')
makedepends=('git')
provides=('hyprsettings')
conflicts=('hyprsettings')
source=("$pkgname::git+https://github.com/acropolis914/hyprsettings.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git fetch --tags

    local tag commit_count hash base
    tag=$(git describe --tags --abbrev=0)

    # Sanitize: replace &, space, /, - with _
    base=${tag//&/_}
    base=${base// /_}
    base=${base//\//_}
    base=${base//-/_}   # <- replace hyphens

    commit_count=$(git rev-list "$tag"..HEAD --count)
    hash=$(git rev-parse --short HEAD)

    echo "${base}.r${commit_count}.g${hash}"
}

package() {
    # 1. Create install dirs
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"

    # 2. Copy only what's needed
    cp -r --no-preserve=ownership "$srcdir/$pkgname/src" "$pkgdir/usr/lib/$pkgname/"
    cp -r --no-preserve=ownership "$srcdir/$pkgname/assets/icon-48.png" "$pkgdir/usr/lib/$pkgname/"

    # 3. Remove unnecessary src/ui-src after copy
    rm -rf "$pkgdir/usr/lib/$pkgname/src/ui-src"

    # 4. Compile Python bytecode
    python -m compileall -d "/usr/lib/$pkgname" -q "$pkgdir/usr/lib/$pkgname"

    # 5. Internal run.sh
    echo "$(date '+%Y-%m-%d %H:%M:%S')" >> "$pkgdir/usr/lib/$pkgname/.aur-installed"
    cat > "$pkgdir/usr/lib/$pkgname/run.sh" <<EOF
#!/usr/bin/env sh
cd "\$(dirname "\$0")"
exec python3 src/hyprsettings "\$@"
EOF
    chmod 755 "$pkgdir/usr/lib/$pkgname/run.sh"

    # 6. System wrapper
    cat > "$pkgdir/usr/bin/hyprsettings" <<EOF
#!/usr/bin/env sh
exec /usr/lib/$pkgname/run.sh "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/hyprsettings"

    # 7. Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/hyprsettings_aur.desktop" <<EOF
[Desktop Entry]
Name=HyprSettings
Comment=A GUI configurator for Hyprland
Exec=/usr/bin/hyprsettings
Icon=hyprsettings
Terminal=false
Type=Application
Categories=Utility;
StartupNotify=true
EOF
    chmod 644 "$pkgdir/usr/share/applications/hyprsettings_aur.desktop"

    # 8. Icon
    install -Dm644 "$srcdir/$pkgname/assets/icon-48.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/hyprsettings.png"

    # 9. License
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
