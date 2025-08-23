# Maintainer:  NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: Albert Latham <me@albertlatham.com>
pkgname=codellm
pkgver=1.101.23309
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

sha256sums_x86_64=('d5f797da0e8af26f18b82d76fdd199679b451e42667609123f37a7b5f79941f9')
sha256sums_aarch64=('689745b488fae579c9378652f0cda886455d0d3fa15f6906dd76ce4fe424072c')

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
