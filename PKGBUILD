# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-session
pkgname=${_pkgname}-devel
pkgver=4.19.3
pkgrel=1
pkgdesc="A session manager for Xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-session/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'libwnck3' 'xfconf' 'libsm' 'polkit' 'xorg-iceauth'
         'xorg-xinit' 'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme'
         'libxfce4windowing>=4.19.2' 'gtk-layer-shell')
makedepends=('glib2-devel')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xfce4-screensaver: for locking screen with xflock4'
            'xscreensaver: for locking screen with xflock4'
            'light-locker: for locking screen with xflock4'
            'labwc: default wayland compositor for the experimental wayland session')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        'xfce-polkit-gnome-authentication-agent-1.desktop')
sha256sums=('06d267e6b633aacd7ef0e1b5865ac5b42a7713267317c0d1cadf66f0bfdce3a9'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --enable-systemd
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Provide a default PolicyKit Authentication Agent (FS#42569)
  install -d "${pkgdir}"/etc/xdg/autostart
  cp "${srcdir}"/xfce-polkit-gnome-authentication-agent-1.desktop \
    "${pkgdir}"/etc/xdg/autostart/

}

