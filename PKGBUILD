# Mantainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Roberto Carvajal <roberto@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=screem
pkgver=0.16.1
pkgrel=1
pkgdesc="A source oriented web site development environment for GNOME"
arch=(i686 x86_64)
license=('GPL')
url="http://www.screem.org"
depends=('gtk2' 'libgnome' 'gtksourceview' 'libgtkhtml' 'libgnomeui' 'libcroco' \
         'libgnomeprintui' 'startup-notification' 'enchant1.6' 'gnome-menus2' 'rarian' \
         'desktop-file-utils')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
install=screem.install
source=(http://downloads.sourceforge.net/sourceforge/screem/screem-${pkgver}.tar.gz
	goption.patch
	dbus-dontclose.patch
        glib.patch
        gtksourceview.patch
        screem-site-init.patch)
md5sums=('88bfc0afadb905ddbed9bdfbc869602a'
	 'd8f855a89a6f1479085cd88956d773c1'
	 '2a26231fbab056165d84bad03dfb3edd'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/goption.patch" || return 1
  patch -Np1 -i "${srcdir}/dbus-dontclose.patch" || return 1
  patch -p0 -i "${srcdir}/glib.patch"
  patch -p0 -i "${srcdir}/gtksourceview.patch"
  patch -p0 -i "${srcdir}/screem-site-init.patch"

  sed -e 's/-DGNOME_DISABLE_DEPRECATED//g' \
      -e 's/-DGNOMEUI_DISABLE_DEPRECATED//g' \
      -e 's/-DGTK_DISABLE_DEPRECATED//g' \
      -i configure || return 1

  LIBS="-lm" ./configure --prefix=/usr --sysconfdir=/etc \
        --localstatedir=/var \
	--disable-update-mime \
	--disable-update-desktop \
	--enable-dbus \
	--enable-enchant=no \
	--disable-schemas-install || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
   DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas --domain screem ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
