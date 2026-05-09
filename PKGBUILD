# Maintainer:  NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: Albert Latham <me@albertlatham.com>
pkgname=abacusai-bin
pkgver=1.106.21603
pkgrel=1
pkgdesc="A powerful desktop AI assistant with agentic browsing, listening, coding CLI and editor"
arch=('x86_64' 'aarch64')
url="https://github.com/abacusai/deepagent-releases"
license=('custom')
depends=()
options=(!debug)
optdepends=('libgnome-keyring: for keyring support'
           'bash-completion: for bash completions'
           'zsh-completions: for zsh completions')
provides=('abacusai-bin')
conflicts=('deepagent-bn' 'deepagent' 'codellm' 'codellm-bin')

source_x86_64=("https://github.com/abacusai/deepagent-releases/releases/download/${pkgver}/AbacusAI-linux-x64-${pkgver}.tar.gz")
source_aarch64=("https://github.com/abacusai/deepagent-releases/releases/download/${pkgver}/AbacusAI-linux-arm64-${pkgver}.tar.gz")

sha256sums_x86_64=('7a51fa8996fad6c66d5ce58fc188f6afd3ecc9fc612bd59f3dfc06cc9827b7cc')
sha256sums_aarch64=('545a27f8c97cb87b9107cda25cec441ea5c26f8a1af850dc05a29d15bd9de6d5')

package() {
    cd "$srcdir"

    # Create installation directory
    install -dm755 "$pkgdir/opt/abacusai"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Copy application files
    cp -r ./* "$pkgdir/opt/abacusai/"

    # Make the main executable... executable
    chmod +x "$pkgdir/opt/abacusai/abacusai-app"

    # Create symlink in /usr/bin
    ln -s "/opt/abacusai/abacusai-app" "$pkgdir/usr/bin/abacusai-app"

    # Create desktop entry
    cat > "$pkgdir/usr/share/applications/abacusai.desktop" << EOF
[Desktop Entry]
Name=AbacusAI
Comment=AI code editor that enhances developer productivity
Exec=/opt/abacusai/abacusai-app %U
Terminal=false
Type=Application
Icon=abacusai
StartupWMClass=AbacusAI
Categories=Development;IDE;
MimeType=text/plain;inode/directory;
EOF

    # Install icon (assuming there's an icon in the package)
    if [ -f "$pkgdir/opt/abacusai/resources/app/resources/linux/code.png" ]; then
        install -Dm644 "$pkgdir/opt/abacusai/resources/app/resources/linux/code.png" "$pkgdir/usr/share/pixmaps/abacusai.png"
    fi

    # Install bash completions
    if [ -f "$pkgdir/opt/abacusai/resources/completions/bash/abacusai-app" ]; then
        install -dm755 "$pkgdir/usr/share/bash-completion/completions"
        install -Dm644 "$pkgdir/opt/abacusai/resources/completions/bash/abacusai-app" \
                       "$pkgdir/usr/share/bash-completion/completions/abacusai"
    fi

    # Install zsh completions
    if [ -f "$pkgdir/opt/abacusai/resources/completions/zsh/_abacusai-app" ]; then
        install -dm755 "$pkgdir/usr/share/zsh/site-functions"
        install -Dm644 "$pkgdir/opt/abacusai/resources/completions/zsh/_abacusai-app" \
                       "$pkgdir/usr/share/zsh/site-functions/_abacusai-app"
    elif [ -f "$pkgdir/opt/abacusai/resources/completions/zsh/abacusai-app" ]; then
        # Alternative: if the zsh completion file is named 'abacusai' instead of '_abacusai'
        install -dm755 "$pkgdir/usr/share/zsh/site-functions"
        install -Dm644 "$pkgdir/opt/abacusai/resources/completions/zsh/abacusai-app" \
                       "$pkgdir/usr/share/zsh/site-functions/_abacusai-app"
    fi
}
