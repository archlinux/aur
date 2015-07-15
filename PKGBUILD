# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# $Id: PKGBUILD 146720 2012-01-16 19:50:57Z dreisner $
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=mail-notification
pkgver=5.4.r69.g9ae8768
pkgrel=1
pkgdesc="Tray icon application that informs you if you have new mail"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/mailnotify/"
license=('GPL3' 'FDL')
depends=('gmime' 'libnotify' 'gnome-keyring' 'hicolor-icon-theme' 'notification-daemon' 'libgnome')
makedepends=('gob2' 'intltool' 'evolution' 'gnome-doc-utils' 'gtk2')
options=('!libtool' '!emptydirs')
install=mail-notification.install
source=(git+https://github.com/epienbroek/mail-notification.git
        http://pkgs.fedoraproject.org/cgit/mail-notification.git/plain/mail-notification-jb-gcc-format.patch)
sha256sums=('SKIP'
            'a7646259ca72b58165e4e1c8cf12b197e32807459c4291867479ef3520d39732')

pkgver() {
  cd "${srcdir}/${pkgname}"

  git tag -f v5.4 7a2c97e1f48cfb8cd6e21a1d619fd589dfa19ef0
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -Np1 < "${srcdir}/mail-notification-jb-gcc-format.patch"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./jb configure prefix=/usr sysconfdir=/etc \
      localstatedir=/var destdir="${pkgdir}" \
      gconf-schemas-dir=/etc/gconf/schemas install-gconf-schemas=no \
      cflags="${CFLAGS}" cppflags="${CXXFLAGS}" ldflags="${LDFLAGS}" \
      library-mode=0755
  ./jb build
}

package() {
  cd "${srcdir}/${pkgname}"

  GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 ./jb install

  rm -f "${pkgdir}/usr/share/mail-notification/"*.glade
  install -m644 ui/mailbox-properties-dialog.ui "${pkgdir}/usr/share/mail-notification/"
  install -m644 ui/properties-dialog.ui "${pkgdir}/usr/share/mail-notification/"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas --domain mail-notification ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

# vim: ts=2:sw=2:et
