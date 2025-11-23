# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib-user')
_pkgname=('linux-gpib')
pkgver=4.3.7
pkgrel=2
pkgdesc='A support package for GPIB (IEEE 488) hardware (userland utils).'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL-2.0-only')
depends=('bash' 'which')
conflicts=('linux-gpib' 'linux-gpib-dkms')
makedepends=('perl' 'python' 'bison')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
source=("https://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
install='linux-gpib.install'
backup=('etc/gpib.conf')
options=('!emptydirs')

sha256sums=('b3ff812606865c85b58b012a4218a6fe3b82d177c8c0abc795cb22db41f3ad68')

prepare() {

    msg "Unpacking userland utils source"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    tar xvfz "${_pkgname}-user-${pkgver}.tar.gz"
    cd "${_pkgname}-user-${pkgver}"

    # fix fxload
    sed -i -e 's/fx2/fx2 -p \$BUSNUM,\$DEVNUM/g' usb/gpib_udev_fxloader.in

    echo 'ACTION=="add|change", KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' >| \
        usb/99-gpib-generic.rules
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cd "${_pkgname}-user-${pkgver}"

    msg "Building userland utils"

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
    cd "${_pkgname}-user-${pkgver}"
    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install
    install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-user-${pkgver}/util/templates/gpib.conf" \
     "${pkgdir}/etc/gpib.conf"

}

# vim:ts=4:et:sw=4
