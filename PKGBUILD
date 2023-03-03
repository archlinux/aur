# Maintainer: robertfoster

pkgname=rts_bpp-dkms-git
_pkgname=rts_bpp
pkgver=12
pkgrel=1
pkgdesc="A kernel module for Realtek Card Reader RTL8402/8411/8411B Device"
arch=('any')
url="https://github.com/M0Rf30/rts_bpp"
license=('GPL')
depends=('dkms')
makedepends=('git')
options=(!strip)
source=("git+${url}"
  'dkms.conf'
  "81-udisks-udisks2-${_pkgname}.rules")

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count main)
}

prepare() {
  sed -i "2cPACKAGE_VERSION=$pkgver" dkms.conf
}

package() {
  install -dm755 "${pkgdir}/usr/lib/udev/rules.d/"
  install -D -m644 ${srcdir}/81-udisks-udisks2-${_pkgname}.rules \
    "${pkgdir}/usr/lib/udev/rules.d/"
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -a "${srcdir}/${_pkgname}"/* \
    "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf" \
    >"${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
}

sha256sums=('SKIP'
  'a7d17502cdb55ab5f5577ba211b451ed58ce24e78ed4e6a7599a137611cfb44b'
  'ecfad8eae90f802d7041ad404582a4507f48c6329f6d8f7de8097d84d703552b')
