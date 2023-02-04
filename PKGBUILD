# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff-host
pkgname=$_pkgname-git
pkgver=1.2.3.r6.8fcae33
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

  semver="$(git describe --tags --long | sed 's/-.*g/+g/')"
  sed -i -e '1c#!/usr/bin/python3' -e s/_VERSIONHOLDER_/${semver}/g \
    src/passff.py

  install -Dm755 src/passff.py \
    "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.py"
  python -O -m compileall "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.py"

  jq '.path = "/usr/lib/mozilla/native-messaging-hosts/passff.py"' src/passff.json \
    > "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.json"
}

# vim:set ts=2 sw=2 et:
