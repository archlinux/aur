# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib-dkms')
_pkgname='linux-gpib'
pkgver=4.2.0
pkgrel=2
pkgdesc='A support package for GPIB (IEEE 488) hardware (DKMS version).'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
provides=('linux-gpib')
conflicts=('linux-gpib')
depends=('bash' 'dkms' 'bison' 'perl')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "dkms.conf.in")
install='linux-gpib.install'
backup=('etc/gpib.conf')

md5sums=('0241dcc2d16f6d12a7aa2c3a623a55ff'
         '43a6c167d555de581fb5ddfa6f28c7fd')

prepare() {

    sed -e "s/@PACKAGE_VERSION@/${pkgver}/" dkms.conf.in > dkms.conf

    msg "Unpacking kernel module source"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    tar xvfz "${_pkgname}-kernel-${pkgver}.tar.gz"

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

    msg "Bootstrapping kernel module sources"
    ./bootstrap

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
