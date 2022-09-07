# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib')
pkgver=4.3.5
pkgrel=1
pkgdesc='A support package for GPIB (IEEE 488) hardware.'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
depends=('bash' 'linux>=5.19' 'linux<5.20')
makedepends=('perl' 'python' 'linux-headers' 'bison')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${pkgname}-${pkgver}.tar.gz")
install='linux-gpib.install'
backup=('etc/gpib.conf')
options=('!emptydirs')

_kernver=5.19
_extramodules=/usr/lib/modules/extramodules-ARCH

md5sums=('1c79a2a883c99fa760548b442e225be3')

prepare() {

    msg "Unpacking kernel module source"
    cd "${srcdir}/${pkgname}-${pkgver}"
    tar xvfz "${pkgname}-kernel-${pkgver}.tar.gz"
    cd "${pkgname}-kernel-${pkgver}"
    sed -i -e 's/ioremap_nocache/ioremap/g' drivers/gpib/eastwood/fluke_gpib.c
    sed -i -e 's/config.slave_id = 0;//g' drivers/gpib/eastwood/fluke_gpib.c
    sed -i -e 's/ioremap_nocache/ioremap/g' drivers/gpib/fmh_gpib/fmh_gpib.c
    sed -i -e 's/config.slave_id = 0;//g' drivers/gpib/fmh_gpib/fmh_gpib.c

    msg "Unpacking userland utils source"
    cd "${srcdir}/${pkgname}-${pkgver}"
    tar xvfz "${pkgname}-user-${pkgver}.tar.gz"
    cd "${pkgname}-user-${pkgver}"

    echo 'ACTION=="add|change", KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' >| \
        usb/99-gpib-generic.rules
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cd "${pkgname}-kernel-${pkgver}"

    msg "Building kernel module"

    make

    cd "${srcdir}/${pkgname}-${pkgver}"
    cd "${pkgname}-user-${pkgver}"

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
    cd "${srcdir}/${pkgname}-${pkgver}"
    cd "${pkgname}-kernel-${pkgver}"

    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install

    mkdir -p ${pkgdir}/${_extramodules}
    mv ${pkgdir}/lib/modules/$(uname -r)/gpib ${pkgdir}/${_extramodules}/
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;

    cd "${srcdir}/${pkgname}-${pkgver}"
    cd "${pkgname}-user-${pkgver}"
    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}-user-${pkgver}/util/templates/gpib.conf" \
     "${pkgdir}/etc/gpib.conf"

    # Clear everything depmod spewed out
    for f in "modules.alias" "modules.alias.bin" "modules.builtin.bin" \
        "modules.dep" "modules.dep.bin" "modules.softdep" "modules.symbols" \
        "modules.symbols.bin" "modules.devname" "modules.builtin.alias.bin"; do
        if [[ -f "${pkgdir}/lib/modules/$(uname -r)/${f}" ]]; then
            rm "${pkgdir}/lib/modules/$(uname -r)/${f}"
        fi
    done
    rmdir "${pkgdir}/lib/modules/$(uname -r)"
    rmdir "${pkgdir}/lib/modules"
    rmdir "${pkgdir}/lib"

}

# vim:ts=4:et:sw=4
