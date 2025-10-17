# Maintainer:  NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: Albert Latham <me@albertlatham.com>
pkgname=deepagent-bin
pkgver=1.101.24129
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
provides=('deepagent-bin')
conflicts=('deepagent' 'codellm' 'codellm-bin')

source_x86_64=("https://github.com/abacusai/deepagent-releases/releases/download/${pkgver}/DeepAgent-linux-x64-${pkgver}.tar.gz")
source_aarch64=("https://github.com/abacusai/deepagent-releases/releases/download/${pkgver}/DeepAgent-linux-arm64-${pkgver}.tar.gz")

sha256sums_x86_64=('566082eb4e5efedf6be8301181b36aab0d47ad2cdd824169237e31d36bc6baeb')
sha256sums_aarch64=('424c25aa23b51db77ec88273f4e3973ddc70a31fd42a93a32a08c6f06fab6e2e')

package() {
    cd "$srcdir"

    # Create installation directory
    install -dm755 "$pkgdir/opt/deepagent"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    # Copy application files
    cp -r ./* "$pkgdir/opt/deepagent/"

    # Make the main executable... executable
    chmod +x "$pkgdir/opt/deepagent/deepagent-app"

    # Create symlink in /usr/bin
    ln -s "/opt/deepagent/deepagent-app" "$pkgdir/usr/bin/deepagent-app"

    # Create desktop entry
    cat > "$pkgdir/usr/share/applications/deepagent.desktop" << EOF
[Desktop Entry]
Name=DeepAgent
Comment=AI code editor that enhances developer productivity
Exec=/opt/deepagent/deepagent-app %U
Terminal=false
Type=Application
Icon=deepagent
StartupWMClass=DeepAgent
Categories=Development;IDE;
MimeType=text/plain;inode/directory;
EOF

    # Install icon (assuming there's an icon in the package)
    if [ -f "$pkgdir/opt/deepagent/resources/app/resources/linux/code.png" ]; then
        install -Dm644 "$pkgdir/opt/deepagent/resources/app/resources/linux/code.png" "$pkgdir/usr/share/pixmaps/deepagent.png"
    fi

    # Install bash completions
    if [ -f "$pkgdir/opt/deepagent/resources/completions/bash/deepagent-app" ]; then
        install -dm755 "$pkgdir/usr/share/bash-completion/completions"
        install -Dm644 "$pkgdir/opt/deepagent/resources/completions/bash/deepagent-app" \
                       "$pkgdir/usr/share/bash-completion/completions/deepagent"
    fi

    # Install zsh completions
    if [ -f "$pkgdir/opt/deepagent/resources/completions/zsh/_deepagent-app" ]; then
        install -dm755 "$pkgdir/usr/share/zsh/site-functions"
        install -Dm644 "$pkgdir/opt/deepagent/resources/completions/zsh/_deepagent-app" \
                       "$pkgdir/usr/share/zsh/site-functions/_deepagent-app"
    elif [ -f "$pkgdir/opt/deepagent/resources/completions/zsh/deepagent-app" ]; then
        # Alternative: if the zsh completion file is named 'deepagent' instead of '_deepagent'
        install -dm755 "$pkgdir/usr/share/zsh/site-functions"
        install -Dm644 "$pkgdir/opt/deepagent/resources/completions/zsh/deepagent-app" \
                       "$pkgdir/usr/share/zsh/site-functions/_deepagent-app"
    fi
}
