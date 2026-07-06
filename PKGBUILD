# Maintainer: Arunachalam-gojosaturo <aur@luna-ai>
pkgname=luna-ai
pkgver=2.0.0
pkgrel=1
pkgdesc="Luna OS: Next-Gen Voice AI Assistant by Arunachalam. Driving Linux innovation across South India and beyond."
arch=('x86_64' 'aarch64')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=('python' 'python-pip' 'mpv' 'xdg-utils' 'polkit' 'webkit2gtk' 'gtk3')
makedepends=('npm' 'cargo' 'nodejs' 'git')
install=luna-ai.install
source=("luna-ai::git+https://github.com/Arunachalam-gojosaturo/Luna-ai.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/luna-ai"
    npm install
    npm run tauri build -- --bundles none
}

package() {
    cd "${srcdir}/luna-ai"

    # Install backend
    install -dm755 "${pkgdir}/opt/luna-os"
    cp -r backend "${pkgdir}/opt/luna-os/"
    install -Dm644 requirements.txt "${pkgdir}/opt/luna-os/requirements.txt"
    if [ -f ".env" ]; then
        install -Dm644 .env "${pkgdir}/opt/luna-os/.env"
    fi

    # Install executable
    install -dm755 "${pkgdir}/usr/local/bin"
    install -Dm755 src-tauri/target/release/app "${pkgdir}/usr/local/bin/luna-os"
    
    # Symlink to /usr/bin for standard AUR compliance
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/local/bin/luna-os "${pkgdir}/usr/bin/luna-os"
    ln -s /usr/local/bin/luna-os "${pkgdir}/usr/bin/luna-ai"

    # Desktop Icon
    install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/pixmaps/luna-os.png"

    # .desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/luna-os.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Luna OS
Comment=Luna OS AI Assistant
Exec=/usr/local/bin/luna-os
Icon=luna-os
Terminal=false
Type=Application
Categories=Utility;
DESKTOP

    # License
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
