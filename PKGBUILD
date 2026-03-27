# Maintainer: Javad <ja7ad@live.com>

pkgname=drawio-live-bin
pkgver=29.6.6
pkgrel=1
pkgdesc="Diagram drawing application desktop built on web technology (Live version)"
arch=('x86_64' 'aarch64')
url="https://www.drawio.com"
license=('Apache-2.0')
depends=(
    "gtk3"
    "libxss"
    "nss"
    "alsa-lib"
)

provides=('drawio' 'drawio-desktop')
conflicts=('drawio' 'drawio-desktop' 'drawio-desktop-bin')

source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jgraph/drawio-desktop/refs/heads/dev/LICENSE"
)

case "$CARCH" in
  x86_64) _deb="drawio-amd64-${pkgver}.deb" ;;
  aarch64) _deb="drawio-arm64-${pkgver}.deb" ;;
  *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
esac

source+=("$_deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/${_deb}")

sha256sums=('SKIP' 'SKIP')

prepare() {
    [ -f "data.tar.xz" ] && bsdtar -xf data.tar.xz
    [ -f "data.tar.zst" ] && bsdtar -xf data.tar.zst

    rm -r "usr/share/doc"
    mv usr/share/applications/drawio.desktop usr/share/applications/drawio-desktop.desktop
    sed -i "s|Exec=/opt/drawio/drawio %U|Exec=/opt/${pkgname%-bin}/drawio %U|g" usr/share/applications/drawio-desktop.desktop
    sed -i "s|Name=drawio|Name=Drawio|g" usr/share/applications/drawio-desktop.desktop
}

package() {
    install -dm755 "${pkgdir}/opt"
    cp -r "${srcdir}/opt/drawio" "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/drawio" "${pkgdir}/usr/bin/drawio"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}