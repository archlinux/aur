# Maintainer:  NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: Albert Latham <me@albertlatham.com>
pkgname=codellm
pkgver=1.101.23604
pkgrel=1
pkgdesc="AI code editor that enhances developer productivity, bundled with the AI super assistant, ChatLLM"
arch=('x86_64' 'aarch64')
url="https://github.com/abacusai/codellm-releases"
license=('custom')
# depends=('gtk3' 'libxss' 'gconf' 'libxtst' 'xdg-utils' 'libnss' 'gcc-libs' 'alsa-lib')
depends=()
options=(!debug)
optdepends=('libgnome-keyring: for keyring support'
           'bash-completion: for bash completions'
           'zsh-completions: for zsh completions')
provides=('codellm')
conflicts=('codellm-bin')

source_x86_64=("https://github.com/abacusai/codellm-releases/releases/download/${pkgver}/CodeLLM-linux-x64-${pkgver}.tar.gz")
source_aarch64=("https://github.com/abacusai/codellm-releases/releases/download/${pkgver}/CodeLLM-linux-arm64-${pkgver}.tar.gz")

sha256sums_x86_64=('48976fe601f72bd699e4ede81951ec270ef875018fa24d3803def11d757dd5d7')
sha256sums_aarch64=('1451303611e72b271e1e005ae34a5a633a79e7024754a784ee6c8cc6e3279cc9')

package() {
    cd "$srcdir"

    # Create installation directory
    install -dm755 "$pkgdir/opt/codellm"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Copy application files
    cp -r ./* "$pkgdir/opt/codellm/"

    # Make the main executable... executable
    chmod +x "$pkgdir/opt/codellm/codellm"

    # Create symlink in /usr/bin
    ln -s "/opt/codellm/codellm" "$pkgdir/usr/bin/codellm"

    # Create desktop entry
    cat > "$pkgdir/usr/share/applications/codellm.desktop" << EOF
[Desktop Entry]
Name=CodeLLM
Comment=AI code editor that enhances developer productivity
Exec=/opt/codellm/codellm %U
Terminal=false
Type=Application
Icon=codellm
StartupWMClass=CodeLLM
Categories=Development;IDE;
MimeType=text/plain;inode/directory;
EOF

    # Install icon (assuming there's an icon in the package)
    if [ -f "$pkgdir/opt/codellm/resources/app/resources/linux/code.png" ]; then
        install -Dm644 "$pkgdir/opt/codellm/resources/app/resources/linux/code.png" "$pkgdir/usr/share/pixmaps/codellm.png"
    fi

    # Install bash completions
    if [ -f "$pkgdir/opt/codellm/resources/completions/bash/codellm" ]; then
        install -dm755 "$pkgdir/usr/share/bash-completion/completions"
        install -Dm644 "$pkgdir/opt/codellm/resources/completions/bash/codellm" \
                       "$pkgdir/usr/share/bash-completion/completions/codellm"
    fi

    # Install zsh completions
    if [ -f "$pkgdir/opt/codellm/resources/completions/zsh/_codellm" ]; then
        install -dm755 "$pkgdir/usr/share/zsh/site-functions"
        install -Dm644 "$pkgdir/opt/codellm/resources/completions/zsh/_codellm" \
                       "$pkgdir/usr/share/zsh/site-functions/_codellm"
    elif [ -f "$pkgdir/opt/codellm/resources/completions/zsh/codellm" ]; then
        # Alternative: if the zsh completion file is named 'codellm' instead of '_codellm'
        install -dm755 "$pkgdir/usr/share/zsh/site-functions"
        install -Dm644 "$pkgdir/opt/codellm/resources/completions/zsh/codellm" \
                       "$pkgdir/usr/share/zsh/site-functions/_codellm"
    fi
}
