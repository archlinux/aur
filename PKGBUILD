# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>

_pkgname=spideroak-systemd
pkgname=${_pkgname}-git
pkgdesc="Systemd service for SpiderOak-One"
pkgver=r20.cc2366a
pkgrel=1
arch=('any')
url="https://github.com/hv15/${_pkgname}"
license=('custom:CC0-1.0')
makedepends=('git')
depends=('spideroak-one')
install="${_pkgname}.install"
source=("${pkgname}::git+https://github.com/hv15/${_pkgname}.git"
        'spideroak-systemd.install')
md5sums=('SKIP'
         'f6884dd8db3619c7e184396b9cb8a164')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"

  # systemd files
  install -Dm644 spideroak@.service "$pkgdir/usr/lib/systemd/system/spideroak@.service"
  install -Dm755 spideroak.sh "$pkgdir/usr/lib/systemd/scripts/spideroak"

  # example resource file
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 .spideroak.rc "$pkgdir/usr/share/$pkgname/spideroak.rc.proto"

  # license
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
