# Maintainer: witt <1989161762 at qq dot com>

pkgname=drawio-desktop-bin
pkgver=29.5.2
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64' 'aarch64')
url="https://www.drawio.com"
license=('Apache-2.0')
depends=(
    "gtk3"
    "libxss"
    "nss"
    "alsa-lib"
)
provides=('drawio-desktop' 'drawio-desktop-bin')
conflicts=('drawio-desktop')
# optdepends=()
# makedepends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jgraph/drawio-desktop/refs/heads/dev/LICENSE"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/drawio-amd64-${pkgver}.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/jgraph/drawio-desktop/releases/download/v${pkgver}/drawio-arm64-${pkgver}.deb")
sha256sums=('b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')
sha256sums_x86_64=('ae51a748de1a457bb54a1a8c2c9d5d5b24e56ca6af5f5a868ce5a55536a68e83')
sha256sums_aarch64=('4318e81671dc39519f9b63001795caf7add449068f0242697b42982093cb6ade')

prepare() {
    # extract deb archive
	[ -f "data.tar.xz" ] && bsdtar -xf data.tar.xz
	[ -f "data.tar.zst" ] && bsdtar -xf data.tar.zst

    rm -r "usr/share/doc"
    mv usr/share/applications/drawio.desktop usr/share/applications/drawio-desktop.desktop
    sed -i "s|Exec=/opt/drawio/drawio %U|Exec=/opt/${pkgname%-bin}/drawio %U|g" usr/share/applications/drawio-desktop.desktop
    sed -i "s|Name=drawio|Name=${pkgname%-bin}|g" usr/share/applications/drawio-desktop.desktop
}

package() {
    install -dm755 "${pkgdir}/opt"
    cp -r "${srcdir}/opt/drawio" "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/drawio" "${pkgdir}/usr/bin/drawio"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
