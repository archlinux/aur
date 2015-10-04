# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
pkgname="dahdi-tools"
pkgdesc="DAHDI tools for Asterisk (Digium, OpenVox, Allo and Yeastar cards)"
pkgver=2.10.2
pkgrel=1
arch=("i686" "x86_64")
url="http://www.asterisk.org/"
license=("LGPLv2")
depends=("dahdi-linux" "libusb" "perl")
backup=(
  "etc/dahdi/genconf_parameters"
  "etc/dahdi/system.conf"
)
source=(
  "http://downloads.asterisk.org/pub/telephony/dahdi-tools/${pkgname}-${pkgver}.tar.gz"
  "http://mirror.netcologne.de/gentoo/distfiles/gentoo-dahdi-tools-patchset-0.4.tar.bz2"
  "dahdi-tools-2.10.1-gcc510.patch"
)
sha256sums=(
  "9e904815dedab231084c542d2d7d5dcc832ebec4b5d5d999a5d757df8b2d571a"
  "71642a87e566220c7e7f908adb25dadcf87ff62a23150a6e6074708fd91297b1"
  "f14128582ee6bf9695ef3eb700c62003a5167a77a124015043c0acaee23ce653"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # enable additional drivers.
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/01-blacklist-non-digium-modules.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/02-parallel-make.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/03-no-hardware-fiddling.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/04-vendorlib.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/05-respect-ldflags.diff"
  patch -Np1 -i "${srcdir}/dahdi-tools-patchset/06-respect-udev-rules.diff"

  # compile fixes for latest gcc.
  patch -Np1 -i "${srcdir}/dahdi-tools-2.10.1-gcc510.patch"

  # fix wrong installation paths.
  sed 's,$(prefix)/sbin,$(prefix)/bin,' -i xpp/Makefile

  # compile.
  ./configure --sbindir=/usr/bin
  make DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 0644 xpp/genconf_parameters "${pkgdir}/etc/dahdi/genconf_parameters"
}
