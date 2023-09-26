# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hbdinetd-git
pkgname=hbdinetd-git
pkgver=r118.e7b1f42
pkgrel=1
pkgdesc="The daemon managing network interfaces for HybridOS."
arch=(any)
url="https://github.com/HybridOS2/HBDInetd"
license=('GPL-3.0')
groups=(hybridos2-git)
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    hbdbus
    wpa_supplicant
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
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    sed -i 's|{HBDINETD_APP_INSTALL_DIR}/sbin/|{CMAKE_INSTALL_PREFIX}/bin|g' source/${pkgbase%-git}/CMakeLists.txt
#    sed -i 's|{HBDINETD_APP_INSTALL_DIR}|{CMAKE_INSTALL_PREFIX}/\${HBDINETD_APP_INSTALL_DIR}|g' source/${pkgbase%-git}/PlatformLinux.cmake

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
