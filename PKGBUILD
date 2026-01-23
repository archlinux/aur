# Maintainer: FrancoStino <info@davideladisa.it>
pkgname=antigravity-manager-git
pkgver=r0.0000000
pkgrel=2
pkgdesc="Professional multi-account manager for Google Gemini & Claude AI (git version)"
arch=('x86_64')
url="https://github.com/Draculabo/AntigravityManager"
license=('LicenseRef-CC-BY-NC-SA-4.0')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('git' 'nodejs' 'npm' 'python')
optdepends=(
    'libappindicator-gtk3: system tray support'
    'libnotify: desktop notifications'
)
provides=('antigravity-manager')
conflicts=('antigravity-manager' 'antigravity-manager-bin')
source=("${pkgname}::git+https://github.com/Draculabo/AntigravityManager.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    
    # Install dependencies
    npm install
    
    # Build the application
    npm run make
}

package() {
    cd "${srcdir}/${pkgname}"
    
    # Install the application
    install -dm755 "${pkgdir}/opt/antigravity-manager"
    
    # Copy built files (adjust path based on actual build output)
    cp -r out/make/deb/x64/antigravity-manager-linux-x64/* "${pkgdir}/opt/antigravity-manager/" || \
    cp -r out/antigravity-manager-linux-x64/* "${pkgdir}/opt/antigravity-manager/"
    
    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/antigravity-manager/antigravity-manager" "${pkgdir}/usr/bin/antigravity-manager"
    
    # Install desktop entry
    install -Dm644 "${srcdir}/../antigravity-manager.desktop" \
        "${pkgdir}/usr/share/applications/antigravity-manager.desktop"
    
    # Install icon
    install -Dm644 "docs/assets/logo.png" \
        "${pkgdir}/usr/share/pixmaps/antigravity-manager.png"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
