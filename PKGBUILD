# $Id$
# Maintainer: Realex
# Based on cinnamon-control-center PKGBUILD

_pkgname=cinnamon-control-center
pkgname=${_pkgname}-git
pkgver=337.9677670
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=('i686' 'x86_64')
depends=('cinnamon-settings-daemon-git' 'cinnamon-translations-git' 'cinnamon-menus-git' 'libgnomekbd' 'network-manager-applet')
optdepends=('gnome-color-manager: for color management tasks')
makedepends=('intltool' 'gnome-common' 'docbook-xsl' 'git')
url="https://github.com/linuxmint/cinnamon-control-center"
install=${pkgname}.install
license=('GPL')
options=('!emptydirs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/linuxmint/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"

./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --enable-systemd \
      --disable-update-mimedb

  #https://bugzilla.gnome.org/show_bug.cgi?id=656229
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install

  # Remove unused stuff
  make -C panels/sound DESTDIR="$pkgdir" uninstall
  make -C panels/sound/data DESTDIR="$pkgdir" install
  make -C shell DESTDIR="$pkgdir" uninstall-binPROGRAMS uninstall-directoryDATA uninstall-uiDATA
  rm -R "$pkgdir"/usr/share/applications/cinnamon-{control-center,datetime-panel,region-panel,sound-panel}.desktop
  rm -R "$pkgdir/etc"

  # Fix a warning
  chown 102:0 "$pkgdir/usr/share/polkit-1/rules.d"
  chmod 700 "$pkgdir/usr/share/polkit-1/rules.d"
}
