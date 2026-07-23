# Maintainer: code78 <cod378@proton.me>
pkgname=devin-desktop-bin
pkgver=3.5.17
pkgrel=1
pkgdesc="A team of agents for every engineer — Devin Desktop (binary pre-built version)"
arch=('x86_64')
url="https://devin.ai/desktop"
license=('LicenseRef-Devin Desktop')
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
conflicts=('devin-desktop' 'windsurf-bin' 'windsurf')
provides=('devin-desktop')
install=devin-desktop-bin.install

# Download URL from Devin/Windsurf API
# To update: curl -s https://windsurf-stable.codeium.com/api/update/linux-x64/stable/latest | jq -r '.url'
# Then update pkgver and the URL below
_url="https://windsurf-stable.codeiumdata.com/linux-x64/stable/2c489dfc762456657db8662309c0d5e76e886397/Devin-linux-x64-3.5.17.tar.gz"
source=("devin-desktop-${pkgver}.tar.gz::$_url")
sha256sums=('e7ce36c4baacc617a4d89b0e2fb4403f83b328fefd897aec1be5e31038be4e91')

build() {
    # Extract the tarball
    tar -xzf "$srcdir/devin-desktop-${pkgver}.tar.gz" -C "$srcdir"
}

package() {
    # The tarball extracts to a directory named "Devin"
    _appdir="$srcdir/Devin"

    # Install to /opt/devin-desktop
    install -dm755 "$pkgdir/opt/devin-desktop"
    cp -r "$_appdir"/* "$pkgdir/opt/devin-desktop/"

    # Create symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/devin-desktop/devin-desktop" "$pkgdir/usr/bin/devin-desktop"

    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/devin-desktop.desktop" << EOF
[Desktop Entry]
Name=Devin Desktop
Comment=A team of agents for every engineer
GenericName=Text Editor
Exec=/usr/bin/devin-desktop %U
Icon=devin-desktop
Type=Application
MimeType=x-scheme-handler/devin;x-scheme-handler/codeium;
Categories=Development;IDE;TextEditor;
StartupNotify=true
StartupWMClass=Devin Desktop
EOF

    # Install icon
    install -Dm644 "$pkgdir/opt/devin-desktop/resources/app/out/media/code-icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/devin-desktop.svg"

    # Fix permissions
    chmod 755 "$pkgdir/opt/devin-desktop/devin-desktop"
}
