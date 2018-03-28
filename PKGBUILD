# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff-host
pkgname=$_pkgname-git
pkgver=1.0.1.r7.1feab77
pkgrel=1
pkgdesc="Host app for the WebExtension PassFF"
arch=(any)
url="https://github.com/passff/passff-host"
license=('GPL2')
depends=('python')
makedepends=(git jq)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/passff/passff-host.git")
sha384sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$_pkgname"

  sed -i -e '1c#!/usr/bin/python3' -e s/_VERSIONHOLDER_/${pkgver}/g src/passff.py

  install -Dm755 src/passff.py \
    "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.py"
  jq '.path = "/usr/lib/mozilla/native-messaging-hosts/passff.py"' src/passff.json \
    > "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.json"
}

# vim:set ts=2 sw=2 et:
