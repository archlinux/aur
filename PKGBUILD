# Maintainer: Paul Harvey <hed-phsuarnaba@smu.edu.ph>
pkgname=hyprsettings-git
pkgver=0.1.6   # placeholder; real version set by pkgver()
pkgrel=1
pkgdesc="Configurator for Hyprland (alpha, development version, git snapshot)"
arch=('x86_64')
url="https://github.com/acropolis914/hyprsettings"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'python-pywebview' 'python-tomlkit' 'python-rich' 'webkit2gtk')
makedepends=('git')
provides=('hyprsettings')
conflicts=('hyprsettings')
source=("$pkgname::git+https://github.com/acropolis914/hyprsettings.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local desc tag ver rev commit
  if desc=$(git describe --tags --long --match 'v*' --abbrev=7 2>/dev/null); then
    # Example: v0.1.6alpha-20-ge8ad6b7
    tag=${desc%%-*}                      # v0.1.6alpha
    rev=${desc#*-}; rev=${rev%%-*}       # 20
    commit=${desc##*-}; commit=${commit#g}  # e8ad6b7
    ver=${tag#v}                         # 0.1.6alpha
    printf "%s.r%s.g%s" "$ver" "$rev" "$commit"
  else
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
    # Directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/hyprsettings-git"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"

    # Copy source tree
    cp -a "$srcdir/$pkgname/." "$pkgdir/usr/lib/hyprsettings-git/"

    # Ensure main entry script is executable & has shebang
    if ! grep -q '^#!' "$pkgdir/usr/lib/hyprsettings-git/src/ui.py"; then
        sed -i '1i #!/usr/bin/env python3' "$pkgdir/usr/lib/hyprsettings-git/src/ui.py"
    fi
    chmod 755 "$pkgdir/usr/lib/hyprsettings-git/src/ui.py"

    # Wrapper (always uses python3; safe even if ui.py exec bit missing)
    cat > "$pkgdir/usr/bin/hyprsettings" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/lib/hyprsettings-git/src/ui.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/hyprsettings"

    # Desktop entry
    cat > "$pkgdir/usr/share/applications/hyprsettings.desktop" <<'EOF'
[Desktop Entry]
Name=HyprSettings
Comment=Configurator for Hyprland
Exec=hyprsettings
Icon=hyprsettings
Terminal=false
Type=Application
Categories=Utility;
StartupNotify=true
EOF
    chmod 644 "$pkgdir/usr/share/applications/hyprsettings.desktop"

    # Icon
    install -m644 "$srcdir/$pkgname/assets/icon-48.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/hyprsettings.png"
}
