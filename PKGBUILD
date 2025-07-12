# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=universal-pidff
pkgname=$_reponame-dkms-git
provides=($_reponame-dkms)
pkgver=0.1.0
pkgrel=5
pkgdesc="Development package for hid-pidff and hid-universal-pidff"
arch=('x86_64')
url="https://github.com/JacKeTUs/$_reponame"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  git+https://github.com/JacKeTUs/$_reponame
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_warning() {
  _GREEN="\e[32m"
  _YELLOW="\e[33m"
  _BOLDRED="\e[1;31m"
  _ENDCOLOR="\e[0m"

  echo ""
  echo -e "${_BOLDRED}!!! WARNING !!!${_ENDCOLOR}"
  echo ""
  echo -e "${_YELLOW}hid-universal-pidff${_ENDCOLOR}"
  echo "This driver has been upstreamed with Linux 6.15 and"
  echo "has been backported to 6.14.3, 6.13.12 and 6.12.24"
  echo ""
  echo -e "If you're not ${_GREEN}testing${_ENDCOLOR} new things during driver"
  echo -e "development you should ${_YELLOW}uninstall${_ENDCOLOR} this package."
  echo ""
  echo "Ignore this warning if you're using older kernels or"
  echo -e "if you're on a ${_YELLOW}Steam Deck${_ENDCOLOR}"
  echo ""
  echo -e "${_BOLDRED}!!! WARNING !!!${_ENDCOLOR}"
  echo ""
}

package() {
  cd "$srcdir/$_reponame" || exit

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  install -dm755 "${pkgdir}/usr/src/universal-pidff-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/universal-pidff-${pkgver}"

  _warning
}
