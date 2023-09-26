# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hbdbus-git
pkgname=hbdbus-git
pkgver=2.0.0.r8.ge669bd6
pkgrel=1
pkgdesc="The data bus for HybridOS based on HVML PurC."
arch=(any)
url="https://github.com/HybridOS2/HBDBus"
license=('GPL-3.0')
groups=(hybridos2-git)
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    glibc
    python
    purc)
makedepends=(ccache
    cmake
    git
    ninja
    openssl
    pkgconf)
checkdepends=()
optdepends=()
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    sed -i 's|{SYSEXEC_INSTALL_DIR}|{CMAKE_INSTALL_PREFIX}/bin|g' source/hbdbus/CMakeLists.txt
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=Linux \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
