# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=graphlcd-base
pkgver=20130520
_gitver=1e01a8963f9ab95ba40ddb44a6c166b8e546053d
pkgrel=4
pkgdesc="Project to support graphical LC displays connected to the PC"
url="http://projects.vdr-developer.org/projects/show/graphlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'graphicsmagick' 'libusb-compat' 'libvncserver')
optdepends=('serdisplib: Add support for more serial displays')
makedepends=('git')
backup=('etc/graphlcd.conf')
source=("git://projects.vdr-developer.org/graphlcd-base.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --pretty=format:%ad --date=short | sed 's/-//g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i '/CFLAGS/d' Make.config
  sed -i '/CXXFLAGS/d' Make.config
  sed -i '/LDFLAGS/d' Make.config
  sed -i 's/#HAVE_DRIVER_AX206DPF/HAVE_DRIVER_AX206DPF/' Make.config
  sed -i 's/#HAVE_DRIVER_picoLCD_256x64/HAVE_DRIVER_picoLCD_256x64/' Make.config
  sed -i 's/#HAVE_GRAPHICSMAGICK/HAVE_GRAPHICSMAGICK/' Make.config
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/lib/udev/rules.d
  make DESTDIR="${pkgdir}" \
       BINDIR=${pkgdir}/usr/bin \
       LIBDIR=${pkgdir}/usr/lib \
       INCDIR=${pkgdir}/usr/include \
       MANDIR=${pkgdir}/usr/share/man \
       UDEVRULESDIR=${pkgdir}/usr/lib/udev/rules.d \
       install
  install -Dm644 graphlcd.conf "$pkgdir/etc/graphlcd.conf"
}
