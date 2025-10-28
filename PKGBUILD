# Maintainer:  NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: Albert Latham <me@albertlatham.com>
pkgname=deepagent-bin
pkgver=1.101.24301
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

sha256sums_x86_64=('b52f183c48b4ebddc8928eecb2aa4d56433836b9968c3a9af16c5c6fee529802')
sha256sums_aarch64=('718c695cc187544b290ca0e52ed11046420f75aa4afeedf029a0c0b4b967317b')

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
