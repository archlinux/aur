# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib-dkms')
_pkgname='linux-gpib'
pkgver=4.3.5
pkgrel=1
pkgdesc='A support package for GPIB (IEEE 488) hardware (DKMS version).'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
provides=('linux-gpib')
conflicts=('linux-gpib')
depends=('bash' 'dkms' 'bison' 'perl')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "dkms.conf.in"
        "dkms-kernel-version.diff")
install='linux-gpib.install'
backup=('etc/gpib.conf')

md5sums=('1c79a2a883c99fa760548b442e225be3'
         '2ca62fa9ee584853203e04ef08e6243d'
         '644fcf816bca8e195c01e9daf0a06144')

prepare() {

    sed -e "s/@PACKAGE_VERSION@/${pkgver}/" dkms.conf.in > dkms.conf

    msg "Unpacking kernel module source"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    tar xvfz "${_pkgname}-kernel-${pkgver}.tar.gz"
    cd "${_pkgname}-kernel-${pkgver}"
    patch -p1 < ../../dkms-kernel-version.diff
    sed -i -e 's/ioremap_nocache/ioremap/g' drivers/gpib/eastwood/fluke_gpib.c
    sed -i -e 's/config.slave_id = 0;//g' drivers/gpib/eastwood/fluke_gpib.c
    sed -i -e 's/ioremap_nocache/ioremap/g' drivers/gpib/fmh_gpib/fmh_gpib.c
    sed -i -e 's/config.slave_id = 0;//g' drivers/gpib/fmh_gpib/fmh_gpib.c

    msg "Unpacking userland utils source"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    tar xvfz "${_pkgname}-user-${pkgver}.tar.gz"
    cd "${_pkgname}-user-${pkgver}"

    echo 'ACTION=="add|change", KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' >| \
        usb/99-gpib-generic.rules
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cd "${_pkgname}-kernel-${pkgver}"

    msg "Nothing to do for the module sources"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    cd "${_pkgname}-user-${pkgver}"

    msg "Building userland utils"

    ./bootstrap
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --disable-guile-binding \
        --enable-perl-binding \
        --disable-php-binding \
        --disable-python-binding \
        --disable-tcl-binding
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    #cd "${_pkgname}-kernel-${pkgver}"

    mkdir -p "${pkgdir}/usr/src"
    cp -Rp ${_pkgname}-kernel-${pkgver} \
        "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -p ../dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;

    cd "${srcdir}/${_pkgname}-${pkgver}"
    cd "${_pkgname}-user-${pkgver}"
    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install
    install -D -m644 "util/templates/gpib.conf" \
     "${pkgdir}/etc/gpib.conf"
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;

}

# vim:ts=4:et:sw=4
