# Maintainer: Manuel Conzelmann <manolo89@online.de>
_pkgbase=rtl8822bu
pkgname=rtl8822bu-dkms
pkgver=1
pkgrel=2
epoch=
pkgdesc="wireless lan driver for realtek devices like GigaBlue WLAN Stick 1200MBit Dual Band USB 3.0 (DKMS)"
arch=(x86_64)
url="https://github.com/EntropicEffect/rtl8822bu"
license=('unknown')
groups=()
depends=('dkms')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("${_pkgbase}")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/EntropicEffect/rtl8822bu/archive/master.zip"
	'dkms.conf')
noextract=()
md5sums=('70f004b6e99c32be2c185ffc89950162'
	 '228d651cd2a88cf4d0da0d833873abba')
validpgpkeys=()


build() {
	cd "$_pkgbase-master"
	make
}

package() {
	cd "${pkgname}-master"
	mv 88x2bu.ko $pkgname.ko
	install -m 755 -d "${pkgdir}/usr/src"
        install -p -m 644 ${pkgname}.ko "${pkgdir}/usr/src"
        # depmod -b $pkgdir -a

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
