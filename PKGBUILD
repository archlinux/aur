# Maintainer: M0Rf30

pkgname=rts_bpp-dkms-git
_pkgname=rts_bpp
pkgver=6
pkgrel=1
pkgdesc="A kernel module for Realtek Card Reader RTL8411/B Device"
arch=('any')
url="https://github.com/Ri0n/rts_bpp"
license=('GPL')
depends=('dkms')
makedepends=('git')
options=(!strip)
install=install
source=(git+https://github.com/Ri0n/rts_bpp.git
        'dkms.conf'
	"81-udisks-udisks2-${_pkgname}.rules")

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count master)
}

build() {
  sed -i "2cPACKAGE_VERSION=$pkgver" dkms.conf
}

package() {
  install -dm755 "${pkgdir}/usr/lib/udev/rules.d/"
  install -D -m644 ${srcdir}/81-udisks-udisks2-${_pkgname}.rules "${pkgdir}/usr/lib/udev/rules.d/"
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
  cp -a ${srcdir}/${_pkgname}/*  ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf" > "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
}

md5sums=('SKIP'
         '56d2fb0184d7eb17cec3d553b870d185'
         '2cb27673c68f68b10199fc6ec9c05a24')
