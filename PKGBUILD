# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box
_pkgname=86Box
pkgver=3.3
pkgrel=4
pkgdesc='An emulator for classic IBM PC clones'
arch=('pentium4' 'x86_64' 'arm7h' 'aarch64')
url='https://86box.net/'
license=('GPL2')
depends=('alsa-lib' 'faudio' 'freetype2' 'libpng' 'libslirp' 'openal' 'qt6-base' 'rtmidi' 'sdl2')
makedepends=('cmake>=3.21' 'ninja' 'qt6-tools')
optdepends=(
    '86box-roms: ROM files'
    'discord-game-sdk: Discord Rich Presence'
    'libpcap: Networking not limited to TCP/IP'
)
options=('!buildflags')
source=(
    "https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    '86box'
    '86Box.desktop'
)
sha512sums=(
    'c590b138d4cb19519847f13d8d68d6d8a54ee2372cb00e998dbb9b15d6c18beaa2e842625631fa716c1dba49149f1a93e8f6521a02d05d97b91ca311b8d91859'
    '827735339dc28aedc98b5427e19b8234d9db41095307ef2614aa9a1272af14f624b7d8d314f891b7e91a606bf54e94713663abed93f0f1429ce988eecca50f18'
    '143447f38e3ddf458f469dffd37897503112100cf69d46dbe6810f5e64c32d91d87dcb46fe4447cda8d2fb91dd2f1b868ee1e43575a972280801b40cf7cfbd85'
)

build() {
    case "$CARCH" in
        pentium4) _PRESET=regular;    _TOOLCHAIN=cmake/flags-gcc-i686.cmake ;;
        x86_64)   _PRESET=regular;    _TOOLCHAIN=cmake/flags-gcc-x86_64.cmake ;;
        arm7h)    _PRESET=regularndr; _TOOLCHAIN=cmake/flags-gcc-armv7.cmake ;;
        aarch64)  _PRESET=regularndr; _TOOLCHAIN=cmake/flags-gcc-aarch64.cmake ;;
    esac
    cmake -S"$_pkgname-$pkgver" -Bbuild --preset "$_PRESET" --toolchain "$_TOOLCHAIN" -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=on -DSLIRP_EXTERNAL=on
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
    install -Dm755 86box "$pkgdir/usr/bin"
    install -Dm644 86Box.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/src/win/assets/86Box-green.png" "$pkgdir/usr/share/pixmaps/86Box.png"
}
