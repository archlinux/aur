# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice
pkgver=2.1.0
pkgrel=3
pkgdesc='Libraries for developing cross platform software applications in C++'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL-2.1-only')
depends=(
    'fontconfig'
    'glib2'
    'glibc'
    'gst-plugins-base-libs'
    'gstreamer'
    'libcups'
    'libgcc'
    'libgl'
    'libice'
    'libjpeg-turbo'
    'libpulse'
    'libsm'
    'libstdc++'
    'libx11'
    'libxcb'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    'openssl' # loaded on demand by QLibrary
    'sqlite'
    'vulkan-icd-loader'
    'wayland'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'zlib')
optdepends=(
    'gtk2: for GTK2 GUI style'
    'mariadb-libs: for MySQL database support'
    'postgresql-libs: for PostgreSQL database support')
makedepends=(
    'cmake'
    'alsa-lib'
    'mariadb-libs'
    'postgresql'
    'postgresql-libs'
    'vulkan-headers'
    'libxcursor'
    'libxext'
    'libxfixes'
    'libxinerama'
    'libxrandr'
    'libxrender'
    'libxml2')
options=('!lto')
source=("https://github.com/copperspice/copperspice/archive/cs-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-copperspice-fix-cmake-include-dirs.patch'
        '020-copperspice-fix-werror-format-security-without-wformat.patch')
sha256sums=('4cbe8b96a1a97e4a172f57509d95080b6eedb3f66291c5f9d2c48bccea09935c'
            'db23a35f0651ac20d979d2b6e462f1cdc2d91a0315c60ccf513a33cc2ebdc1ed'
            '6190590c3ac496923ccbc80189a1d488531071392390e7bdd57c081c31d6eb16')

prepare() {
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/020-copperspice-fix-werror-format-security-without-wformat.patch"
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
    install -d -m755 "${pkgdir}/usr/bin"
    while read -r -d '' _file
    do
        ln -s "../lib/copperspice/bin/${_file##*/}" "${pkgdir}/usr/bin/${_file##*/}-cs"
    done < <(find "${pkgdir}/usr/lib/copperspice/bin" -type f -executable -print0)
}
