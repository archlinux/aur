# Maintainer: Icarus-Alpha <your-email@example.com>
pkgname=readany-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="An AI-powered e-book reader with semantic search, intelligent chat, and knowledge management"
arch=('x86_64')
url="https://github.com/codedogQBY/ReadAny"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=('binutils')
options=('!strip' '!debug')
provides=('readany')
conflicts=('readany')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/codedogQBY/ReadAny/releases/download/v1.1.6/ReadAny_1.1.6_amd64.deb")
sha256sums_x86_64=('0ab2386bb9d46c544a3557716699313c45c6507b71158e5ed4eea4a7cd422423')

prepare() {
    ar x "${pkgname}-${pkgver}.deb"
    tar xf data.tar.*
}

package() {
    install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/lib/readany"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/readany" <<'EOF'
#!/bin/sh
if lsmod | grep -q '^nvidia '; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi
exec /usr/lib/readany "$@"
EOF

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/app.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/readany.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/app.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/readany.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/readany.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=ReadAny
Comment=AI-powered EPUB Reader
Exec=readany %u
Icon=readany
Categories=Office;Viewer;
MimeType=application/epub+zip;
StartupWMClass=ReadAny
Terminal=false
EOF
}
