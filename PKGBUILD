# Maintainer: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: Alex Forenchich <alex@alexforencich.com>

pkgname=('linux-gpib')
pkgver=3.2.21
pkgrel=8
pkgdesc='A support package for GPIB (IEEE 488) hardware.'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
depends=('bash' 'linux>=4.1' 'linux<4.2')
makedepends=('perl' 'linux-headers' 'bison')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'gpib_build.patch'
        'linux_api_3.19.patch'
        '99-gpib.rules')
install='linux-gpib.install'

_kernver=4.1
_extramodules=/usr/lib/modules/extramodules-${_kernver}-ARCH

md5sums=('91e15d1a30c6e3fd79fc6762e8c1120e'
         '70e4d8fcdf37cb0db61fd515b1d49651'
         '842cc665ec1286276dbd413914d276c4'
         'e57d143633ca8b66b9905d02b657419c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    msg "Patching sources"
    msg2 "Applying gpib_build.patch"
    patch -Np0 -i "${srcdir}/gpib_build.patch"

    msg2 "Applying linux 3.19.x API patch"
    patch -Np0 -i "${srcdir}/linux_api_3.19.patch"

    ./bootstrap
    ./configure \
        --prefix=/usr \
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
    mv ${pkgdir}/usr/sbin/gpib_config ${pkgdir}/usr/bin/gpib_config
    rmdir ${pkgdir}/usr/sbin
    rm -r "${pkgdir}/etc/hotplug"
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;
    install -D -m644 "${srcdir}/99-gpib.rules" "${pkgdir}/etc/udev/rules.d/99-gpib.rules"

}

# vim:ts=4:et:sw=4
