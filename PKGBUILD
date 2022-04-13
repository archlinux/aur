# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-git
pkgver=4.16.0+368+ge83a447d
pkgrel=1
pkgdesc="Settings manager for xfce (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4-git')
depends=('exo' 'garcon' 'libxfce4ui>=4.17.0' 'libxfce4util>=4.17.2' 'xfconf'
         'libnotify' 'colord' 'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}"
        "https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/${_pkgname}/trunk/default-xsettings-xml.patch")
sha256sums=('SKIP'
            '8e9a6c70ab0ceb5d91b637dc290768f8a47edb5d7b6e2eebc4459dbc4ee040d7')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"

  # Enable Adwaita theme and font hinting by default
  patch -Np1 -i "$srcdir/default-xsettings-xml.patch"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-xrandr \
    --enable-xcursor \
    --enable-libnotify \
    --enable-libxklavier \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-upower-glib \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
