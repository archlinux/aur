# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib')
pkgver=4.0.3
pkgrel=2
pkgdesc='A support package for GPIB (IEEE 488) hardware.'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
depends=('bash' 'linux>=4.5' 'linux<4.6')
makedepends=('perl' 'linux-headers' 'bison')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'gpib_build.patch')
install='linux-gpib.install'
backup=('etc/gpib.conf')

_kernver=4.5
_extramodules=/usr/lib/modules/extramodules-${_kernver}-ARCH

md5sums=('2d97191e538a57ba7350fcc011ee2596'
         'f6efe56c98febd2618c120000d1c31aa')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    msg "Patching sources"
    msg2 "Applying gpib_build.patch"
    patch -Np1 -i "../gpib_build.patch"

    echo 'ACTION=="add|change", KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' >| \
        usb/99-gpib-generic.rules
    echo "${pkgver}" >| util/.scm_version.tmp
}


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./bootstrap

    ./configure \
        --prefix=/usr \
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
    cd "${srcdir}/${pkgname}-${pkgver}"

    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install

    mkdir -p ${pkgdir}/${_extramodules}
    mv ${pkgdir}/lib/modules/$(uname -r)/gpib ${pkgdir}/${_extramodules}/
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/util/templates/gpib.conf" \
     "${pkgdir}/etc/gpib.conf"
}

# vim:ts=4:et:sw=4
