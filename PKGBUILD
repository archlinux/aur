# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Paul Clark <paul500clark at gmail dot com>
# Contributor: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr@gmail.com>

_pkgname=xfce4-session
pkgname=${_pkgname}-git
pkgver=4.13.2+1+g0b1e5933
pkgrel=1
pkgdesc="Xfce session manager (git checkout)"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('libxfce4ui' 'libwnck3' 'libsm' 'polkit' 'xorg-iceauth' 'xorg-xinit'
         'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xfce4-screensaver: for locking screen with xflock4'
            'xscreensaver: for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("${_pkgname}::git://git.xfce.org/xfce/xfce4-session"
        'xfce-polkit-gnome-authentication-agent-1.desktop')
sha256sums=('SKIP'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed -r "s/^${_pkgname}-//;s/-/+/g"
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --enable-systemd
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
