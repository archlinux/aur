# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box
_pkgname=86Box
pkgver=3.2.1
pkgrel=1
pkgdesc='Emulator of x86-based machines based on PCem.'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('alsa-lib' 'freetype2' 'libpng' 'libslirp' 'openal' 'qt6-base' 'rtmidi' 'sdl2')
makedepends=('cmake>=3.16' 'qt6-tools')
optdepends=('86box-roms: ROM files')
source=(
    "https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    '86box'
    '86Box.desktop'
)
sha512sums=(
    'd725b9c2d2ada47e4492dd09c79af15010a03b174cf99705cf7ffbd4de39aa3a745bf5ab41e4f173e89f4c8d9c130e7540014a1824ff34bb88e634d8dc7860eb'
    '3e06cfd2e634ad771c384f05f58f9ba370d86511d291c2b196199908cd2a95274a4046b2979b8bfb5758583d095bc99536c1fef2f582cc5d23b7764151843f38'
    '143447f38e3ddf458f469dffd37897503112100cf69d46dbe6810f5e64c32d91d87dcb46fe4447cda8d2fb91dd2f1b868ee1e43575a972280801b40cf7cfbd85'
)

build() {
    if [ "$CARCH" == arm7h ] || [ "$CARCH" == aarch64 ]; then
        NDR=on
    else
        NDR=off
    fi
    cmake -S"$_pkgname-$pkgver" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DRELEASE=on -DUSE_QT6=on -DSLIRP_EXTERNAL=on -DNEW_DYNAREC=$NDR
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    install -Dm755 86box "$pkgdir/usr/bin"
    install -Dm644 86Box.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/src/win/assets/86Box-green.png" "$pkgdir/usr/share/pixmaps/86Box.png"
}
