# Maintainer: Paul Clark <paul500clark at gmail dot com>
# Contributor:  Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr@gmail.com>

_pkgname=xfce4-session
pkgname=xfce4-session-git
pkgver=4.12.0.r101.ge6aafcf
pkgrel=1
pkgdesc="Xfce session manager - git checkout"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck3' 'libsm' 'polkit' 'xorg-iceauth' 'xorg-xinit'
         'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xscreensaver: for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4'
            'xlockmore: for locking screen with xflock4'
            'slock: for locking screen with xflock4')
provides=('xfce4-session')
conflicts=('xfce4-session')
replaces=('xfce4-session')
install=$pkgname.install
source=(git://git.xfce.org/xfce/xfce4-session
        dbus-update-environment.patch
        xfce-polkit-gnome-authentication-agent-1.desktop)
sha256sums=('SKIP'
            '0a3f23c2ee1b73cec3ecb999b2cc1b5d97e7023482e42b418e6f14cd4f671c0b'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --disable-static \
      --disable-debug

  # Support using existing dbus-daemon
  patch -Np1 -i ../dbus-update-environment.patch

  make
}

package() {
  cd "$srcdir/${_pkgname}"

  make DESTDIR=${pkgdir} install

  # Provide a default PolicyKit Authentication Agent (FS#42569)
  install -d "$pkgdir/etc/xdg/autostart"
  cp "$srcdir/xfce-polkit-gnome-authentication-agent-1.desktop" \
    "$pkgdir/etc/xdg/autostart/"
}

# vim:set ts=2 sw=2 et:
