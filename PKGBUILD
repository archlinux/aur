# Maintainer     : Vincent Grande <shoober420@gmail.com>
# Contributor    : Eric Vidal <eric@obarun.org>
# Contributor    : Jean-Michel T.Dydak <jean-michel@obarun.org>

pkgname=lib32-eudev
pkgver=3.2.10
pkgrel=1
udevver=243
pkgdesc="The userspace dev tools (udev) forked by Gentoo (32-bit)"
arch=('x86_64')
url="https://dev.gentoo.org/~blueness/eudev"
license=('GPL')
source=("${url}/eudev-${pkgver}.tar.gz")
sha512sums=('SKIP')

depends=(
    'lib32-glib2'
    'lib32-glibc')
    
makedepends=(
    'lib32-gcc-libs'
    'gcc-multilib'
    'gobject-introspection'
    'gperf'
    'gtk-doc'
    'lib32-kmod')

provides=(
    "lib32-udev=${udevver}" 'libudev.so' 'lib32-libeudev')

conflicts=(
    'lib32-libeudev'
    'lib32-eudev-git')

options=(!makeflags !libtool)

build() {

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "${srcdir}/eudev-${pkgver}"

    if [ -f "Makefile" ];then
     msg2 "Cleaning up..."
     make clean
    fi

    ./configure \
        --prefix=/usr \
        --with-rootprefix=/usr \
        --sysconfdir=/etc \
        --libdir=/usr/lib32 \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --enable-introspection \
        --disable-manpages
    make
}

package() {

    cd "${srcdir}/eudev-${pkgver}"

    make DESTDIR="${pkgdir}" -C src/libudev install

    rm -rf ${pkgdir}/usr/include

}
