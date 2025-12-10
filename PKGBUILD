# Maintainer: Markus Maiwald <markus@maiwald.work>
# Contributor: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe-bin-hardened
pkgver=1.0.5
pkgrel=1
pkgdesc="Mistral Vibe - Minimal CLI Coding Agent (Hardened Binary Distribution)"
# Hardening: Strict permissions, AppArmor profile, and minimal dependency enforcement.
arch=('x86_64')
url="https://github.com/mistralai/mistral-vibe"
license=('Apache-2.0')
install=$pkgname.install
depends=('glibc')
optdepends=(
    'apparmor: Mandatory Access Control (MAC) security framework'
    'git: Version control integration for coding workflows'
    'python: For advanced scripting and integration capabilities'
)
provides=('mistral-vibe' 'vibe' 'vibe-acp')
conflicts=('mistral-vibe')
options=('!strip')
source=("https://github.com/mistralai/mistral-vibe/releases/download/v${pkgver}/vibe-acp-linux-x86_64-${pkgver}.zip"
        "vibe.apparmor"
        "vibe-launcher.sh"
        "SECURITY.md")
b2sums=('058ff09086de0e6a8ad0136551bd98ff0183a9ecd9559cd752580727fa50f26e78341398a6291d9c872198a4dc1d0e70bc6ab0f03c304a1d986141d5e2c2082d'
        'e554626b4a15c8f815a91264dbe464f29b6404af6609d4d46f4623466db4bd74a48be585ec044c645160828f81b59d74c826df0936ff11831a0ff9dab948ba9a'
        'becda8d9feac348091a4d6a9b5332d2ecee5af584c4e8da7ca7ba355996f52db38f8a5dac6fb0934774730ff9164a0f6279786b18fb6741af4910cefd94d3334'
        '1ce5106274b3f9fe6887d237454c23bba2db7a7b6a37e8f03664dbeb5fb59fda9fa7486e02f7c187abd55f065ec55905020f520b4ff863947914519a9acf5728')

package() {
    install -d "$pkgdir/opt/mistral-vibe"
    
    # Install the pre-compiled binary
    install -Dm755 "$srcdir/vibe-acp" "$pkgdir/opt/mistral-vibe/vibe-acp"
    
    # Strict permission model: Owner (root) only can modify
    # This prevents tampering and ensures integrity
    chmod 755 "$pkgdir/opt/mistral-vibe/vibe-acp"
    
    # Install launcher wrapper scripts that provide multiple entrypoints
    install -Dm755 vibe-launcher.sh "$pkgdir/usr/bin/vibe"
    install -Dm755 vibe-launcher.sh "$pkgdir/usr/bin/vibe-acp"
    
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

    # AppArmor Profile (Optional Security Enhancement)
    install -Dm644 vibe.apparmor "$pkgdir/usr/share/apparmor/vibe.apparmor"
    
    # Install Security Documentation
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
}
