# Maintainer: lxxero <xero@xeron.cc>

pkgname=appletalk-dkms-git
_pkgname=appletalk
pkgver=r60.82c9c7b
pkgrel=1
pkgdesc="AppleTalk (DDP/AARP) kernel module removed in Linux 7.2, built out of tree from linux-netdev/mod-orphan (DKMS)"
arch=('any')
url="https://github.com/linux-netdev/mod-orphan"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
optdepends=('netatalk: atalkd, papd, pap and AFP over AppleTalk')
provides=('appletalk-dkms')
conflicts=('appletalk-dkms')
source=("mod-orphan::git+https://github.com/linux-netdev/mod-orphan.git"
        'Kbuild'
        'Makefile'
        'dkms.conf')
sha256sums=('SKIP'
            '52308791169f2c122a626597f928184091dfac54063fa125c01935d11f2b4da9'
            'd18197a185d520d814ef0b158c283aed833aa21d9fe24ad849785df0d2756e0b'
            'b4a21ad8322010a7fd42aeb1190029e80d5327c43da9a4a5962627a80407d29c')

pkgver() {
  cd mod-orphan
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  local _dest="$pkgdir/usr/src/$_pkgname-$pkgver"

  # Only the AppleTalk part of mod-orphan, laid out as upstream has it so
  # net/appletalk/Kbuild finds ../../include/hamradio_compat.h.
  install -d "$_dest/net"
  cp -r mod-orphan/net/appletalk "$_dest/net/"
  install -Dm644 mod-orphan/include/hamradio_compat.h "$_dest/include/hamradio_compat.h"
  install -Dm644 mod-orphan/include/linux/atalk.h "$_dest/include/linux/atalk.h"

  install -Dm644 -t "$_dest" Kbuild Makefile
  sed "s/@PKGVER@/$pkgver/" dkms.conf > "$_dest/dkms.conf"
}
