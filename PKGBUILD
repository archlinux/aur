# Maintainer: Robert Sprunk <arch-aur@sprunk.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=lirc-devinput
_pkgname=lirc
_pkgver=0.10.1
[[ $_pkgver =~ [a-z]$ ]] && pkgver="${_pkgver:0:-1}.${_pkgver: -1}" || pkgver="$_pkgver"
pkgrel=6
epoch=1
pkgdesc="Linux Infrared Remote Control utilities with devinput enabled"
arch=('x86_64')
url="https://www.lirc.org/"
license=('GPL')
depends=('alsa-lib' 'libx11' 'libftdi-compat' 'libusb-compat')
makedepends=('help2man' 'alsa-lib' 'libx11' 'libxslt' 'python' 'python-setuptools'
             'systemd')
optdepends=('python: for lirc-setup, irdb-get and pronto2lirc')
provides=('lirc-utils' 'lirc')
conflicts=('lirc-utils' 'lirc')
replaces=('lirc-utils')
backup=('etc/lirc/lirc_options.conf' 'etc/lirc/lircd.conf' 'etc/lirc/lircmd.conf')
source=("https://prdownloads.sourceforge.net/${_pkgname}/${_pkgname}-${_pkgver}.tar.bz2"
        lirc-0.10-build-fix.patch
        lirc.logrotate
        lirc.tmpfiles)
sha1sums=('9d6f6d18ac566a96ef4ca1d6909a4e8bc517d48a'
          '952ce902c94d822b0113d8e74bc6fda6a551ad7e'
          '4342b004eb53d51fcbb9af2cf136bb4990874608'
          '5cd3f206e6e60632d9bea2ce9d22dbe5283eb129')

prepare() {
  cd "${srcdir}/lirc-${_pkgver}"

  patch -p1 -i ../lirc-0.10-build-fix.patch

  autoreconf -fi
  automake -ac
}

build() {
  cd "${srcdir}/lirc-${_pkgver}"

  HAVE_UINPUT=1 ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --enable-devinput
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/lirc-${_pkgver}"

  make DESTDIR="${pkgdir}" -j1 install

  install -Dm644 "${srcdir}"/lirc.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lirc.conf
  install -Dm644 "${srcdir}"/lirc.logrotate "${pkgdir}"/etc/logrotate.d/lirc

  rmdir "${pkgdir}"/var/{run/lirc/,run/}
}
