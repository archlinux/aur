# $Id$
# Maintainer: Evan Penner <evaninrussia@gmail.com>
# Based on cinnamon PKGBUILD

_pkgname=cinnamon
pkgname=${_pkgname}-git
pkgver=3910.dfdcb08
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
        "set_wheel.patch")
sha256sums=('SKIP'
            '3c4c7bb65d9e3b7d5569a14a45ebf08d2326250869645511dfa18d87b8eaf444')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd ${srcdir}/cinnamon

  # Use wheel group instread of sudo
  patch -Np1 -i ../set_wheel.patch

  # Add polkit agent to required components
  sed -i 's/RequiredComponents=\(.*\)$/RequiredComponents=\1polkit-gnome-authentication-agent-1;/' files/usr/share/cinnamon-session/sessions/cinnamon*.session

  # Use pkexec instead of gksu
  sed -i 's/gksu/pkexec/' files/usr/bin/cinnamon-settings-users

  # Check for the cc-panel path, not for the unneeded binary
  sed -i 's|/usr/bin/cinnamon-control-center|/usr/lib/cinnamon-control-center-1/panels|' files/usr/bin/cinnamon-settings

  # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
  sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
    files/usr/lib/cinnamon-settings/modules/cs_backgrounds.py
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
