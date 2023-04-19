# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Paul Clark <paul500clark at gmail dot com>
# Contributor: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr@gmail.com>

_pkgname=xfce4-session
pkgname=${_pkgname}-git
pkgver=4.19.0+4+g9ea6f589
pkgrel=1
pkgdesc="Xfce session manager (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-session/start"
license=('GPL2')
depends=('libxfce4ui' 'libwnck3' 'xfconf' 'libsm' 'polkit' 'xorg-iceauth'
         'xorg-xinit' 'xorg-xrdb' 'polkit-gnome' 'hicolor-icon-theme')
makedepends=('git' 'xfce4-dev-tools')
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
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --enable-systemd
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install

  # Provide a default PolicyKit Authentication Agent (FS#42569)
  install -d "${pkgdir}"/etc/xdg/autostart
  cp "${srcdir}"/xfce-polkit-gnome-authentication-agent-1.desktop \
    "${pkgdir}"/etc/xdg/autostart/
}
