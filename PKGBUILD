# Maintainer: Ryan C. <admin at thebrowserbay dot org>
pkgname=phantom-satellite-gtk3-bin
pkgver=34.2.0
pkgrel=1
pkgdesc="Phantom Satellite - Unofficial build of Pale Moon that aims to support older/niche platforms (GTK3)."
arch=('x86_64')
url="https://github.com/DCFUKSURMOM/Phantom-Satellite"
license=('MPL-2.0')
depends=('gtk3' 'libxt' 'dbus-glib' 'nss' 'ffmpeg4.4')
provides=("phantom-satellite=${pkgver}")
conflicts=('phantom-satellite' 'phantom-satellite-git')
options=(!strip)

pkgver() {
  curl -s https://api.github.com/repos/DCFUKSURMOM/Phantom-Satellite/releases/latest \
    | grep '"tag_name":' \
    | sed -E 's/.*"v([^"]+)".*/\1/'
}

source=("https://github.com/DCFUKSURMOM/Phantom-Satellite/releases/download/v${pkgver}/phantomsatellite-${pkgver}.linux-x86_64-gtk3.tar.xz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    # Extract
    tar -xJf "phantomsatellite-${pkgver}.linux-x86_64-gtk3.tar.xz"

    # Enter extracted folder
    cd "phantomsatellite"

    # Install browser files
    install -dm755 "${pkgdir}/opt/phantomsatellite"
    cp -r * "${pkgdir}/opt/phantomsatellite/"

    # Create launcher
    install -Dm755 "phantomsatellite" "${pkgdir}/opt/phantomsatellite/phantomsatellite"

    # Desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/phantom-satellite.desktop" << 'EOF'
[Desktop Entry]
Name=Phantom Satellite
Comment=Unofficial build of Pale Moon that aims to support older/niche platforms.
Exec=phantom-satellite %u
Icon=phantom-satellite
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=PhantomSatellite
Terminal=false
EOF

    # Icons
    for size in 16 32 48 64 128; do
        if [ -f "browser/chrome/icons/default/default${size}.png" ]; then
            install -Dm644 "browser/chrome/icons/default/default${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/phantom-satellite.png"
        fi
    done
}
