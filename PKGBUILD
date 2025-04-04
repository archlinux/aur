# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3e-git
pkgver=r212.ge1ff0f3
pkgrel=2
pkgdesc='An AVS3 encoder supporting AVS3-P2 baseline profile (git version)'
arch=('x86_64')
url='https://github.com/uavs3/uavs3e/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('uavs3e')
conflicts=('uavs3e')
source=('git+https://github.com/uavs3/uavs3e.git'
        '010-uavs3e-10bit.patch')
sha256sums=('SKIP'
            '218ee9ad8e6df4af2bd155dd237cd0c934f8f4edbb16ebd100f62ff66ae90681')

prepare() {
    [ -d uavs3e-10bit ] && rm -r uavs3e-10bit
    cp -a uavs3e uavs3e-10bit
    
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/010-uavs3e-10bit.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C uavs3e rev-list --count HEAD)" "$(git -C uavs3e rev-parse --short HEAD)"
}

build() {
    # gcc 14 fix
    export CFLAGS+=' -Wno-incompatible-pointer-types -Wno-implicit-function-declaration'
    
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5.0'
        '-DCMAKE_SKIP_RPATH:BOOL=YES'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
    cmake -B build -S uavs3e "${_cmake_opts[@]}" -DCOMPILE_10BIT='0'
    cmake --build build
    
    cmake -B build-10bit -S uavs3e-10bit "${_cmake_opts[@]}" -DCOMPILE_10BIT='1'
    cmake --build build-10bit
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    DESTDIR="$pkgdir" cmake --install build-10bit
    install -D -m755 build/uavs3enc -t "${pkgdir}/usr/bin"
    install -D -m755 build-10bit/uavs3enc "${pkgdir}/usr/bin/uavs3enc-10bit"
    install -D -m644 uavs3e/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
