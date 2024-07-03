# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-git
pkgver=4.19.3+15+g7206eda2
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-power-manager/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'xfce4-notifyd' 'hicolor-icon-theme' 'networkmanager')
makedepends=('xfce4-panel' 'wayland-protocols' 'wayland' 'git' 'xfce4-dev-tools' 'glib2-devel')
optdepends=('xfce4-panel: Xfce panel plugin support')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git submodule update
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
