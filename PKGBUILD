# This PKGBUILD comes from the VDR4Arch project [https://github.com/vdr4arch]
# The goal of this AUR Package is to be as much close as possible to the latest OSCAM git commit

# Author: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Maintainer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=oscam-git
pkgver=11232
_gitrev=c83ab304819d0a330cc1bb50e73a7d84f4d696ae
pkgrel=1
pkgdesc="Open Source Conditional Access Module software"
url="http://www.streamboard.tv/oscam"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('libusb' 'openssl')
makedepends=('git' 'pcsclite')
optdepends=('pcsclite: for use with PC/SC readers'
            'ccid: PC/SC reader generic driver')
install='oscam.install'
source=("git+http://www.oscam.cc/git/oscam-mirror#commit=$_gitrev"
        'oscam-remove-sslv3.diff'
        'oscam.service'
        'oscam.sysuser')
md5sums=('SKIP'
         '6dbe54b15419308a343bea08aad6d65c'
         '596b902e3f4a66d39e7f993437feec74'
         'be0d9d7a5fdd8cf4918c4ea91cebd989')

pkgver() {
  cd "$srcdir/oscam-mirror"
  git log -1 | grep git-svn-id | cut -d'@' -f2 | cut -d' ' -f1
}

prepare() {
  cd "$srcdir/oscam-mirror"
  patch -p1 -i "$srcdir/oscam-remove-sslv3.diff"
}

build() {
  cd "$srcdir/oscam-mirror"

  make CONF_DIR=/var/lib/oscam \
       USE_SSL=1 \
       USE_LIBUSB=1 \
       USE_PCSC=1 \
       OSCAM_BIN=oscam \
       LIST_SMARGO_BIN=list_smargo \
       SVN_REV=$pkgver
}

package() {
  cd "$srcdir/oscam-mirror"

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
