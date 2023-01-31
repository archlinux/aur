# Maintainer: L. Heizinger <misc at heleon dot de>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-git-xsccomp
pkgver=4.18.0+9+g818cabd5
pkgrel=1
pkgdesc="Power manager for Xfce desktop – patched for use with xscreensaver."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'hicolor-icon-theme')
optdepends=('xfce4-panel: for the Xfce panel plugin')
makedepends=('intltool' 'xfce4-panel' 'git' 'xfce4-dev-tools')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}" "xsccomp.patch")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 -i $srcdir/xsccomp.patch
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
