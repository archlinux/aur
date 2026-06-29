# Maintainer: AnimaZed Team <team@animazed.dev>
# Based on animazed-git AUR package

pkgname="animazed-bin"
pkgver="1.9.0"
pkgrel="1"
pkgdesc="High-performance multiplayer code editor (AnimaZed fork) - Binary version"
arch=('x86_64')
url="https://github.com/animaios/animazed"
license=('Apache-2.0' 'GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'libxcb'
    'libxkbcommon'
    'wayland'
    'libgl'
    'fontconfig'
    'freetype2'
    'alsa-lib'
    'glib2'
    'libva'
    'zstd'
    'sqlite'
    'pipewire'
    'xdg-desktop-portal'
)
optdepends=(
    'git: for git integration'
    'nodejs: for language servers'
    'python: for language servers'
    'rust: for rust-analyzer'
    'docker: for dev containers'
    'ssh: for remote development'
)
provides=('animazed' 'zed')
conflicts=('animazed' 'zed' 'zed-git' 'zed-preview' 'zed-nightly')
source=("https://github.com/animaios/animazed/releases/download/nightly/zed-linux-x86_64-nightly.zip")
sha256sums=('SKIP')

pkgver() {
    echo "${pkgver}"
}

prepare() {
    cd "${srcdir}"

    msg2 "Extracting release artifact..."
    bsdtar -xf zed-linux-x86_64-nightly.zip

    if [[ ! -f release/zed ]]; then
        error "Expected release/zed binary not found in artifact"
        ls -la release/ 2>/dev/null || true
        return 1
    fi
}

package() {
    cd "${srcdir}/release"

    # Install main binary
    install -Dm755 zed "${pkgdir}/usr/bin/animazed-editor"

    # Install remote server
    install -Dm755 remote_server "${pkgdir}/usr/libexec/animazed-remote-server"

    # Install CLI binary
    install -Dm755 cli "${pkgdir}/usr/bin/animazed"

    # Create symlinks for compatibility
    ln -sf animazed "${pkgdir}/usr/bin/zed"
    ln -sf animazed-editor "${pkgdir}/usr/bin/zed-editor"

    # Install desktop entry
    cat > "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop" <<'EOF'
[Desktop Entry]
Name=AnimaZed
Comment=High-performance, multiplayer code editor
Exec=animazed %U
Icon=animazed
Terminal=false
Type=Application
Categories=Utility;TextEditor;IDE;
MimeType=text/plain;application/x-zed-zd;
StartupNotify=true
Actions=new-window;new-tab;
EOF

    # Install icons
    install -Dm644 "${srcdir}/../crates/zed/resources/app-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/animazed.png"
    ln -sf animazed.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zed.png"

    # Install metainfo for software centers
    cat > "${pkgdir}/usr/share/metainfo/dev.zed.Zed.metainfo.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>dev.zed.Zed</id>
  <name>AnimaZed</name>
  <project_license>LicenseRef-AnimaZed</project_license>
  <description>
    <p>High-performance, multiplayer code editor built from the AnimaZed fork of Zed.</p>
  </description>
  <url type="homepage">https://github.com/animaios/animazed</url>
  <icon type="replace">/usr/share/icons/hicolor/512x512/apps/animazed.png</icon>
</component>
EOF

    # Install systemd user service for remote server
    cat > "${pkgdir}/usr/lib/systemd/user/animazed-remote-server.service" <<'EOF'
[Unit]
Description=AnimaZed Remote Server
After=network.target

[Service]
ExecStart=/usr/libexec/animazed-remote-server
Restart=always
RestartSec=3

[Install]
WantedBy=default.target
EOF

    # Install licenses
    install -Dm644 "${srcdir}/../LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "${srcdir}/../LICENSE-GPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL"
}
