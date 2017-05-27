# $Id$
# Maintainer: Christoph Böhmwalder <christoph@boehmwalder.at>
# Based on cinnamon PKGBUILD

_pkgname=cinnamon
pkgname=${_pkgname}-git
pkgver=6161.3842206a
pkgrel=1
pkgdesc="A Linux desktop which provides advanced innovative features and a traditional user experience"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/Cinnamon"
license=('GPL2')
depends=('cinnamon-settings-daemon-git' 'cinnamon-session-git' 'cinnamon-desktop-git' 
         'cinnamon-control-center-git' 'cjs-git' 'cinnamon-menus-git' 
         'cinnamon-translations-git' 'muffin-git' 'cinnamon-screensaver-git'
         'nemo-dev' 'polkit-gnome'
         'network-manager-applet' 'gnome-icon-theme' 'gnome-themes-standard'
         'accountsservice' 'caribou' 'clutter-gtk' 'gconf' 'libgnomekbd' 
         'gnome-themes-standard' 'gstreamer' 'libgnome-keyring'
         'librsvg' 'networkmanager'  'python2-dbus' 'python2-pillow'
         'python2-pam' 'python2-pexpect' 'python2-pyinotify' 'python2-lxml' 'webkitgtk' 
	 'xorg-server')
makedepends=('gnome-common' 'intltool' 'git')
options=('!emptydirs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install=${pkgname}.install
source=("${_pkgname}"::git+https://github.com/linuxmint/cinnamon.git
        "use-wheel.patch"
	"default-theme.patch")
sha256sums=('SKIP'
            '5c98d0e44c2cc2c11fac42a10a22f999ba60016b06fc6e45416484febe048417'
	    '566585873f38a79ec248b916645a2e081abec3c6d4df2c34339cde1f35375cc5')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd ${srcdir}/cinnamon

  # Use wheel group instread of sudo
  patch -Np1 -i ../use-wheel.patch

  # Set default theme to 'cinnamon'
  patch -Np1 -i ../default-theme.patch

  # Add polkit agent to required components
  sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' files/usr/share/cinnamon-session/sessions/cinnamon*.session

  # Use pkexec instead of gksu
  sed -i 's/gksu/pkexec/' files/usr/bin/cinnamon-settings-users

  # Check for the cc-panel path, not for the unneeded binary
  sed -i 's|/usr/bin/cinnamon-control-center|/usr/lib/cinnamon-control-center-1/panels|' files/usr/bin/cinnamon-settings

  # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
  sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
    files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py

  # Fix selected background color in Cinnamon Settings for Adwaita theme
  sed -i 's/@selected_bg_color;/@theme_selected_bg_color;/' \
    files/usr/share/cinnamon/cinnamon-settings/cinnamon-settings.py

  # GNOME Terminal desktop file was renamed in GNOME 3.20
  sed -i 's/gnome-terminal.desktop/org.gnome.Terminal.desktop/' data/org.cinnamon.gschema.xml.in \
    files/usr/share/cinnamon/applets/panel-launchers@cinnamon.org/settings-schema.json

  # Replace MintInstall with GNOME Software
  sed -i 's/mintinstall.desktop/org.gnome.Software.desktop/' data/org.cinnamon.gschema.xml.in

  # Remove broken symlink
  rm files/etc/xdg/menus/cinnamon-applications-merged
}

build() {
  cd ${srcdir}/cinnamon

  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --libexecdir=/usr/lib/cinnamon \
               --localstatedir=/var \
               --disable-static \
               --disable-schemas-compile \
               --with-session-tracking=systemd
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}
