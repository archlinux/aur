# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=nuked-sc55
pkgver=0.3.1
pkgrel=1
pkgdesc='Roland SC-55 series emulator'
arch=('i686' 'x86_64')
license=('MAME')
url='https://github.com/nukeykt/Nuked-SC55'
depends=('rtmidi' 'sdl2')
makedepends=('cmake')
source=("https://github.com/nukeykt/Nuked-SC55/archive/refs/tags/${pkgver}.tar.gz"
        "fix_base_path.patch")
sha256sums=('339d807361819793606093588782ad7d3706bd7aa8cff09fb26bd0ce15a70e54'
            'e713fe18983e380910f29bcac74b5334fdd7a7962cacde64e10acf3e3af572ac')

prepare() {
    cd "${srcdir}/Nuked-SC55-${pkgver}"
    for patch_file in ../*.patch; do
        patch -Np1 < "${patch_file}"
    done
}

build() {
    cd "${srcdir}/Nuked-SC55-${pkgver}"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE='release' \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DUSE_SYSTEM_RTMIDI=1 \
        ..
    cmake build .
}

package() {
    cd "${srcdir}/Nuked-SC55-${pkgver}/build"
    DESTDIR="${pkgdir}" make install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
