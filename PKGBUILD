# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-git
pkgver=4.19.0+1+gceefb03b
pkgrel=1
pkgdesc="Settings manager for xfce (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL2')
groups=('xfce4-git')
depends=('exo' 'libxfce4util' 'garcon' 'libxfce4ui' 'xfconf' 'libnotify' 'colord'
         'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra' 'python')
makedepends=('git' 'xfce4-dev-tools')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}"
        'enable-antialias-by-default.patch')
sha256sums=('SKIP'
            '25176aa463740d344c194d94771b7bfd9550809fd2ecd0e86acceb925afcf1ac')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"
  # Enable font hinting by default
  patch -uNp2 -r- -i ../enable-antialias-by-default.patch
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
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
  make DESTDIR="${pkgdir}" install
}
