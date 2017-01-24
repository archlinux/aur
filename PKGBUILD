# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Maxqia <contrib@maxqia.com>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

_pkgname=keepassxc
pkgname=keepassxc-keepasshttp
pkgver=2.1.0
pkgrel=1
pkgdesc="keepassxc with insecure keepasshttp feature enabled"
arch=('i686' 'x86_64')
url="https://github.com/keepassxreboot/keepassx"
license=('GPL2')
depends=('libxtst' 'shared-mime-info' 'qt5-x11extras' 'hicolor-icon-theme' 'desktop-file-utils' 'libmicrohttpd')
makedepends=('intltool' 'cmake' 'qt5-base' 'qt5-tools' 'zlib' 'libgcrypt')
conflicts=('keepassxc')
provides=('keepassxc')
source=("https://github.com/keepassxreboot/keepassxc/releases/download/${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2"{,.sig}
	'147-keepasshttp.patch')
sha256sums=('23a39aeda8f2e6263b0821826cfb8735275fba104712748c7a5e41e1f87fb0a6'
            'SKIP'
            'd1422a63e59a9b5a28a74e3e1a99f371d2f34b37fa0620330663afb086155992')
validpgpkeys=('BF5A669F2272CF4324C1FDA8CFB4C2166397D0D2') # KeePassXC Release <release@keepassxc.org>

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i '/git/d' src/CMakeLists.txt
    mkdir -p build
    patch -p1 < ../147-keepasshttp.patch
}

build() {
    cd "${_pkgname}-${pkgver}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=OFF \
	-DWITH_XC_AUTOTYPE=ON \
	-DWITH_XC_HTTP=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

check() {
    cd "${_pkgname}-${pkgver}/build"
    make test
}

package() {
    cd "${_pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set ts=2 sw=2 ft=sh noet:
