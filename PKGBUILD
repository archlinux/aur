# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iputils-git
pkgver=s20161105.r31.gef740f5
pkgrel=1
pkgdesc="Network monitoring tools, including ping"
arch=('i686' 'x86_64')
url="https://github.com/iputils/iputils"
license=('Custom')
depends=('glibc' 'libcap' 'libidn' 'openssl')
optdepends=('xinetd: for tftpd')
makedepends=('git' 'libxslt')
provides=('iputils')
conflicts=('iputils')
backup=(etc/xinetd.d/tftp)
install=iputils.install
source=("git+https://github.com/iputils/iputils.git"
        "tftp.xinetd::https://git.archlinux.org/svntogit/packages.git/plain/trunk/tftp.xinetd?h=packages/iputils")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "iputils"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iputils"

  make CCOPTOPT="$CFLAGS" USE_NETTLE=no
  make -C doc man
}

package() {
  cd "iputils"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 arping clockdiff ping rarpd rdisc tftpd tracepath \
    "$pkgdir/usr/bin/"

  install -dm755 "$pkgdir/usr/share/man/man8"
  install -m644 doc/{arping,clockdiff,ping,rarpd,rdisc,tftpd,tracepath}.8 \
    "$pkgdir/usr/share/man/man8/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/iputils/LICENSE"
  install -Dm644 "LICENSE.BSD3" "$pkgdir/usr/share/licenses/iputils/LICENSE.BSD3"

  install -Dm644 "$srcdir/tftp.xinetd" "$pkgdir/etc/xinetd.d/tftp"
}
