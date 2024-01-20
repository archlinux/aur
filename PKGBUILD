# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Based on PKGBUILD by Roshless <pkg@roshless.com>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=lagrange
pkgname=$_pkgname-nosse41
pkgrel=1
pkgver=1.17.6
pkgdesc='Beautiful Gemini Client (compiled without SSE)'
url='https://git.skyjake.fi/skyjake/lagrange'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('BSD')
install="$_pkgname.install"
source=("https://git.skyjake.fi/skyjake/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
depends=(
    'fribidi'
    'harfbuzz'
    'hicolor-icon-theme'
    'libunistring'
    'openssl'
    'pcre'
    'sdl2'
    'zlib'
    'mpg123'
)
optdepends=(
    'libwebp: Webp decode support'
)
makedepends=(
    'cmake'
    'zip'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums=('b9d0982617fec495565ac9c09fb788a0be207d6fdf2324edc390e5cac8b1523b')

build() {
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_KERNING=OFF \
        -DTFDN_ENABLE_WARN_ERROR=OFF \
        -DTFDN_ENABLE_SSE41=OFF \
        -Wno-dev
    make -C build
}

package() {
    install -Dm644 "${_pkgname}-${pkgver}/LICENSE.md" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

    cd build
    make DESTDIR="${pkgdir}" install
}
