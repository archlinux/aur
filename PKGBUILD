# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Paul Clark <paul500clark at gmail dot com>
# Contributor: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr@gmail.com>

_pkgname=xfce4-session
pkgname=${_pkgname}-git
pkgver=4.21.0+148+g2208cf98
pkgrel=1
pkgdesc="Xfce session manager (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-session/start"
license=('GPL-2.0-or-later')
depends=('libxfce4ui>=4.21.0' 'libxfce4windowing' 'xfconf' 'libsm' 'polkit' 'xorg-iceauth'
         'xorg-xinit' 'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme' 'gtk-layer-shell')
makedepends=('git' 'xfce4-dev-tools' 'glib2-devel' 'meson')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xfce4-screensaver: for locking screen with xflock4'
            'xscreensaver: for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
groups=('xfce4-git')
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}"
        'xfce-polkit-gnome-authentication-agent-1.desktop')
sha256sums=('SKIP'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
    -D gtk-layer-shell=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Provide a default PolicyKit Authentication Agent (FS#42569)
  install -d "${pkgdir}"/etc/xdg/autostart
  cp "${srcdir}"/xfce-polkit-gnome-authentication-agent-1.desktop \
    "${pkgdir}"/etc/xdg/autostart/
}
