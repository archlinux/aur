# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>

pkgname=spideroak-systemd-git
pkgdesc="Systemd service for SpiderOak-One"
pkgver=r17.a0d0117
pkgrel=1
arch=('any')
url="https://github.com/hv15/spideroak-systemd"
license=('custom')
makedepends=('git')
depends=('spideroak-one')
install='spideroak-systemd.install'
source=("spideroak-systemd-git::git+https://github.com/hv15/spideroak-systemd.git"
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
  install -Dm644 .spideroak.rc "$pkgdir/usr/share/$pkgname/spideroak.rc.proto"

  # license
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"
}
