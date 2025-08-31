# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice-git
pkgver=2.0.0.r119.gdea67ae78
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++ (git version)'
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
    'git'
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
provides=('copperspice')
conflicts=('copperspice')
options=('!lto')
source=('git+https://github.com/copperspice/copperspice.git'
        '010-copperspice-fix-cmake-include-dirs.patch'
        '020-copperspice-fix-werror-format-security-without-wformat.patch')
sha256sums=('SKIP'
            '9e4ddb28cdec13af4bff84158c90f7527b93d6f8b86ca464620eb31de897a312'
            '6190590c3ac496923ccbc80189a1d488531071392390e7bdd57c081c31d6eb16')

prepare() {
    patch -d copperspice -Np1 -i "${srcdir}/010-copperspice-fix-cmake-include-dirs.patch"
    patch -d copperspice -Np1 -i "${srcdir}/020-copperspice-fix-werror-format-security-without-wformat.patch"
}

pkgver() {
    git -C copperspice describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^cs\.//'
}

build() {
    cmake -B build -S copperspice \
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
