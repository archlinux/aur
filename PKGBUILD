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
pkgrel=6
pkgdesc="A reboot of an OpenSource password safe which helps you to manage your passwords in an easy and secure way"
arch=('i686' 'x86_64')
url="https://keepassxc.org"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
source=("https://github.com/keepassxreboot/keepassxc/releases/download/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2"{,.sig}
	'211.patch')
sha256sums=('23a39aeda8f2e6263b0821826cfb8735275fba104712748c7a5e41e1f87fb0a6'
            'SKIP'
            '5f9134ac8e890dbca5cbe7521f8eb7d69298a28086f3813c7df8c81e41d34f2c')
validpgpkeys=('BF5A669F2272CF4324C1FDA8CFB4C2166397D0D2') # KeePassXC Release <release@keepassxc.org>

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i '/git/d' src/CMakeLists.txt
    mkdir -p build
    patch -p1 < ../211.patch
}

build() {
    cd "${pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=OFF \
	-DWITH_XC_AUTOTYPE=ON \
	-DWITH_XC_HTTP=OFF \
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

