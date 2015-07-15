# $Id: PKGBUILD 146720 2012-01-16 19:50:57Z dreisner $
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=mail-notification
pkgver=5.4
pkgrel=10
pkgdesc="Tray icon application that informs you if you have new mail"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/mailnotify/"
license=('GPL3' 'FDL')
depends=('gmime' 'libnotify' 'gnome-keyring' 'hicolor-icon-theme' 'notification-daemon' 'libgnome')
makedepends=('gob2' 'intltool' 'evolution' 'gnome-doc-utils' 'gtk2')
options=('!libtool' '!emptydirs')
install=mail-notification.install
source=(http://savannah.nongnu.org/download/mailnotify-orig/${pkgname}-${pkgver}.tar.bz2
        dont-update-cache.patch
        remove-ubuntu-special-case.patch
        mail-notification-5.4-evolution.patch
        mail-notification-5.4-sasl_encode64.patch
        mail-notification-5.4-evolution-gtkhtml.patch
        mail-notification-5.4-camel_headers.patch
        mail-notification-5.4-icons.patch
        mail-notification-5.4-weak.patch
        mail-notification-5.4-popup-attach.patch
        mail-notification-5.4-kde-trayicon.patch
        mail-notification-5.4-evolution-3-0-support.patch
        mail-notification-5.4-gtk3-support.patch
        mail-notification-5.4-add-fallback-icon.patch
        mail-notification-5.4-gmime.patch
        mail-notification-5.4-libx11.patch)
md5sums=('c8dc33a61251acb5474e56eab6b18f43'
         '6007bc30e789dab0a8282038e0335eb9'
         '9cadd61bbd9c324b2916ec980231e0f2'
         'aa6f80820899f904c25988772f70ade9'
         '125513ed059f62469377eb0ab794dbed'
         'c595a3962ab13a65be24a941e28faa9c'
         'f79939f593b2e8659e302df72c2b54b1'
         '244b7ef2aec7656e8df390be87c10e2b'
         '31bde95dfd39449959d8b3316f91429c'
         'cdead6a88d1779f69a5f40dc75d5cb84'
         'c7991b831834724eddc1c6802c3e06a6'
         'b370b1085ebb2814bd5d345a6d2b45ea'
         '1ba948759110787dd57097cff157b75a'
         '09df61b4dc29c676ac81ff9054e840ac'
         '0944695e9b9b30f39028f85c83c6a7e2'
         'c3f643ef16aab3b4fe9ff5b333bff41a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np0 -i "${srcdir}/dont-update-cache.patch"
  patch -Np0 -i "${srcdir}/remove-ubuntu-special-case.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-evolution.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-sasl_encode64.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-evolution-gtkhtml.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-camel_headers.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-icons.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-weak.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-popup-attach.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-kde-trayicon.patch"
  patch -Np0 -i "${srcdir}/mail-notification-5.4-evolution-3-0-support.patch"
  patch -Np0 -i "${srcdir}/mail-notification-5.4-gtk3-support.patch"
  patch -Np0 -i "${srcdir}/mail-notification-5.4-add-fallback-icon.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-gmime.patch"
  patch -Np1 -i "${srcdir}/mail-notification-5.4-libx11.patch"

  gtk-builder-convert ui/mailbox-properties-dialog.glade ui/mailbox-properties-dialog.ui
  gtk-builder-convert ui/properties-dialog.glade ui/properties-dialog.ui

  ./jb configure prefix=/usr sysconfdir=/etc \
      localstatedir=/var destdir="${pkgdir}" \
      gconf-schemas-dir=/etc/gconf/schemas install-gconf-schemas=no \
      cflags="${CFLAGS}" cppflags="${CXXFLAGS}" ldflags="${LDFLAGS}" \
      library-mode=0755
  ./jb build
  GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 ./jb install

  rm -f "${pkgdir}/usr/share/mail-notification/"*.glade
  install -m644 ui/mailbox-properties-dialog.ui "${pkgdir}/usr/share/mail-notification/"
  install -m644 ui/properties-dialog.ui "${pkgdir}/usr/share/mail-notification/"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas --domain mail-notification ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
