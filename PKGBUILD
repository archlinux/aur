# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

_gitcommit='8f40fcf3d9a4bfb9c3dae1caa2107ea3a367a609'
_pkgname='tp_smapi'
pkgname=tp_smapi-mainline
pkgver=20140506
pkgrel=1
pkgdesc="Modules for ThinkPad's SMAPI functionality, mainline kernel"
arch=('i686' 'x86_64')
url='https://github.com/evgeni/tp_smapi'
license=('GPL')
depends=('linux-mainline>=4.2rc1' 'linux-mainline<4.3rc1')
makedepends=('linux-mainline-headers>=4.2rc1' 'linux-mainline-headers<4.3rc1')
provides=('tp_smapi')
install="${pkgname}.install"
source=("${url}/archive/${_gitcommit}.tar.gz")
md5sums=('4a4797f73821cb90712a4bbd07e2779d')

build() {
    cd "${srcdir}/${_pkgname}-${_gitcommit}"

    _kernver=${_kernver:-$(uname -r)}
    _extramodules=$(readlink -f "/usr/lib/modules/${_kernver}/extramodules" || true)
    _kernver=$(< "${_extramodules}/version")

    sed -ri -e "s/^(KVER\s*:=).*$/\1 ${_kernver}/" \
            -e "s#^(KBASE\s*:=).*\$#\1 ${_extramodules%/*}/${_kernver}#" Makefile

    make HDAPS=1
}

package() { 
    _kernver=${_kernver:-$(uname -r)}
    _extramodules=$(readlink -f "/usr/lib/modules/${_kernver}/extramodules" || true)
    _kernver=$(< "${_extramodules}/version")

    make -C "${_extramodules%/*}/${_kernver}/build" \
        INSTALL_MOD_PATH="${pkgdir}/${_extramodules%%/lib/*}" \
        M="${srcdir}/${pkgname%%-*}-${pkgver}" modules_install

    cd "${pkgdir}/${_extramodules%/*}"
    mv "${_kernver}/extra" "${_extramodules##*/}"
    rmdir "${_kernver}"

    # compress kernel modules
    find "${pkgdir}" -name "*.ko" -exec gzip -9 {} +

    # load module on startup
    echo tp_smapi > "${srcdir}/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    # update kernel version in install file
    sed -ri "s#^(extramodules=).*\$#\1${_extramodules}#" "${startdir}/${pkgname}.install"
}
