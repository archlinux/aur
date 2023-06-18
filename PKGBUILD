# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice
pkgver=1.8.2
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
        '010-copperspice-fix-cmake-include-dirs.patch'
        '020-copperspice-gcc13-fix-001.patch'::'https://github.com/copperspice/copperspice/commit/a7f3e774dd82c8a8eb35752a05d5095209d869d1.patch'
        '030-copperspice-gcc13-fix-002.patch'::'https://github.com/copperspice/copperspice/commit/a7be5a31f6028199581ad05310ef697437feda02.patch')
sha256sums=('08e85a5942ce6230714179e4d24ed2e2a99e2f680f8929f6a807ed7c7a98a313'
            '1bef08debd977fb08861552e39e2752459c5fe9743d9d593bc135f5978df9c46'
            '4cfd123dc58fc0cc414a0b8f4a408a6792eab02ac41684979282c31f428ff64d'
            'c7a630a20749a2e045f8e280204ca89098e46d28cbc55058a4e4908cf3329c10')

prepare() {
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/020-copperspice-gcc13-fix-001.patch"
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/030-copperspice-gcc13-fix-002.patch"
}

build() {
    cmake -B build -S "copperspice-cs-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_BINDIR:PATH='lib/copperspice/bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include/copperspice' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
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
