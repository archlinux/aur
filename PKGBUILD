# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi-lts
_pkgname=tp_smapi
_extramodules=/usr/lib/modules/extramodules-3.0-lts
pkgver=0.41
pkgrel=11
pkgdesc="linux-lts modules for ThinkPad's SMAPI functionality"
arch=('i686' 'x86_64')
url='https://github.com/evgeni/tp_smapi'
license=('GPL')
depends=('linux-lts>=3.0' 'linux-lts<3.1')
makedepends=('linux-lts-headers>=3.0' 'linux-lts-headers<3.1')
install="${pkgname}.install"
source=("https://github.com/downloads/evgeni/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('63c683415c764568f6bf17c7eabe4752')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  _kernver=$(< "${_extramodules}/version")

  sed -ri -e "s/^(KVER\s*:=).*$/\1 ${_kernver}/" \
	  -e "s#^(KBASE\s*:=).*\$#\1 ${_extramodules%/*}/${_kernver}#" Makefile

  make HDAPS=1
}

package() {
  _kernver=$(< "${_extramodules}/version")

  make -C "${_extramodules%/*}/${_kernver}/build" \
    INSTALL_MOD_PATH="${pkgdir}/${_extramodules%%/lib/*}" \
    M="${srcdir}/${_pkgname}-${pkgver}" modules_install

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
