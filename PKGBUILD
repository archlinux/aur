# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice
pkgver=1.7.4
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL2.1')
depends=('cups' 'fontconfig' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'libgl'
         'libice' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'openssl' 'xcb-util-keysyms' 'xcb-util-image'
         'xcb-util-renderutil' 'xcb-util-wm' 'zlib')
optdepends=('mariadb-libs: for MySQL database support'
            'postgresql-libs: for PostgreSQL database support')
makedepends=('cmake' 'alsa-lib' 'mariadb-libs' 'postgresql' 'postgresql-libs'
             'libxcursor' 'libxext'  'libxfixes' 'libxinerama' 'libxrandr'
             'libxrender' 'libxml2')
options=('!lto')
source=("https://github.com/copperspice/copperspice/archive/cs-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-copperspice-fix-cmake-include-dirs.patch')
sha256sums=('3619285fff80d9f0f7cfcc2e2d3229045a3354af4c1274650bf11257a3b53cdd'
            'ad8764d825950dcb98a1088a2f778d449c39e33a3c2edf037a45c30c341045d4')

prepare() {
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
}

build() {
    cmake -B build -S "copperspice-cs-${pkgver}" \
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
