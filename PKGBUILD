# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libvpl-tools-git
pkgver=1.1.0.r0.gdf0e9d8
pkgrel=1
pkgdesc='Tools for Intel Video Processing Library (git version)'
arch=('x86_64')
url='https://github.com/intel/libvpl-tools/'
license=('MIT')
depends=('libdrm' 'libva' 'libvpl-git' 'libx11' 'vpl-runtime' 'wayland')
makedepends=('git' 'cmake' 'libpciaccess' 'wayland-protocols')
provides=('libvpl-tools')
conflicts=('libvpl-tools')
source=('git+https://github.com/intel/libvpl-tools.git')
sha256sums=('SKIP')

pkgver() {
    git -C libvpl-tools describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # NOTE: fails with 'None' build type
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libvpl-tools \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='ON' \
        -DTOOLS_ENABLE_OPENCL:BOOL='ON' \
        -DVPL_INSTALL_LICENSEDIR:PATH="share/licenses/${pkgname}" \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    
    local _file
    while read -r -d '' _file
    do
        if ! grep -q '^vpl-' <<< "$_file"
        then
            mv "${pkgdir}/usr/bin"/{,vpl-}"$_file"
        fi
    done < <(find "${pkgdir}/usr/bin" -mindepth 1 -maxdepth 1 -type f -print0 | sed -z 's|.*/||')
}
