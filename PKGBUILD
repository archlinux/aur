# Maintainer: jscheema <jscheema@gmail.com>
pkgname=mediaarchiveorganizer
pkgver=3.0.9
pkgrel=1
pkgdesc="Automated Media Organization & AI Cleanup Tool"
arch=('any')
url="https://github.com/UnDadFeated/Media_Archive_Organizer"
license=('MIT')
depends=('python-customtkinter' 'python-opencv' 'python-pillow' 'python-piexif' 'python-send2trash' 'python-numpy' 'python-protobuf' 'python-attrs' 'python-flatbuffers' 'python-absl' 'python-sounddevice')
makedepends=()
provides=("${pkgname}")
source=("git+https://github.com/UnDadFeated/Media_Archive_Organizer.git#tag=v${pkgver}")
sha256sums=('SKIP')
install="mediaarchiveorganizer.install"

package() {
    cd "${srcdir}/Media_Archive_Organizer"

    # Pragmatic fix for broken python-mediapipe AUR package
    python -m pip install mediapipe --root="${pkgdir}" --prefix=/usr --no-deps --ignore-installed

    # Install application source
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -r src "${pkgdir}/usr/share/${pkgname}/"
    install -Dm644 launcher.py "${pkgdir}/usr/share/${pkgname}/launcher.py"

    # Create launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/python
import os
import sys

# Ensure the app can find its internal src modules
sys.path.append('/usr/share/${pkgname}/src')
os.chdir('/usr/share/${pkgname}')

# Execute the main application
from ui.app import App
if __name__ == "__main__":
    app = App()
    app.mainloop()
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop entry and icon
    install -Dm644 "mediaarchiveorganizer.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 src/assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
