# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=lirc-git
_pkgname=lirc
pkgver=r3261.fc67ec65
pkgrel=1
pkgdesc="Linux Infrared Remote Control utils. Git version."
arch=('x86_64')
url="http://www.lirc.org/"
license=('GPL')
depends=('alsa-lib' 'libx11' 'libftdi' 'libusb-compat')
makedepends=('help2man' 'alsa-lib' 'libx11' 'libxslt' 'git' 'python-setuptools')
optdepends=('python: for lirc-setup, irdb-get and pronto2lirc')
provides=('lirc-utils' 'lirc')
conflicts=('lirc-utils' 'lirc')
replaces=('lirc-utils')
backup=('etc/lirc/lirc_options.conf' 'etc/lirc/lircd.conf' 'etc/lirc/lircmd.conf')
source=("git://lirc.git.sourceforge.net/gitroot/lirc/lirc"
lirc.logrotate lirc.tmpfiles
unfuck_build.patch)
md5sums=('SKIP'
         '3deb02604b37811d41816e9b4385fcc3'
         'febf25c154a7d36f01159e84f26c2d9a'
         'ed4241a5da975834fd08966d693987f7')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i ../unfuck_build.patch
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  HAVE_UINPUT=1 ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="${pkgdir}" -j1 install

  install -Dm644 "${srcdir}"/lirc.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lirc.conf
  install -Dm644 "${srcdir}"/lirc.logrotate "${pkgdir}"/etc/logrotate.d/lirc

  rmdir "${pkgdir}"/var/{run/lirc/,run/}
}

# vim:set ts=2 sw=2 et:
