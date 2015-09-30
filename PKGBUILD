# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=dahdi-tools-gentoo
_realpkgname=${pkgname:0:11}
pkgver=2.10.2
pkgrel=1
pkgdesc="DAHDI tools for Asterisk"
arch=('i686' 'x86_64')
url="http://www.asterisk.org/"
license=('GPL2')
depends=('dahdi-linux-gentoo' 'libnewt' 'libusb' 'perl')
conflicts=('dahdi' 'dahdi-tools')
backup=('etc/dahdi/genconf_parameters' 'etc/dahdi/system.conf')
source=("http://downloads.asterisk.org/pub/telephony/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz"
        "http://mirror.netcologne.de/gentoo/distfiles/gentoo-dahdi-tools-patchset-0.4.tar.bz2")
sha256sums=('9e904815dedab231084c542d2d7d5dcc832ebec4b5d5d999a5d757df8b2d571a'
	     '71642a87e566220c7e7f908adb25dadcf87ff62a23150a6e6074708fd91297b1')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/01-blacklist-non-digium-modules.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/02-parallel-make.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/03-no-hardware-fiddling.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/04-vendorlib.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/05-respect-ldflags.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/06-respect-udev-rules.diff"

  # fix wrong installation paths.
  sed 's,/lib/udev,/usr/lib/udev,' -i xpp/Makefile
  sed 's,$(prefix)/sbin,$(prefix)/bin,' -i xpp/Makefile

  ./configure --sbindir=/usr/bin
  make DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 xpp/genconf_parameters "${pkgdir}"/etc/dahdi/genconf_parameters
}
