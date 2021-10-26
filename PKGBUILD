# Maintainer: Spyros Stathopoulos <spystath@gmail.com>

pkgname=owfs
pkgver=3.2p4
pkgrel=1
pkgdesc="An easy way to use the powerful 1-wire system of Dallas/Maxim."
arch=('i686' 'x86_64')
url="http://www.owfs.org/"
license=('GPL')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "systemd_journal.patch"
        "sysmacros.patch"
        "owfs.conf")
depends=('avahi' 'fuse' 'perl')
makedepends=('swig')
sha1sums=('972ec907dc2d6db238288fb5de730e9b78790955'
          'ff13b0a3d56206e32cf0307042351298e3f27d2d'
          '98d66d560509e1be20e4ad3cb812d934ed1e3bbe'
          '99a72935a8d2bdcd79a745983cda85fd5d3035f4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e 's|<libusb.h>|<libusb-1.0/libusb.h>|' "module/owlib/src/include/ow.h"
  patch -p1 < "../systemd_journal.patch"
  patch -p1 < "../sysmacros.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --disable-owtcl \
              --disable-owphp \
              --disable-owpython \
              --disable-zero \
              --with-systemdunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/owfs.conf" "${pkgdir}/usr/lib/sysusers.d/owfs.conf"
}

# vim:ts=2:sw=2:et
