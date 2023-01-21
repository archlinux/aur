pkgname=rtl8723du-dkms-git
_pkgbase=${pkgname%-*-*}
pkgver=r208.efcaffb
package_version="0.1"
pkgrel=1
pkgdesc="RTL8723DU wireless + bluetooth modules (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/lwfinger/rtl8723du"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")

source=("git+${url}" 
        "dkms.conf")

md5sums=('SKIP'
         '23f628baafb38cdb24354ef1ff408827')

pkgver() {
  cd ${_pkgbase}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm 755 "${pkgdir}/usr/src/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgbase}/" "${pkgdir}/usr/src/${_pkgbase}-${package_version}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${package_version}/dkms.conf"

  # Set name and version
  sed -e "s/@PKGVER@/${package_version}/" \
          -i "${pkgdir}"/usr/src/${_pkgbase}-${package_version}/dkms.conf
}
