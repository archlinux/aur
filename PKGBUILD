# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-session
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="A session manager for Xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-session/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('libxfce4ui>=4.21.0' 'xfconf' 'libsm' 'polkit' 'xorg-iceauth'
         'xorg-xinit' 'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme'
         'libxfce4windowing' 'gtk-layer-shell')
makedepends=('meson' 'xfce4-dev-tools' 'glib2-devel')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xfce4-screensaver: for locking screen with xflock4'
            'xscreensaver: for locking screen with xflock4'
            'light-locker: for locking screen with xflock4'
            'labwc: default wayland compositor for the experimental wayland session')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"
        'xfce-polkit-gnome-authentication-agent-1.desktop')
sha256sums=('eb414e86675b071180a505bb0f76e278576faf88d7a266e0e3fff9d44e0698f7'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')
build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Provide a default PolicyKit Authentication Agent (FS#42569)
  install -d "${pkgdir}"/etc/xdg/autostart
  cp "${srcdir}"/xfce-polkit-gnome-authentication-agent-1.desktop \
    "${pkgdir}"/etc/xdg/autostart/
}

