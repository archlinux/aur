# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
# Contributor: “0xReki” <mail@0xreki.de>
# Contributor: hardfalcon <?>
_pkgname=libnfc
pkgname="${_pkgname}-no_alternate_usb-git"
pkgver=1.8.0.r41.gd9a04a5
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
source=("git+https://github.com/nfc-tools/libnfc.git"
		"acr122bug.patch")
sha256sums=('SKIP'
            '11645025ea9e791dd8fd308694061eac1c5003bf60dc071f33bd615cc70c385b')

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
    patch -p1 < "${srcdir}/acr122bug.patch"
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
