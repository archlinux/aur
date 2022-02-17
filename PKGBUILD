# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box
_pkgname=86Box
pkgver=3.2
pkgrel=2
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
sha256sums=(
    '418a6d3a87cf34cb10da1828ed526c811a47dfd47127be2b65258c4458575268'
    'c76882ed325072ff88953c6deaa398df05b46732c5b99bd58023d7f9e3c65435'
    '67f2aacd0e39f0fda19412fa5b9b64fab347a68ed2f4e5e7bb437833f311a5a0'
)
provides=('86box')
conflicts=('86box')

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
