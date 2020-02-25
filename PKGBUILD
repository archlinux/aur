# Maintainer: Jan Cholasta <grubber at grubber cz>
pkgname=zmusic
pkgver=1.1.0
pkgrel=2
pkgdesc="GZDoom's music system as a standalone library"
arch=('x86_64')
url='https://github.com/coelckers/ZMusic'
license=('BSD' 'GPL3' 'LGPL2.1' 'LGPL3' 'custom:dumb')
depends=('alsa-lib' 'fluidsynth>=2' 'libsndfile' 'mpg123' 'zlib')
optdepends=('soundfont-fluid: default soundfont for FluidSynth')
makedepends=('cmake')
checkdepends=('abi-compliance-checker')
_srcname=ZMusic-${pkgver}
_sover=arch.1
_checkver=1.0.0
source=("${_srcname}.tar.gz::https://github.com/coelckers/ZMusic/archive/${pkgver}.tar.gz"
        '0001-Use-correct-soundfont-path.patch')
source_x86_64=("libzmusic.so.${_sover}-${_checkver}-x86_64.dump.gz"
               "libzmusiclite.so.${_sover}-${_checkver}-x86_64.dump.gz")
sha256sums=('69255ddb62ecb238474bc57e3f761a593006a22eef90c4e786ef613d9a643b3a'
            '6c1b5bf589e5c36186869276ade865d35fdf860241dcd2e0f557e5a82dfd066f')
sha256sums_x86_64=('fb524e664305019a2be2ba6da0634b902906c6c9b4ad71e1ec68a548f76f3243'
                   'c7ec2809cc27a17c5a010537545ba2e80c75956c0a91dfbb9dd5e496a6f4308b')

prepare() {
    cd $_srcname
    echo "set_target_properties(zmusic zmusiclite PROPERTIES SOVERSION ${_sover})" >>source/CMakeLists.txt
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
    if [ "$srcdir"/libzmusic.so.*-${_checkver}-${CARCH}.dump.gz \
         != "$srcdir"/libzmusic.so.${_sover}-${_checkver}-${CARCH}.dump.gz ]; then
        return
    fi

    cd $_srcname
    mkdir -p check
    cmake -B check \
          -D CMAKE_BUILD_TYPE=Debug \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} -g -Og" \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D DYN_FLUIDSYNTH=OFF \
          -D DYN_MPG123=OFF \
          -D DYN_SNDFILE=OFF
    make -C check

    for _lib in libzmusic.so.${_sover} libzmusiclite.so.${_sover}; do
        _old="$srcdir"/${_lib}-${_checkver}-${CARCH}.dump
        _new=${_lib}-${pkgver}-${CARCH}.dump
        abi-dumper check/source/$_lib -lver $pkgver -public-headers include -output $_new
        abi-compliance-checker -l $_lib -old $_old -new $_new
    done
}

package() {
    cd $_srcname
    make -C build install DESTDIR="$pkgdir"
    install licenses/{bsd,dumb,legal,zmusic}.txt -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
