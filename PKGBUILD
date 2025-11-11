# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

_pkgname=lxpanel
pkgname=lxpanel-gtk2
pkgver=0.11.1
pkgrel=2
pkgdesc='Lightweight X11 desktop panel for LXDE'
arch=('x86_64')
license=('GPL2')
url='https://lxde.org/'
groups=('lxde')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('alsa-lib' 'curl' 'menu-cache' 'lxmenu-data' 'libwnck' 'libfm-gtk2' 'libkeybinder2')
makedepends=('git' 'intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
source=(git+https://github.com/lxde/lxpanel.git#tag=${pkgver})
sha256sums=('262d261e14a13e6df1bb1a0406afee1e69f6da0891269a3e0a865507d04d5a95')

prepare() {
  cd $_pkgname
  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure \
    --sysconfdir=/etc \
    --prefix=/usr

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
