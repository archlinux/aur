# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=lirc-git
_pkgname=lirc
pkgver=r3281.888a28ad
pkgrel=2
pkgdesc="Linux Infrared Remote Control utils. Git version."
arch=('x86_64')
url="https://www.lirc.org/"
license=('GPL')
depends=('alsa-lib' 'libx11' 'libftdi' 'libusb-compat')
makedepends=('help2man' 'alsa-lib' 'libx11' 'libxslt' 'python' 'python-setuptools'
             'python-yaml' 'systemd' 'git')
optdepends=('python: for lirc-setup, irdb-get and pronto2lirc'
            'python-gobject: for lirc-setup and irdb-get'
            'python-yaml: for lirc-setup and irdb-get')
provides=('lirc-utils' 'lirc')
conflicts=('lirc-utils')
replaces=('lirc-utils')
backup=('etc/lirc/lirc_options.conf' 'etc/lirc/lircd.conf' 'etc/lirc/lircmd.conf')
source=("git://lirc.git.sourceforge.net/gitroot/lirc/lirc"
        lirc-0.10-build-fix.patch
        lirc.logrotate
        lirc.tmpfiles)
md5sums=('SKIP'
         'd80cd25aa263531f098d0b90bde08056'
         '3deb02604b37811d41816e9b4385fcc3'
         'febf25c154a7d36f01159e84f26c2d9a')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  patch -p1 -i ../lirc-0.10-build-fix.patch

  autoreconf -fi
  automake -ac
}

build() {
  cd "$srcdir/$_pkgname"

  #HAVE_UINPUT=1 ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-devinput \
    --enable-uinput
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
