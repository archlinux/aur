# Maintainer: Markus Maiwald <markus@maiwald.work>
# Contributor: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe-hardened
pkgver=1.1.3
pkgrel=1
pkgdesc="Mistral Vibe - Minimal CLI Coding Agent (Security Hardened)"
# Security: AppArmor MAC profile, strict permissions, isolated environment
arch=('x86_64')
url="https://github.com/mistralai/mistral-vibe"
license=('Apache-2.0')
install=$pkgname.install
depends=('python')
makedepends=('uv')
optdepends=(
    'apparmor: Mandatory Access Control (MAC) security framework'
    'git: Version control integration for coding workflows'
)
provides=('mistral-vibe' 'vibe' 'vibe-acp')
conflicts=('mistral-vibe')
options=('!strip')
source=("git+${url}.git#tag=v${pkgver}"
        "vibe.apparmor"
        "SECURITY.md")
b2sums=('SKIP'
        'SKIP'
        'SKIP')

package() {
    cd "$srcdir"
    
    # Create a temporary location matching final install path
    # This ensures paths in virtualenv are correct
    local _tempdir="/tmp/mistral-vibe-build-$$"
    mkdir -p "$_tempdir/opt/mistral-vibe"
    
    # Use uv to install with correct final paths
    UV_TOOL_DIR="$_tempdir/opt/mistral-vibe" \
    UV_TOOL_BIN_DIR="$_tempdir/opt/mistral-vibe/bin" \
    uv tool install "$srcdir/mistral-vibe" --force
    
    # Fix paths in scripts to use /opt instead of temp path
    for script in "$_tempdir/opt/mistral-vibe/bin/"*; do
        if [ -f "$script" ]; then
            sed -i "s|$_tempdir||g" "$script" 2>/dev/null || true
        fi
    done
    
    # Fix paths in activate scripts and receipt
    find "$_tempdir/opt/mistral-vibe" -name "activate*" -o -name "*.toml" | while read f; do
        sed -i "s|$_tempdir||g" "$f" 2>/dev/null || true
    done
    
    # Copy to package directory
    install -d "$pkgdir/opt"
    cp -a "$_tempdir/opt/mistral-vibe" "$pkgdir/opt/"
    
    # Cleanup
    rm -rf "$_tempdir"
    
    # Create launcher wrapper scripts in /usr/bin
    install -d "$pkgdir/usr/bin"
    
    cat > "$pkgdir/usr/bin/vibe" <<'EOF'
#!/bin/bash
exec /opt/mistral-vibe/bin/vibe "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/vibe"
    
    cat > "$pkgdir/usr/bin/vibe-acp" <<'EOF'
#!/bin/bash
exec /opt/mistral-vibe/bin/vibe-acp "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/vibe-acp"
    
    # Desktop integration
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/mistral-vibe.desktop" <<EOF
[Desktop Entry]
Name=Mistral Vibe
Comment=Minimal CLI Coding Agent by Mistral AI
Exec=/usr/bin/vibe-acp
Icon=utilities-terminal
Type=Application
Categories=Development;TextEditor;Utility;
Terminal=true
Keywords=AI;Coding;Agent;Mistral;CLI;
EOF

    # AppArmor Profile (Security Enhancement)
    install -Dm644 "$srcdir/vibe.apparmor" "$pkgdir/usr/share/apparmor/vibe.apparmor"
    
    # Install Security Documentation
    install -Dm644 "$srcdir/SECURITY.md" "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
}
