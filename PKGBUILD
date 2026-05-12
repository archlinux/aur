# Maintainer: UnDadFeated
pkgname=chronoarchiver
pkgver=6.4.0
pkgrel=1
pkgdesc="Unified Media Archive Organizer and AV1 Encoder - Time to Archive!"
arch=('any')
url="https://github.com/UnDadFeated/ChronoArchiver"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/UnDadFeated/ChronoArchiver.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=chronoarchiver.install

package() {
    cd "${srcdir}/ChronoArchiver"
    
    # Create necessary directories
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"

    # Install main application files
    cp -rv src/* "${pkgdir}/usr/share/${pkgname}/"
    install -m644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/"
    
    # Install the launcher script (bootstrap creates venv on first run, then execs into app)
    printf '%s\n' '#!/bin/bash' "export PYTHONPATH=\"\${PYTHONPATH:+\$PYTHONPATH:}/usr/share/${pkgname}\"" "exec python /usr/share/${pkgname}/bootstrap.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -m644 "chronoarchiver.desktop" "${pkgdir}/usr/share/applications/chronoarchiver.desktop"
    
    # Install application icon (hicolor for modern DEs, pixmaps for legacy)
    install -m644 "src/ui/assets/icon.png" "${pkgdir}/usr/share/pixmaps/chronoarchiver.png"
    install -m644 "src/ui/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/chronoarchiver.png"
    install -m644 "src/ui/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/chronoarchiver.png"
}
