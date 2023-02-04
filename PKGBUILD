# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice
pkgver=1.8.1
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL2.1')
depends=('cups' 'fontconfig' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'libgl'
         'libice' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'openssl' 'vulkan-icd-loader' 'xcb-util-keysyms'
         'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib')
optdepends=('mariadb-libs: for MySQL database support'
            'postgresql-libs: for PostgreSQL database support')
makedepends=('cmake' 'alsa-lib' 'mariadb-libs' 'postgresql' 'postgresql-libs'
             'vulkan-headers' 'libxcursor' 'libxext'  'libxfixes' 'libxinerama'
             'libxrandr' 'libxrender' 'libxml2')
options=('!lto')
source=("https://github.com/copperspice/copperspice/archive/cs-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-copperspice-fix-cmake-include-dirs.patch')
sha256sums=('c3992575bd9eaf01b0c5333c8fecb16c997201f6b56b703ae9f33d5a1a8e24e1'
            '1bef08debd977fb08861552e39e2752459c5fe9743d9d593bc135f5978df9c46')

prepare() {
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
}

build() {
    cmake -B build -S "copperspice-cs-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_BINDIR:PATH='lib/copperspice/bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/copperspice' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-dev
    make -C build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    
    local _file
    mkdir -p "${pkgdir}/usr/bin"
    while read -r -d '' _file
    do
        ln -s "../lib/copperspice/bin/${_file##*/}" "${pkgdir}/usr/bin/${_file##*/}-cs"
    done < <(find "${pkgdir}/usr/lib/copperspice/bin" -type f -executable -print0)
}
