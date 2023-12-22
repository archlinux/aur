# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libvpl-git
pkgver=2.10.1.r0.g79ef61b
pkgrel=1
pkgdesc='Intel Video Processing Library (git version)'
arch=('x86_64')
url='https://intel.github.io/libvpl/'
license=('MIT')
depends=('libdrm' 'libva' 'libx11' 'wayland')
optdepends=('intel-media-sdk: runtime for legacy Intel GPUs'
            'onevpl-intel-gpu: runtime for Tiger Lake and newer GPUs')
makedepends=('git' 'cmake' 'libpciaccess' 'wayland-protocols')
provides=('libvpl' 'onevpl' 'libvpl.so')
conflicts=('libvpl' 'onevpl')
replaces=('onevpl-git')
source=('git+https://github.com/intel/libvpl.git')
sha256sums=('SKIP')

pkgver() {
    git -C libvpl describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libvpl \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='ON' \
        -DINSTALL_EXAMPLE_CODE:BOOL='OFF' \
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
