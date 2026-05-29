# Maintainer: Luiz Silva <luizsv.dev@gmail.com>
# Previous maintainer: Patrick Fischer <aur@pathin.me>
# Revived package with updated upstream tarball
pkgname=windsurf-bin
pkgver=2.3.15
pkgrel=1
pkgdesc="The new purpose-built IDE to harness magic (binary pre-built version)"
arch=('x86_64')
url="https://windsurf.com/"
license=('LicenseRef-Windsurf Editor')
depends=(
    'glibc>=2.28'
    'gcc-libs'
    'gtk3'
    'nss'
    'mesa'
    'alsa-lib'
    'libsecret'
    'libxss'
    'libxtst'
    'xdg-utils'
    'libxkbcommon'
    'dbus'
    'expat'
    'libcups'
    'util-linux-libs'
)
optdepends=(
    'libnotify: Desktop notifications'
    'org.freedesktop.secrets: Keyring support'
    'libdbusmenu-glib: KDE global menu'
    'gtk2: GTK2 theme support'
    'gvfs: Trash functionality'
)
options=('!strip')
conflicts=('windsurf')
provides=('windsurf')
replaces=('windsurf')
install=windsurf-bin.install

# Download URL from Windsurf API
# To update: curl -s https://windsurf-stable.codeium.com/api/update/linux-x64/stable/latest | jq -r '.url'
# Then update pkgver and the URL below
_url="https://windsurf-stable.codeiumdata.com/linux-x64/stable/c46c49e94b4d3f41181204d59809d8f1b2c48d68/Windsurf-linux-x64-${pkgver}.tar.gz"
source=("windsurf-${pkgver}.tar.gz::$_url")
sha256sums=('cffdd3e01715f2a9b271b026a26cf204308915bcb4851b6103b30ef7a2d52deb')

build() {
    # Extract the tarball
    tar -xzf "$srcdir/windsurf-${pkgver}.tar.gz" -C "$srcdir"
}

package() {
    # The tarball extracts to a directory named "Windsurf"
    _appdir="$srcdir/Windsurf"
    
    # Install to /opt/windsurf
    install -dm755 "$pkgdir/opt/windsurf"
    cp -r "$_appdir"/* "$pkgdir/opt/windsurf/"
    
    # Create symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/windsurf/windsurf" "$pkgdir/usr/bin/windsurf"
    
    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/windsurf.desktop" << EOF
[Desktop Entry]
Name=Windsurf
Comment=The new purpose-built IDE to harness magic
GenericName=Text Editor
Exec=/usr/bin/windsurf %U
Icon=windsurf
Type=Application
MimeType=x-scheme-handler/windsurf;x-scheme-handler/codeium;
Categories=Development;IDE;TextEditor;
StartupNotify=true
StartupWMClass=Windsurf
EOF
    
    # Install icon
    install -Dm644 "$pkgdir/opt/windsurf/resources/app/out/media/code-icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/windsurf.svg"
    
    # Fix permissions
    chmod 755 "$pkgdir/opt/windsurf/windsurf"
}
