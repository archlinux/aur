# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Piotr Górski <sir_lucjan@openlinux.pl>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor:Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >

 
pkgname=r8168-uksm-ck
_pkgname=r8168
pkgver=8.040.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1')
makedepends=('linux-uksm-ck-headers>=4.0' 'linux-uksm-ck-headers<4.1')
_extramodules="extramodules-4.0-uksm-ck"
source=("${_pkgname}-${pkgver}.tar.bz2::http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0002-${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('da0444fcd7aabb7762310cdf2047fd0aeb7a9ed97a3d6b80d62a0fc71e0730bf')
install=${_pkgname}.install

# OLD OUTOFDATE SRC: https://r8168dl.appspot.com/files/${_pkgname}-${pkgver}.tar.bz2

build() {
    _kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)
    KERNEL_RELEASE=$(cat /usr/lib/modules/${_extramodules}/version)
    cd "${_pkgname}-${pkgver}"
    # avoid using the Makefile directly -- it doesn't understand
    # any kernel but the current.
    make -C /usr/lib/modules/${KERNEL_RELEASE}/build \
            SUBDIRS="${srcdir}/${_pkgname}-${pkgver}/src" \
            EXTRA_CFLAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
            modules
}

package() {
    _kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)
    depends=('linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1')
    KERNEL_VERSION=$(cat /usr/lib/modules/${_extramodules}/version)
    msg "Kernel = ${KERNEL_VERSION}"
    cd "${_pkgname}-${pkgver}"
    install -Dm644 src/${_pkgname}.ko "${pkgdir}/usr/lib/modules/${_extramodules}/${_pkgname}.ko"
    find "${pkgdir}" -name '*.ko' -exec gzip -9 {} +
    sed -i "s|extramodules-.*-ARCH|extramodules-4.0-uksm-ck|" "${startdir}/${_pkgname}.install"
    }
