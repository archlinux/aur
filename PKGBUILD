# Contributor: Amin Mesbah <dev@aminmesbah.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=milton-git
pkgver=1.9.1.r27.768c035
pkgrel=2
pkgdesc='An infinite-canvas paint program'
arch=('x86_64')
url='https://github.com/serge-rgb/milton'
license=('GPL3')
depends=('opengl-driver' 'gtk2')
makedepends=('cmake' 'git' 'icoutils' 'patch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/serge-rgb/milton.git'
        'harfbuzz-cflags.patch'
        'milton.desktop')
sha256sums=('SKIP'
            '73099b62fd9eb8bcc0bb8f85dfa193925f5f042bc0293090c26d95257d6e08e8'
            '59e5dec9b6ec0cfadc45e56728d83e66e612c84cfa67f15451df38ec0bad55d0')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags --long | tr -d v | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -Np1 -i "${srcdir}/harfbuzz-cflags.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}" 
    ./build-lin.sh
}

package() {
    cd "$srcdir/${pkgname%-git}"
    cd build
    install -Dm755 Milton "${pkgdir}/usr/bin/milton"
    icotool -x milton_icon.ico
    for res in 16x16 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 milton_icon_*"_${res}x32.png" \
                "${pkgdir}/usr/share/icons/hicolor/${res}/apps/milton.png"
    done
    install -Dm644 "${srcdir}/milton.desktop" "${pkgdir}/usr/share/applications/milton.desktop"
    install -Dm644 \
            "${srcdir}/${pkgname%-git}/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
