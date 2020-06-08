# Maintainer: Jan Cholasta <grubber at grubber cz>
pkgname=zmusic
pkgver=1.1.1
pkgrel=1
pkgdesc="GZDoom's music system as a standalone library"
arch=('x86_64')
url='https://github.com/coelckers/ZMusic'
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'fluidsynth>=2' 'libsndfile' 'mpg123' 'zlib')
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('cmake')
checkdepends=('abi-compliance-checker')
_srcname=ZMusic-${pkgver}
_checkver=1.1.0
source=("${_srcname}.tar.gz::https://github.com/coelckers/ZMusic/archive/${pkgver}.tar.gz"
        '0001-Use-correct-soundfont-path.patch')
source_x86_64=("libzmusic.so.1-${_checkver}-x86_64.dump.gz"
               "libzmusiclite.so.1-${_checkver}-x86_64.dump.gz")
sha256sums=('98552b840063ba67da4a86fc2f22d0262ec41838323da83ab24f8ddcc6afe90e'
            '6c1b5bf589e5c36186869276ade865d35fdf860241dcd2e0f557e5a82dfd066f')
sha256sums_x86_64=('eb6276f8bbd6db3e2e0bb742138ea4e3a273663128311c7a9df4f254236bbd35'
                   'd490fe9bdd34e5622c2dbda3d605d49545ae1cc17abda6f0c5c898a0087e2123')

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

check() {
    if [ $_checkver = ${pkgver%%+*} ]; then
        return
    fi

    _soverbumped=true
    cd "$srcdir"/$_srcname/build/source
    for _lib in libzmusic.so.* libzmusiclite.so.*; do
        if [ -f "$srcdir"/"${_lib}-${_checkver}-${CARCH}.dump" ]; then
            _soverbumped=false
            break
        fi
    done
    if $_soverbumped; then
        return
    fi

    cd "$srcdir"/$_srcname
    mkdir -p check
    cmake -B check \
          -D CMAKE_BUILD_TYPE=Debug \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} -g -Og" \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D DYN_FLUIDSYNTH=OFF \
          -D DYN_MPG123=OFF \
          -D DYN_SNDFILE=OFF
    make -C check

    cd "$srcdir"/$_srcname/check/source
    for _lib in libzmusic.so.* libzmusiclite.so.*; do
        _old="$srcdir"/"${_lib}-${_checkver}-${CARCH}.dump"
        if [ ! -f "$_old" ]; then
            continue
        fi
        _new=${_lib}-${pkgver}-${CARCH}.dump
        abi-dumper $_lib -lver $pkgver -public-headers ../../include -output $_new
        abi-compliance-checker -l $_lib -old $_old -new $_new
    done
}

package() {
    cd $_srcname
    make -C build install DESTDIR="$pkgdir"
    install licenses/{bsd,dumb,legal,zmusic}.txt -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
