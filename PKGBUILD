# Binary variant maintainer: Swyter <swyterzone+aur@gmail.com>
# Original package maintainer: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap-bin
_majorver=0.2.2
_minorver=beta2
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
    "http://ftp.debian.org/debian/pool/main/a/aeskulap/aeskulap_0.2.2-beta2+git20180219.8787e95-2_amd64.deb"
    "aeskulap.install"
    "http://ftp.debian.org/debian/pool/main/d/dcmtk/libdcmtk2_3.6.0-15+deb8u1_amd64.deb"
    "http://ftp.debian.org/debian/pool/main/t/tcp-wrappers/libwrap0_7.6.q-30_amd64.deb"
)

sha512sums=('02d52adc92fc90e8b0b3996fb18016109f01dfef21e05725c9370f0c609d78b11143082b5a6db1a1e4a237ca8413e5b79971a7a4c1652acf64bfb0a3b097958c'
            '71b9a40bcd008aee95117fce9f70b29c683124f8c2b464a4059526c50ba5fd24df16f9432770b611ed0a49a1cbb1e29c126fe3d131f204679af4048bdb944cc6'
            '0b7a9bd6251b62feb6103e53113b6032f4e1a0c5c9c36efe3f5609b726021dc5d7920fcb09f4da1ac42b06241cde0e14daa467a4ac2808924e1e5d50a91282df'
            'f7776b4430a2f49a1c305ae25fdbcf24eae25b6877dd4ce3341cd3c3c0f8f2ee6f8b179a1ee2030144d71aab5654b2aeacfa945aaf6e0575b8becae5a116215b')

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
