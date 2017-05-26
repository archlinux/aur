# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib-dkms')
_pkgname='linux-gpib'
pkgver=4.0.4rc2
_pkgver=4.0.4
pkgrel=3
pkgdesc='A support package for GPIB (IEEE 488) hardware (DKMS version).'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
provides=('linux-gpib')
conflicts=('linux-gpib')
depends=('bash' 'dkms' 'bison' 'perl' 'python')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${_pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'gpib_build.patch'
        'dkms.conf.in'
        'linux-4.11.patch')
install='linux-gpib.install'
backup=('etc/gpib.conf')

md5sums=('281274e45825f34e69876d38ae008b44'
         '15f3bfbf7a79ddacdd0d66db5e749648'
         '446777322e4d51e46b5a2d5b1c6cdd9c'
         '41083d40c050d78ca93502e23d022a39')

prepare() {

    sed -e "s/@PACKAGE_VERSION@/${pkgver}/" dkms.conf.in > dkms.conf

    cd "${srcdir}/${_pkgname}-${pkgver}"

    msg "Patching sources"
    msg2 "Applying gpib_build.patch"
    patch -Np1 -i "../gpib_build.patch"
    patch -Np1 -i "../linux-4.11.patch"

    echo 'ACTION=="add|change", KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' >| \
        usb/99-gpib-generic.rules
    echo "${pkgver}" >| util/.scm_version.tmp
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./bootstrap

    ./configure \
        --prefix=/usr \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --disable-guile-binding \
        --disable-perl-binding \
        --disable-php-binding \
        --disable-python-binding \
        --disable-tcl-binding
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install

    # modules are generated through DKMS, no need to install them here
    find ${pkgdir}/lib/modules -depth -type f -regex ".*.ko.gz$" -exec rm {} \;
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;
    install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/util/templates/gpib.conf" \
     "${pkgdir}/etc/gpib.conf"

    make distclean

    cd "${srcdir}"
    rm "${_pkgname}-${pkgver}/util/linux_flags/modules.order"

    mkdir -p "${pkgdir}/usr/src"
    cp -Rp ${_pkgname}-${pkgver} "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -p dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
}

# vim:ts=4:et:sw=4
