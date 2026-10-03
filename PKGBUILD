# Maintainer: witt <1989161762 at qq dot com>
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=drawio-desktop-bin
pkgver=31.7.0
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

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('eb9695e208fcc5ccfbfc496aa8ab2f52a273297d83715de2177b231c172c13de')
sha256sums_aarch64=('ad7acb0546768a6a7b6563c96d9beb0cd4cef3165e830e56a8cbc2ca0faf25de')

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
