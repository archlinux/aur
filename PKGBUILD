# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: AXVill
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: xjpvictor Huang <ke [AT] xjpvictor [DOT] info>
# Contributor: uuwe
pkgname=openswan-git
_pkgname=openswan
pkgver=2.6.51.3.r106.g56e81f917
pkgrel=1
pkgdesc='Open Source implementation of IPsec for the Linux operating system'
url='https://www.openswan.org'
arch=('i686' 'x86_64')
license=('GPL' 'custom')
depends=('gmp' 'perl' 'iproute2')
makedepends=('flex' 'bison' 'git')
optdepends=('python2')
provides=($_pkgname)
conflicts=($_pkgname 'ipsec-tools')
options=('!makeflags')
backup=('etc/ipsec.conf'
        'etc/ipsec.d/policies/'{block,clear,clear-or-private,private,private-or-clear})
source=("$pkgname::git+https://github.com/xelerance/Openswan.git#branch=2.6.52"
        'openswan.service')
md5sums=('SKIP'
         '8195505574c86f990cec2fb85ac9a780')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname

  # Change install paths to Arch defaults
  sed -i 's,INC_MANDIR=man,INC_MANDIR=share/man,' Makefile.inc
  sed -i 's,/usr/local,/usr,;s,libexec/ipsec,lib/openswan,;s,/sbin,/bin,' Makefile.inc

  # Replace invalid init script paths with systemd script path
  sed -i 's,^INC_RCDIRS.*,INC_RCDIRS?=/usr/lib/systemd/scripts,' Makefile.inc
}

build() {
  cd $pkgname
  make USE_XAUTH=true USE_OBJDIR=true programs
}

package() {
  cd $pkgname

  # Pre-create init script directory
  mkdir -p "$pkgdir/usr/lib/systemd/scripts"

  make DESTDIR="$pkgdir" install

  # Remove /var (/run/pluto handled by .service file)
  rm -r "$pkgdir/var"

  # Remove empty man directory
  rm -r "$pkgdir/usr/share/man/man3"

  # Copy License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install service unit
  install -Dm644 "$srcdir/openswan.service" "$pkgdir/usr/lib/systemd/system/openswan.service"

  # fix python2
  sed -i '1s|python|python2|' "$pkgdir/usr/lib/openswan/verify"
}
