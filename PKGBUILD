# Maintainer: Anton Danilov <grinderz@protonmail.com>
#
# Upstream ships a PKGBUILD in pkgbuild/ that builds from its own checkout
# ($startdir/..), so it cannot be fed to an AUR helper; this one builds the
# release tarball. The icon and the desktop file are upstream's, unchanged.

pkgname=signed
pkgver=0.3.1
pkgrel=1
pkgdesc="Sign PDFs and fill them in with text and dates, in a window or from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/omacom/signed"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'poppler-qt6' 'qpdf' 'nss'
         'noto-fonts' 'xdg-desktop-portal')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg")
sha256sums=('e38bc1a4c9b034a361d6cfbd1e9a41e4871f93fa2ef0b4b4e36276f57b2f566f'
            'd2fd31caf37d1e1ef692b84d2e6db4de5b48ac71fbb9c745827395ad7454fdb8'
            '0c677e9a93568f55321af784c7ca439f564f22e3b5af14bdcb0b53aa63ee62bb')

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    qmake6 ../signed.pro
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D -m0755 build/signed "${pkgdir}/usr/bin/signed"
    install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m0644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m0644 "${srcdir}/${pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
