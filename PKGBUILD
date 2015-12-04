# Binary variant maintainer: Swyter <swyterzone+aur@gmail.com>
# Original package maintainer: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap-bin
_majorver=0.2.2
_minorver=beta1
pkgver="${_majorver}_${_minorver}"
pkgrel=7
pkgdesc="Medical image viewer and DICOM client. Binary package and libs extracted from Debian."
arch=('x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'gconfmm' 'hicolor-icon-theme' 'libtiff')
provides=("aeskulap=${pkgver}")
conflicts=("aeskulap")
install='aeskulap.install'
source=(
    "http://ftp.debian.org/debian/pool/main/a/aeskulap/aeskulap_0.2.2b1-11_amd64.deb"
    "aeskulap.install"
    "http://ftp.debian.org/debian/pool/main/d/dcmtk/libdcmtk2_3.6.0-12_amd64.deb"
    "http://ftp.debian.org/debian/pool/main/t/tcp-wrappers/libwrap0_7.6.q-25_amd64.deb"
)

md5sums=(
    '95dc57332fc5c5f75256640c742c92c0'
    '9fb089824cc31ee06b5032ee0378f89e'
    'f746079bb40587de32d18d87d69d6e5a'
    '073e608b96d8e7fc9dbf6ecfc65fe07b'
)

noextract=("aeskulap_0.2.2b1-11_amd64.deb" "libdcmtk2_3.6.0-12_amd64.deb" "libwrap0_7.6.q-25_amd64.deb")

extract_deb()
{
    bsdtar -xf $1 --include data.tar.*
    bsdtar -xf data.tar.*
    rm data.tar.*
}

build()
{
    # extract them all under the base /usr dir inside of the source folder
    extract_deb "aeskulap_0.2.2b1-11_amd64.deb"
    extract_deb "libdcmtk2_3.6.0-12_amd64.deb"
    extract_deb "libwrap0_7.6.q-25_amd64.deb"

    # move this Debian path to the Arch Linux equivalent
    cp ./lib/x86_64-linux-gnu/libwrap.so.0.7.6 ./usr/lib/libwrap.so.0

    # link (with a relative symbolic thingie) the v5 version
    # of libtiff with what this package needs (v4)
    cd ./usr/lib/

    rm -f libtiff.so.4
    ln -r -s libtiff.so.5 libtiff.so.4
}

package()
{
    # go into the package folder and copy the /usr into the root
    cd ${pkgdir}
    cp -r ${srcdir}/usr/ .

    # move this into that
    cd usr/lib
    mv x86_64-linux-gnu/* .
    rmdir "x86_64-linux-gnu"
}