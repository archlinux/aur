# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-screensaver
pkgname=${_pkgname}-git
pkgver=0.1.7+30+g6be6dfe
pkgrel=1
pkgdesc='Screensaver for XFCE Desktop (git checkout)'
url="https://www.xfce.org"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('GPL')
depends=('libxss' 'libxklavier' 'garcon' 'libwnck3' 'python-gobject' 'xfconf' 'dbus-glib')
makedepends=('intltool' 'systemd' 'xfce4-dev-tools' 'xmlto' 'docbook-xsl' 'exo')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
groups=('xfce4-git')
source=("git://git.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/-/+/g"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir="/usr/lib/${_pkgname}" \
    --enable-docbook-docs \
    --disable-dependency-tracking
  sed -i -e '/\$CC/s/-shared/\0 -Wl,--as-needed/' libtool
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
