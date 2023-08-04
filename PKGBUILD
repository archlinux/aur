# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=onevpl-git
pkgver=2023.3.1.r0.gca5bbbb
pkgrel=1
pkgdesc='oneAPI Video Processing Library (git version)'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.html'
license=('MIT')
depends=('libdrm' 'libva' 'wayland')
optdepends=('intel-media-sdk: runtime for legacy Intel GPUs'
            'onevpl-intel-gpu: runtime for Tiger Lake and newer GPUs')
makedepends=('git' 'cmake' 'libx11' 'wayland-protocols')
provides=('onevpl')
conflicts=('onevpl')
source=('git+https://github.com/oneapi-src/oneVPL.git')
sha256sums=('SKIP')

pkgver() {
    git -C oneVPL describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S oneVPL \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='ON' \
        -DINSTALL_EXAMPLE_CODE:BOOL='OFF' \
        -DONEAPI_INSTALL_LICENSEDIR:STRING="share/licenses/${pkgname}" \
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
