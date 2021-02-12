# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice-git
pkgver=1.7.1.r7.g32a9749a2
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++ (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL2.1')
depends=('cups' 'fontconfig' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'libgl'
         'libice' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'openssl' 'xcb-util-keysyms' 'xcb-util-image'
         'xcb-util-renderutil' 'xcb-util-wm' 'zlib')
optdepends=('mariadb-libs: for MySQL database support'
            'postgresql-libs: for PostgreSQL database support')
makedepends=('git' 'cmake' 'alsa-lib' 'mariadb-libs' 'postgresql' 'postgresql-libs'
             'libxcursor' 'libxext'  'libxfixes' 'libxinerama' 'libxrandr'
             'libxrender' 'libxml2')
provides=('copperspice')
conflicts=('copperspice')
source=('git+https://github.com/copperspice/copperspice.git'
        '010-copperspice-fix-cmake-include-dirs.patch')
sha256sums=('SKIP'
            'f1f5f5b18d93173cdd78c9fac944a31feb7280efcca3d3533cbdee90266249fa')

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
