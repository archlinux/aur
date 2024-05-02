# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libvpl-tools-git
pkgver=1.0.0.r0.g452ab25
pkgrel=1
pkgdesc='Intel Video Processing Library tools (git version)'
arch=('x86_64')
url='https://github.com/intel/libvpl-tools/'
license=('MIT')
depends=('libdrm' 'libva' 'libvpl-git' 'libx11' 'wayland')
optdepends=('intel-media-sdk: runtime implementation for legacy Intel GPUs'
            'vpl-gpu-rt: runtime implementation for Tiger Lake and newer GPUs')
makedepends=('git' 'cmake' 'ninja' 'libpciaccess' 'wayland-protocols')
provides=('libvpl-tools')
conflicts=('libvpl-tools')
source=('git+https://github.com/intel/libvpl-tools.git')
sha256sums=('SKIP')

pkgver() {
    git -C libvpl-tools describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # NOTE: fails with 'None' build type
    # NOTE: fails with 'Unix Makefiles' generator
    cmake -B build -S libvpl-tools \
        -G 'Ninja' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
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
