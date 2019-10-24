# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: “0xReki” <mail@0xreki.de>
# Contributor: hardfalcon <?>
_pkgname=libnfc
pkgname="${_pkgname}-no_alternate_usb-git"
pkgver=1.7.1.r223.gf8b2852
pkgrel=1
pkgdesc='Platform independent Near Field Communication (NFC) library'
arch=('i686' 'x86_64')
url="http://nfc-tools.org/"
license=('LGPL3')
depends=('pcsclite' 'libusb-compat')
makedepends=('doxygen' 'zip' 'git')
provides=("libnfc=${pkgver}")
conflicts=(libnfc libnfc-svn libnfc-git)
replaces=(libnfc-svn)
source=("git+https://github.com/nfc-tools/libnfc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^'"${_pkgname}-"'//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${_pkgname}
    #Hotfixing Bug
    if [ ! -e README-Windows.txt ]; then
        ln -s README-Windows.{md,txt}
    fi
    ls
    patch -p1 < ../../acr122bug.patch
    ./make_release.sh
    #autoreconf -vis
    ./configure --prefix /usr --enable-doc --sysconfdir=/etc

}

build() {
    cd ${srcdir}/${_pkgname}
    make
}

package() {
    cd ${srcdir}/${_pkgname}
    make DESTDIR=${pkgdir} install
}
