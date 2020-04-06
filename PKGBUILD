# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=avisynthplus
pkgver=3.5.1
pkgrel=1
pkgdesc='An improved version of the AviSynth frameserver'
arch=('x86_64')
url='https://github.com/AviSynth/AviSynthPlus/'
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/AviSynth/AviSynthPlus/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-fix-build.patch"::'https://github.com/AviSynth/AviSynthPlus/commit/9c3b4ff5d7bad3a3ff8248cc069984a625e9fd3c.patch')
sha256sums=('cf1dde6d2e4a60cb86142defc41fe4b522284cb38e89bda41faaadd5c7dfdf98'
            'e2d6a3e60d52b47770b4bb1b70bb997d7945624d58b141d55bf624a4ccea91e1')

prepare() {
    patch -d "AviSynthPlus-${pkgver}" -Np1 -i "${srcdir}/${pkgname}-${pkgver}-fix-build.patch"
}

build() {
    cmake -B build -S "AviSynthPlus-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
    make -C "AviSynthPlus-${pkgver}/distrib/docs/english" man
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 "AviSynthPlus-${pkgver}/distrib/docs/english/build/man/avisynth.1" -t "${pkgdir}/usr/share/man/man1"
}
