# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Maxqia <contrib@maxqia.com>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=keepassxc
pkgver=2.1.0
pkgrel=1
pkgdesc="A reboot with keepasshttp of an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://github.com/keepassxreboot/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'libmicrohttpd')
makedepends=('intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassx2')
provides=('keepassx2')
source=("https://github.com/keepassxreboot/keepassxc/archive/${pkgver}.tar.gz")
sha256sums=('15442c5094b2aeb7e54a8b39aa19f47ae1561695ac6949e74409294370700d48')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i '/git/d' src/CMakeLists.txt
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=OFF \
	-DWITH_XC_AUTOTYPE=ON \
	--DWITH_XC_HTTP=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

check() {
    cd "${pkgname}-${pkgver}/build"
    make test
}

package() {
    cd "${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

