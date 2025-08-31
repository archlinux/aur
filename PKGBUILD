# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice
pkgver=2.0.0
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL-2.1-only')
depends=(
    'fontconfig'
    'gcc-libs'
    'glib2'
    'glibc'
    'gst-plugins-base-libs'
    'gstreamer'
    'libcups'
    'libgl'
    'libice'
    'libjpeg'
    'libpulse'
    'libsm'
    'libx11'
    'libxcb'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    'openssl' # loaded on demand by QLibrary
    'sqlite'
    'vulkan-icd-loader'
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
        '020-copperspice-fix-werror-format-security-without-wformat.patch'
        '030-copperspice-support-newer-vulkan-versions.patch'::'https://github.com/copperspice/copperspice/commit/dea67ae78b1048e92834fd7ecc5892e919d5930b.patch')
sha256sums=('93cf35ec896eed5e9b955dbc3dd51dceae7da4ff5fa3215c91d0db198f49a855'
            '920425d9fe93d3cb445c7406c8e9217e757bd5415c5805e6835fa1b67e8c8409'
            '6190590c3ac496923ccbc80189a1d488531071392390e7bdd57c081c31d6eb16'
            'c0a65063df0e7c66fefd791e6806bd98a3cc452ee1c4c73f55559df7f14d9285')

prepare() {
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/020-copperspice-fix-werror-format-security-without-wformat.patch"
    patch -d "copperspice-cs-${pkgver}" -Np1 -i "${srcdir}/030-copperspice-support-newer-vulkan-versions.patch"
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
