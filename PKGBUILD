# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice-git
pkgver=1.8.0.r0.g07be95f61
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++ (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL2.1')
depends=('cups' 'fontconfig' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'libgl'
         'libice' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'openssl' 'vulkan-icd-loader' 'xcb-util-keysyms'
         'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib')
optdepends=('mariadb-libs: for MySQL database support'
            'postgresql-libs: for PostgreSQL database support')
makedepends=('git' 'cmake' 'alsa-lib' 'mariadb-libs' 'postgresql' 'postgresql-libs'
             'vulkan-headers' 'libxcursor' 'libxext'  'libxfixes' 'libxinerama'
             'libxrandr' 'libxrender' 'libxml2')
provides=('copperspice')
conflicts=('copperspice')
options=('!lto')
source=('git+https://github.com/copperspice/copperspice.git'
        '010-copperspice-fix-cmake-include-dirs.patch')
sha256sums=('SKIP'
            'f383d50fe4b3a6ba428dbc1a4822173aff1bd2ba57efb31c8bd977f75db5c3e8')

prepare() {
    patch -d copperspice -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
}

pkgver() {
    git -C copperspice describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^cs\.//'
}

build() {
    cmake -B build -S copperspice \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_BINDIR:PATH='lib/copperspice/bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/copperspice' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    
    local _file
    mkdir -p "${pkgdir}/usr/bin"
    while read -r -d '' _file
    do
        ln -s "../lib/copperspice/bin/${_file##*/}" "${pkgdir}/usr/bin/${_file##*/}-cs"
    done < <(find "${pkgdir}/usr/lib/copperspice/bin" -type f -executable -print0)
}
