# Maintainer: thephoenix <ezrakhuzadi@gmail.com>
pkgname=prismlauncher-offline
pkgver=9.4
pkgrel=2
pkgdesc="Prism Launcher fork with offline account support enabled (built from source)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Diegiwg/PrismLauncher-Cracked"
license=('GPL3')
depends=('qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-networkauth' 'qt6-imageformats' 'java-runtime' 'zlib' 'quazip-qt6' 'tomlplusplus' 'cmark')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'java-environment>=8')
provides=('prismlauncher-offline')
conflicts=('prismlauncher')
source=("prismlauncher-cracked::git+https://github.com/Diegiwg/PrismLauncher-Cracked.git"
        "libnbtplusplus::git+https://github.com/PrismLauncher/libnbtplusplus.git"
        "filesystem::git+https://github.com/gulrak/filesystem.git"
        "qfile-open-checks.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}/prismlauncher-cracked"

    # Copy git submodules into place
    cp -r "${srcdir}/libnbtplusplus/"* libraries/libnbtplusplus/
    cp -r "${srcdir}/filesystem/"* libraries/filesystem/

    # Fix Java 7 to Java 8 compatibility
    sed -i 's/-target 7 -source 7/-target 8 -source 8/g' libraries/javacheck/CMakeLists.txt
    sed -i 's/-target 7 -source 7/-target 8 -source 8/g' libraries/launcher/CMakeLists.txt

    patch -p1 -i "${srcdir}/qfile-open-checks.patch"
}

build() {
    cd "${srcdir}/prismlauncher-cracked"

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_LTO=ON \
        -DLauncher_QT_VERSION_MAJOR=6 \
        -DLauncher_BUILD_PLATFORM=archlinux

    cmake --build build -j$(nproc)
}

package() {
    cd "${srcdir}/prismlauncher-cracked"

    DESTDIR="${pkgdir}" cmake --install build
}
