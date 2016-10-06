# Maintainer: Daniel Landau <daniel@landau.fi>
# Contributor: Maxqia <contrib@maxqia.com>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=keepassx-reboot
pkgver=2.0.2
pkgrel=1
pkgdesc="A reboot with keepasshttp of an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://github.com/keepassxreboot/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'libmicrohttpd')
makedepends=('intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx-svn' 'keepassx' 'keepassx-git' 'keepassx2-git' 'keepassx2' 'keepassx2-yubikey-git' 'keepassx-http' 'keepassx-reboot-git')
provides=("keepassx"{,2}"=${pkgver}" "keepassx-svn=${pkgver}" "keepassx2-git=${pkgver}")
replaces=('keepassx-http')
source=("https://github.com/keepassxreboot/keepassx/archive/${pkgver}.tar.gz")
sha1sums=('9591e89484e3c62f7de040915ebf0ddd33fa85d7')

prepare() {
    cd "${srcdir}/keepassx-${pkgver}"
    sed -i '/git/d' src/CMakeLists.txt
    #sed -i'' -e 's/add_subdirectory(x11)/add_subdirectory(xcb)/' src/autotype/CMakeLists.txt
    mkdir -p build
}

build() {
    cd "${srcdir}/keepassx-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

check() {
    cd "${srcdir}/keepassx-${pkgver}/build"
    make test
}

package() {
    cd "${srcdir}/keepassx-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

