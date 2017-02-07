# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Maxqia <contrib@maxqia.com>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=keepassxc
pkgver=2.1.1
pkgrel=1
pkgdesc="A reboot of an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://keepassxc.org"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt' 'libmicrohttpd')
optdepends=('libmicrohttpd' 'libxi')
source=("https://github.com/keepassxreboot/keepassxc/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.xz"{,.sig})
sha256sums=('5609063f1edfc4790e8aa93e6445c77ba75ac9b1841a30706d6373f686804880'
            'SKIP')
validpgpkeys=('BF5A669F2272CF4324C1FDA8CFB4C2166397D0D2') # KeePassXC Release <release@keepassxc.org>

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

# vim: set ts=2 sw=2 ft=sh noet:
