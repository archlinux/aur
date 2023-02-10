# Maintainer: Gabriel Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=lttng-modules-dkms-git
pkgver=2.13.0.rc1.304.g612c99eb
pkgrel=1
pkgdesc="Kernel Modules for LTTng (DKMS)"
arch=('i686' 'x86_64')
url="https://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
depends=('linux>=2.6.38' 'linux-headers' 'dkms')
provides=('lttng-modules')
conflicts=('lttng-modules')
source=('git://git.lttng.org/lttng-modules.git' 'dkms.conf')
md5sums=('SKIP' 'dc44e8f62dc7cac60a3e3d63698236ee')

pkgver() {
    cd "${srcdir}/lttng-modules/"

    git describe --always | sed 's/-/./g;s/^v//'
}

package()  {
    # move source files into /usr/src
    install -d "${pkgdir}/usr/src/lttng-modules-${pkgver}"
    cp -r "lttng-modules/." "${pkgdir}/usr/src/lttng-modules-${pkgver}/"

    # copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}/usr/src/lttng-modules-${pkgver}/dkms.conf"

    # set name and version and dkms.conf
    sed -e "s/@PKGNAME@/lttng-modules/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/lttng-modules-${pkgver}/dkms.conf"
}
