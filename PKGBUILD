# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

# Notes:
# AUR Git URL: ssh://aur@aur.archlinux.org/pkgname.git
# Remember to generate .SRCINFO

pkgname=rekall-git
pkgver=1.0rc11.r551.g8db49aa9
pkgrel=1
pkgdesc='Rekall Memory Forensic Framework'
url='http://www.rekall-forensic.com'
arch=('any')
license=('GPL')
makedepends=('python-setuptools' 'python-pip')
depends=('python')
source=("${pkgname}::git+https://github.com/google/rekall.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-lib
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-core/
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/rekall-agent/
  PIP_CONFIG_FILE=/dev/null pip --isolated install --root="$pkgdir" --ignore-installed --no-deps ${pkgname}/

  # Move some files/dirs out of /usr into /usr/share/$PKGNAME/
  mkdir -p "${pkgdir}/usr/share/${pkgname}"

  # rekall-agent creates /usr/messages and /usr/test_data
  mv "${pkgdir}/usr/messages" "${pkgdir}/usr/share/${pkgname}/"
  mv "${pkgdir}/usr/test_data" "${pkgdir}/usr/share/${pkgname}/"

  # rekall-core creates /usr/resources
  mv "${pkgdir}/usr/resources" "${pkgdir}/usr/share/${pkgname}/"

  # rekall creates /usr/tools
  mv "${pkgdir}/usr/tools" "${pkgdir}/usr/share/${pkgname}/"
}
