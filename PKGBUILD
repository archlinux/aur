# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tftp-hpa-git
pkgver=5.2.r10.gb2b34ce
pkgrel=2
pkgdesc="Official tftp server"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git"
license=('BSD')
depends=('glibc' 'readline>=6.0.00')
makedepends=('git')
provides=("tftp-hpa=$pkgver")
conflicts=('tftp-hpa')
backup=('etc/conf.d/tftpd')
source=("git+https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git"
        "tftpd.conf::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/tftp-hpa/trunk/tftpd.conf"
        "tftpd.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/tftp-hpa/trunk/tftpd.service"
        "tftpd.socket::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/tftp-hpa/trunk/tftpd.socket")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "tftp-hpa"

  git describe --long --tags | sed 's/^tftp-hpa-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tftp-hpa"

  ./autogen.sh
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

package() {
  cd "tftp-hpa"

  make INSTALLROOT="$pkgdir" install

  install -Dm644 "$srcdir/tftpd.conf" "$pkgdir/etc/conf.d/tftpd"
  install -d "$pkgdir/srv/tftp"
  install -Dm644 "$srcdir/tftpd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/tftpd.socket" -t "$pkgdir/usr/lib/systemd/system"

  sed -n '/Copyright (c) 1983/,/SUCH DAMAGE./p' "tftpd/tftpd.c" > "LICENSE"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tftp-hpa"

  # Remove conflict with iputils
  rm "$pkgdir/usr/share/man/man8/tftpd.8"
}
