pkgname=msvisio
pkgver=0.1.0
pkgrel=1
pkgdesc="MsVisio"
arch=('x86_64')
url="https://github.com/IndyrGGTM/MsVisio"
license=('unknown')

source=(
  "${pkgname}-${pkgver}.pacman::https://github.com/IndyrGGTM/MsVisio/releases/download/v${pkgver}/msvisio-${pkgver}.pacman"
  "b3sums::https://github.com/IndyrGGTM/MsVisio/releases/download/v${pkgver}/b3sums"
  "icon.png::https://raw.githubusercontent.com/IndyrGGTM/MsVisio/master/icon.png"
)

sha256sums=(
  '9524de83f4fa73f3fd8c93b0ff72a537b2061fb95e1dd0f1b6f6c497543de128'
  'SKIP'
  'SKIP'
)

prepare() {
    cd "${srcdir}"

    # Verify the release package using upstream BLAKE3 checksum
    expected="$(curl -fsSL "https://github.com/IndyrGGTM/MsVisio/releases/download/v${pkgver}/b3sums" | head -n 1 | awk '{print $1}')"

    echo "${expected}  ${pkgname}-${pkgver}.pacman" | b3sum --check -
}

package() {
    bsdtar \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.INSTALL' \
        -xf "${srcdir}/${pkgname}-${pkgver}.pacman" \
        -C "${pkgdir}"

    install -Dm644 "${srcdir}/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/msvisio.png"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/msvisio.desktop" <<EOF
[Desktop Entry]
Name=MsVisio
Comment=Microsoft Visio alternative
Exec=msvisio
Icon=msvisio
Terminal=false
Type=Application
Categories=Office;
EOF
}
