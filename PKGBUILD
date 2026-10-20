# Maintainer: czyt <czytcn@gmail.com>
pkgname=pdf-math-reader-bin
pkgver=0.1.13
pkgrel=2
pkgdesc="Read scientific documents in your language, in realtime, on any platform"
arch=('x86_64')
url="https://github.com/PDFMathTranslate/PDFMathReader"
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'avahi'
  'dbus'
  'gtk3'
  'gnutls'
  'mesa'
  'nss'
  'xdg-utils'
)
provides=('pdf-math-reader')
conflicts=('pdf-math-reader')
options=('!strip' '!debug' '!emptydirs')
source_x86_64=(
  "PDFMathReader-linux-x64.tar.gz::https://github.com/PDFMathTranslate/PDFMathReader/releases/download/v${pkgver}/PDFMathReader-linux-x64.tar.gz"
  "pdf-math-reader.png"
)
sha256sums_x86_64=('65a1a6a4263c9b4e90a6922c7de1b93951c5ad21f9fb22a1ea8af91650135474'
                   '710e0cde4e5a31a846f358ce702b68d84385c1282017bda83fc547e36726bb91')

package() {
    local _dir="PDFMathReader-linux-x64"

    # Electron runtime tree extracted verbatim
    install -dm755 "${pkgdir}/usr/lib/pdf-math-reader"
    cp -a "${srcdir}/${_dir}/." "${pkgdir}/usr/lib/pdf-math-reader/"

    # Launcher
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/pdf-math-reader" <<'EOF'
#!/bin/bash
exec /usr/lib/pdf-math-reader/PDFMathReader "$@"
EOF

    # Desktop entry (upstream tar.gz ships none)
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pdf-math-reader.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PDFMathReader
Comment=Read scientific documents in your language, in realtime
Exec=pdf-math-reader %F
Icon=pdf-math-reader
Terminal=false
Categories=Office;Education;Science;
MimeType=application/pdf;
StartupWMClass=PDFMathReader
EOF

    install -Dm644 "${srcdir}/pdf-math-reader.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pdf-math-reader.png"

    # Electron sandbox helper needs root ownership + setuid
    chmod 4755 "${pkgdir}/usr/lib/pdf-math-reader/chrome-sandbox"

    install -Dm644 "${srcdir}/${_dir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
