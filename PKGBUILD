# Maintainer: Amin Mesbah <dev@aminmesbah.com>
pkgname=milton
pkgver=1.9.1
pkgrel=1
pkgdesc='An infinite-canvas paint program'
arch=('x86_64')
url='https://github.com/serge-rgb/milton'
license=('GPL')
depends=('gtk2' 'opengl-driver')
makedepends=('cmake' 'icoutils' 'patch' 'sdl2')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/serge-rgb/milton/archive/v${pkgver}.tar.gz"
        'harfbuzz-cflags.patch'
        'milton.desktop')
sha512sums=('26b531be432065ab9a683f5a015754853bdd59bdde2e034e862ada6813f6044412d11e4db6bd984693b4c00d186f11b6f3a45092255bda9ca50c5e749e647895'
            '071b97f4671bf4d4e21c1ddce25663efe6956a58f14446e098e21435a8f16f9816329055daa480716c3794aa1af930902347dd2dacd14c334c94b25ff14676bc'
            '341658c9b948e1ccee4487d693d66a901a7612bd2cc984ae7771606fa27a467b88139458a1f2a7d9e12e6fe9d4f63919ecdbdc34f38e8965045c846aeae5ff67')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit 1
    patch -Np1 -i "${srcdir}/harfbuzz-cflags.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit 1
    ./build-lin.sh
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit 1
    cd build || exit 1
    install -Dm755 Milton "${pkgdir}/usr/bin/milton"
    icotool -x milton_icon.ico
    for res in 16x16 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 milton_icon_*"_${res}x32.png" \
                "${pkgdir}/usr/share/icons/hicolor/${res}/apps/milton.png"
    done
    install -Dm644 "${srcdir}/milton.desktop" "${pkgdir}/usr/share/applications/milton.desktop"
    install -Dm644 \
        "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
