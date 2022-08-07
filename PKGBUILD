# This PKGBUILD comes from the VDR4Arch project [https://github.com/vdr4arch]
# The goal of this AUR Package is to be as much close as possible to the latest OSCAM git commit

# Author: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Maintainer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=oscam-git
pkgver=11711
pkgrel=1
pkgdesc="Open Source Conditional Access Module software"
url="http://www.streamboard.tv/oscam"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
depends=('libusb' 'openssl' 'pcsclite')
makedepends=('subversion')
optdepends=('pcsclite: for use with PC/SC readers'
            'ccid: PC/SC reader generic driver')
conflicts=('oscam-svn')
install='oscam.install'
source=("$pkgname::svn+https://svn.streamboard.tv/oscam/trunk"
        'oscam.service'
        'oscam.sysuser')
sha256sums=('SKIP'
         'c3d8653531d59b61751ef26845a1cc5d78c5077353c6cf3f6d05eee425861b25'
         '3adbbfa4f388c6510b365719da251360dee9cc2885c5f82e06d56c246fcd26b0')

pkgver() {
  cd "$pkgname"
  LANG=C svn info | grep '^Revision:' | sed -e 's/^Revision: //'
}

build() {
  cd "$pkgname"

  make allyesconfig

  make -j$(getconf _NPROCESSORS_ONLN) \
       CONF_DIR=/var/lib/oscam \
       USE_SSL=1 \
       USE_LIBUSB=1 \
       USE_PCSC=1 \
       OSCAM_BIN=oscam \
       LIST_SMARGO_BIN=list_smargo \
       SVN_REV=$pkgver \
       EXTRA_CC_WARN=-w
}

package() {
  cd "$pkgname"

  #Install binaries
  install -Dm755 oscam "$pkgdir/usr/bin/oscam"
  install -Dm755 list_smargo "$pkgdir/usr/bin/list_smargo"

  #Install man-pages
  mkdir -p $pkgdir/usr/share/man/man1/
  mkdir -p $pkgdir/usr/share/man/man5/
  install -Dm644 Distribution/doc/man/*.1 "$pkgdir/usr/share/man/man1"
  install -Dm644 Distribution/doc/man/*.5 "$pkgdir/usr/share/man/man5"

  #Install service file
  install -Dm644 ${srcdir}/oscam.service "$pkgdir/usr/lib/systemd/system/oscam.service"

  #Install sysuser config
  install -Dm644 ${srcdir}/oscam.sysuser "$pkgdir/usr/lib/sysusers.d/oscam.conf"
}
