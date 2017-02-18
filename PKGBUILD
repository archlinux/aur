# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi-lts
_pkgname=tp_smapi
__pkgname=tp-smapi
pkgver=0.42
_extramodules=/usr/lib/modules/extramodules-4.4-lts
pkgrel=8
pkgdesc="Modules for ThinkPad's SMAPI functionality"
arch=('i686' 'x86_64')
url='https://github.com/evgeni/tp_smapi'
license=('GPL')
depends=('linux-lts>=4.4.50' 'linux-lts<4.5')
makedepends=('linux-lts-headers>=4.4.50' 'linux-lts-headers<4.5')
install="${pkgname}.install"
source=("https://github.com/evgeni/$_pkgname/archive/$__pkgname/$pkgver.tar.gz")
md5sums=('6a51d3aa459ad7a6ebfbb8c29527b3ee')

build() {
  cd "$srcdir/$_pkgname-$__pkgname-$pkgver"

  _kernver=$(< "${_extramodules}/version")
  make HDAPS=1 KVER="$_kernver" KBASE="/usr/lib/modules/$_kernver"
}

package() {
  _kernver=$(< "${_extramodules}/version")

  make -C "${_extramodules%/*}/${_kernver}/build" \
    INSTALL_MOD_PATH="${pkgdir}/${_extramodules%%/lib/*}" \
    M="$srcdir/$_pkgname-$__pkgname-$pkgver" modules_install

  cd "${pkgdir}/${_extramodules%/*}"
  mv "${_kernver}/extra" "${_extramodules##*/}"
  rmdir "${_kernver}"

  # compress kernel modules
  find "${pkgdir}" -name "*.ko" -exec gzip -9 {} +

  # load module on startup
  echo tp_smapi > "${srcdir}/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
}
