# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-session
pkgname=${_pkgname}-devel
pkgver=4.17.2
pkgrel=1
pkgdesc="A session manager for Xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libsm' 'polkit' 'xorg-iceauth' 'xorg-xinit'
         'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('gnome-keyring:     for keyring support when GNOME compatibility is enable'
            'xfce4-screensaver: for locking screen with xflock4'
            'xscreensaver:      for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        'xfce-polkit-gnome-authentication-agent-1.desktop')
sha256sums=('7113189d98de06cf4edaa9f15ba92e0d76ae304560006ffe1ee8ba57295b9536'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
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
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Provide a default PolicyKit Authentication Agent (FS#42569)
  install -d "$pkgdir/etc/xdg/autostart"
  cp "$srcdir/xfce-polkit-gnome-authentication-agent-1.desktop" \
    "$pkgdir/etc/xdg/autostart/"

}

