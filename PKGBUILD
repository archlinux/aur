# Maintainer: Jan Cholasta <grubber at grubber cz>
pkgname=zmusic-git
pkgver=1.1.8+4+gd8e6e28
pkgrel=1
pkgdesc="GZDoom's music system as a standalone library (git version)"
arch=('x86_64')
url='https://github.com/coelckers/ZMusic'
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'fluidsynth>=2.2' 'libsndfile' 'mpg123' 'zlib')
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('cmake' 'git')
provides=('zmusic')
conflicts=('zmusic')
_srcname=ZMusic
_checkver=1.1.2
source=("${_srcname}::git+https://github.com/coelckers/ZMusic"
        '0001-Use-correct-soundfont-path.patch')
sha256sums=('SKIP'
            '6c1b5bf589e5c36186869276ade865d35fdf860241dcd2e0f557e5a82dfd066f')

pkgver() {
    cd $_srcname
    git describe --tags | tr - +
}

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
