# Maintainer: Anton Danilov <grinderz@protonmail.com>
#
# Upstream ships a PKGBUILD in pkgbuild/ that builds from its own checkout
# ($startdir/..), so it cannot be fed to an AUR helper; this one builds the
# release tarball. The icon and the desktop file are upstream's, unchanged.

pkgname=signed
pkgver=0.3.2
pkgrel=1
pkgdesc="Sign PDFs and fill them in with text and dates, in a window or from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/omacom/signed"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-wayland' 'poppler-qt6' 'qpdf' 'nss'
         'noto-fonts' 'xdg-desktop-portal')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg")
sha256sums=('7252fd7141c95ee3f4fb87f95f9d98dcc24ab14f82aac6cc70cc10baa9869627'
            'd2fd31caf37d1e1ef692b84d2e6db4de5b48ac71fbb9c745827395ad7454fdb8'
            'bddf6d2d02d766f3b6d2078002234a063a29cd03556fd4ae8428e07e71169ccd')

build() {
    # CMakeLists.txt has no install rules, package() copies the binary; only
    # the app target is built, not upstream's tests
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=None -Wno-dev
    cmake --build build --target signed
}

package() {
    install -D -m0755 build/signed "${pkgdir}/usr/bin/signed"
    cd "${pkgname}-${pkgver}"
    install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m0644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m0644 "${srcdir}/${pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
