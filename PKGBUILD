# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: eliott <eliott@cactuswax.net>

_name=tripwire-open-source
pkgname=tripwire-git
pkgver=r373.4c84a88
pkgrel=1
pkgdesc="intrusion detection system"
arch=('i686' 'x86_64')
url="https://github.com/Tripwire/tripwire-open-source"
license=('GPL')
depends=('openssl-1.1')
optdepends=('lynis')
makedepends=('git' 'automake')
provides=('tripwire')
conflicts=('tripwire')
backup=('etc/tripwire/twpol.txt' 'etc/tripwire/twcfg.txt')
install=$pkgname.install
source=($_name::git+https://github.com/Tripwire/tripwire-open-source.git#branch=master
        twpol.txt
        twcfg.txt)
sha256sums=('SKIP'
            '4da49a185fee570e0a7bdc7acaadc0d2bf7f4c488057e93e60b2a2819807cd9d'
            '3aaa567f7a0a4efce3ac127344a9b795c5494c9d011e27a7d454d632ba3d533d')


pkgver() {
 cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${_name}

  # adjust paths
  sed -i 's#./install/install.cfg#./install.cfg#' installer/install.sh

  # autotools stuff
  autoreconf --force --install
  ./autogen.sh
  ./configure --sysconfdir=/etc/tripwire
}
build() {
  cd ${_name}
  make -j4
}

package () {
  cd ${_name}

  # This package doesn't have a typical make install, so we do it by hand.
  #create var/lib directories
  install -d ${pkgdir}/var/lib
  install -d -m700 ${pkgdir}/var/lib/tripwire
  install -d -m700 ${pkgdir}/var/lib/tripwire/report

  #install binaries
  install -d ${pkgdir}/usr/bin
  install -m755 bin/siggen ${pkgdir}/usr/bin/
  install -m755 bin/tripwire ${pkgdir}/usr/bin/
  install -m755 bin/twadmin ${pkgdir}/usr/bin/
  install -m755 bin/twprint ${pkgdir}/usr/bin/

  #copy install files for use by user after install, and fix a path
  install -d ${pkgdir}/usr/share/$pkgname
  install -m755 installer/install.sh ${pkgdir}/usr/share/$pkgname/
  install -m644 installer/install.cfg ${pkgdir}/usr/share/$pkgname/
  
  #install man pages - FS#13766 fixed
  install -d ${pkgdir}/usr/share/man/{man4,man5,man8}
  install -m644 man/man4/*.4 ${pkgdir}/usr/share/man/man4/
  install -m644 man/man5/*.5 ${pkgdir}/usr/share/man/man5/
  install -m644 man/man8/*.8 ${pkgdir}/usr/share/man/man8/

  #install configuration files
  mkdir ${pkgdir}/etc
  mkdir ${pkgdir}/etc/tripwire
  install -d ${pkgdir}/etc/$pkgname
  install -m644 ${srcdir}/twpol.txt ${pkgdir}/etc/tripwire/twpol.txt
  install -m644 ${srcdir}/twcfg.txt ${pkgdir}/etc/tripwire/twcfg.txt
}
