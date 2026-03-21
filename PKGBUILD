# Maintainer: jscheema <jscheema@gmail.com>
pkgname=mediaarchiveorganizer
pkgver=3.0.3
pkgrel=1
pkgdesc="Automated Media Organization & AI Cleanup Tool"
arch=('any')
url="https://github.com/Undadfeated/Media_Archive_Organizer"
license=('MIT')
depends=('python-customtkinter' 'python-opencv' 'python-pillow' 'python-pip')
makedepends=()
provides=("${pkgname}")
source=("git+https://github.com/Undadfeated/Media_Archive_Organizer.git#tag=v${pkgver}")
sha256sums=('SKIP')
install="media-archive-organizer.install"

package() {
    cd "${srcdir}/Media_Archive_Organizer"

    # Install Python dependencies that are not available in AUR into the package dir
    # We use pip to install into the pkgdir
    python -m pip install --isolated --root="${pkgdir}" --prefix=/usr -r requirements.txt

    # Install application source
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r src "${pkgdir}/usr/share/${pkgname}/"
    install -Dm755 launcher.py "${pkgdir}/usr/share/${pkgname}/launcher.py"

    # Create launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash
cd /usr/share/${pkgname}
python launcher.py "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop entry and icon
    install -Dm644 media-archive-organizer.desktop "${pkgdir}/usr/share/applications/media-archive-organizer.desktop"
    install -Dm644 src/assets/icon.png "${pkgdir}/usr/share/pixmaps/media-archive-organizer.png"
}
