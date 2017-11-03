# Maintainer: Benjamin A. Shelton <zancarius at gmail _ com>
# Submitter: Tusooa Zhu <tusooa at gmail _ com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=bsdmainutils
pkgver=9.0.12
pkgrel=1
pkgdesc="Some BSD-style programs including ncal and lorder."
arch=('any')
url="https://launchpad.net/ubuntu/+source/bsdmainutils"
license=(GPL)
source=(
    "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}+nmu1ubuntu1.tar.gz"
    'archlinux-ncal.patch'
    'archlinux-libtinfo.patch'
)
depends=(bash)
makedepends=(gcc make ncurses patch quilt)
sha256sums=(
    '8e97b383aac8821dafd5f2992a33d8a713cfced31ae782db743976575f05d40d'
    '42cb05d09b0cde67d3e1cfc9bd77885107d517b55969fc252671994ebaca1d8b'
    '60c90f1be3660551a6cb32244d31fd53f8b6d6fbfa92ce85d033f74ffb7c3078'
)

_pkgname="${pkgname}-${pkgver}+nmu1ubuntu1"

build() {

    # Make a fresh copy of the files we'll be mangling in case you need to rebuild the
    # package.

    if [ -d "${srcdir}/${pkgname}-work" ]
    then
        rm -r "${srcdir}/${pkgname}-work"
    fi

    cp -a "${srcdir}/${_pkgname}" "${srcdir}/${pkgname}-work"

    cd "${srcdir}/${pkgname}-work"

    #for i in debian/patches/* ; do patch -Np1 < "$i" ; done || return 1
    QUILT_PATCHES='debian/patches' quilt push -a
    patch -Np1 -i ../archlinux-ncal.patch
    patch -Np1 -i ../archlinux-libtinfo.patch

    for i in col colcrt colrm column hexdump look ul ; do rm -rf "usr.bin/$i" ; done

    # Remove the above line and uncomment this one if you wish to install the hd binary but
    # read the warning below first.
    #for i in col colcrt colrm column look ul ; do rm -rf usr.bin/"$i" ; done

    make
}

package() {

    cd "${srcdir}/${pkgname}-work"
    make DESTDIR="${pkgdir}" install

    # If you *really* want the hd binary, you can uncomment the following to
    # install it. Be aware that it's functionally identical to the hexdump
    # utility from the util-linux package
    #rm "${pkgdir}/usr/bin/hd" && mv "${pkgdir}/usr/bin/hexdump ${pkgdir}/usr/bin/hd"
    #rm "${pkgdir}/usr/share/man/man1/hd*" && mv "${pkgdir}/usr/share/man/man1/hexdump.1 ${pkgdir}/usr/share/man/man1/hd.1"

    # Copy the calendar source files. Debian-specific calendars will be stored under
    # /usr/share/calendar/debian.
    install -d "${pkgdir}/etc/calendar"
    install -d "${pkgdir}/etc/calendar/debian"
    install -Dm0644 "${srcdir}/${pkgname}-work/debian/calendars/default" "${pkgdir}/etc/calendar"
    cp -a "${srcdir}/${pkgname}-work/usr.bin/calendar/calendars/"* "${pkgdir}/etc/calendar/"

    # Generate symlinks to language-specific calendars. If you don't want
    # these, simply remove the entries below.
    cd "${pkgdir}/etc/calendar/"
    ln -s de_AT.ISO_8859-15 de_AT
    ln -s de_DE.ISO8859-1 de_DE
    ln -s fr_FR.ISO8859-1 fr_FR
    ln -s hr_HR.ISO8859-2 hr_HR
    ln -s hu_HU.ISO8859-2 hu_HU
    ln -s ru_RU.KOI8-R ru_RU
    ln -s uk_UA.KOI8-U uk_UA

}
