# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andre Silva <emulatorman@hyperbola.info>
# Contributor: Marcio Silva <coadde@hyperbola.info>

_pkgname=eudev
pkgname=lib32-eudev
pkgdesc="The userspace dev tools (udev) forked by Gentoo (32-bit)"
pkgver=3.2.9
pkgrel=1
arch=('x86_64')
url='https://wiki.gentoo.org/wiki/Project:Eudev'
license=('GPL-2')
depends=('lib32-glib2' 'lib32-glibc' 'lib32-util-linux')
makedepends=('gcc-multilib' 'gobject-introspection' 'gperf' 'python2' 'gtk-doc' 'lib32-kmod')
replaces=('lib32-udev')
conflicts=('lib32-udev')
provides=('lib32-udev')
options=(!makeflags !libtool)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gentoo/eudev/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    autoreconf -vfi
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-rootprefix=/ \
        --with-rootlibdir=/lib32 \
        --sysconfdir=/etc \
        --libdir=/usr/lib32 \
        --enable-introspection \
        --disable-manpages \
        --enable-split-usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" -C src/shared uninstall
    make DESTDIR="${pkgdir}" -C src/libudev install
    make DESTDIR="${pkgdir}" -C src/shared uninstall

    rm -rf ${pkgdir}/usr/include

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

