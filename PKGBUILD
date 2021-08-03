# Maintainer: Jan Cholasta <grubber at grubber cz>
pkgname=zmusic
pkgver=1.1.8
pkgrel=1
pkgdesc="GZDoom's music system as a standalone library"
arch=('x86_64')
url='https://github.com/coelckers/ZMusic'
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'fluidsynth>=2.2' 'libsndfile' 'mpg123' 'zlib')
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('cmake')
_srcname=ZMusic-${pkgver}
source=("${_srcname}.tar.gz::https://github.com/coelckers/ZMusic/archive/${pkgver}.tar.gz"
        '0001-Use-correct-soundfont-path.patch')
sha256sums=('73082f661b7b0bb33348d1d186c132deec9132a1613480348a00172b49c9fd68'
            '6c1b5bf589e5c36186869276ade865d35fdf860241dcd2e0f557e5a82dfd066f')

prepare() {
    cd $_srcname
    patch -i "$srcdir"/0001-Use-correct-soundfont-path.patch -p 1
}

build() {
    cd $_srcname
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D DYN_FLUIDSYNTH=OFF \
          -D DYN_MPG123=OFF \
          -D DYN_SNDFILE=OFF
    make -C build
}

package() {
    cd $_srcname
    make -C build install DESTDIR="$pkgdir"
    install licenses/{bsd,dumb,legal,zmusic}.txt -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
