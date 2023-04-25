# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor:  Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

pkgname=rtw88-dkms-git
_pkgname=rtw88
pkgver=r242.166b839
pkgrel=1
pkgdesc='Newest Realtek rtlwifi codes'
arch=('any')
url='https://github.com/lwfinger/rtw88'
depends=('dkms')
makedepends=('git' 'gcc' 'make')
provides=('rtlwifi_new-dkms')
conflicts=('rtlwifi_new-dkms')
provides=('rtlwifi_new-dkms' 'rtlwifi_new-extended-dkms-git' 'rtlwifi_new-rtw88-dkms')
conflicts=('rtlwifi_new-dkms' 'rtlwifi_new-extended-dkms-git' 'rtlwifi_new-rtw88-dkms')
replaces=('rtlwifi_new-extended-dkms-git' 'rtlwifi_new-rtw88-dkms-git')
install=${pkgname}.install
source=("git+https://github.com/lwfinger/rtw88.git"
        "${pkgname}.conf")
sha256sums=('SKIP'
            '20c128b5d285b75dc06f4feee5acfbed1719fc39aef137cde65993baf79a0495')

pkgver() {
  cd "${_pkgname}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "${pkgdir}/usr/src"
  cp -dr --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Set name and version
  sed -e "s/0.6/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
  sed -e "s/rtlwifi-new/${_pkgname}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  # Blacklists conflicting module
  install -Dm644 ${pkgname}.conf "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
