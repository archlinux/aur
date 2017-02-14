# Maintainer: revel <revelΘmuub·net>

pkgname=gopenvpn-git
pkgver=svn.migration.r12.gb4192eb
pkgrel=6
pkgdesc='gopenvpn is a simple graphical front-end for OpenVPN, the open source VPN solution.'
arch=('i686' 'x86_64')
url='http://gopenvpn.sourceforge.net/'
license=('GPL')
depends=('libglade' 'libgnome-keyring' 'gtk2' 'openvpn')
optdepends=('gnome-keyring: handle credentials')
makedepends=('git' 'polkit')
source=("$pkgname"::'git://gopenvpn.git.sourceforge.net/gitroot/gopenvpn/gopenvpn.git'
        'config.patch')
sha256sums=('SKIP'
            '51ec862cbd94c156e247331b357d08da805aaf458e9935dad9198c8a45a31ebc')

pkgver() {
  cd "$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i "/ACLOCAL_AMFLAGS = -I m4/d" Makefile.am
  sed -i "s/AM_GNU_GETTEXT_VERSION(\[0\.18\.1\])/AM_GNU_GETTEXT_VERSION([0.19])/g" configure.ac
  sed -i "s/\/usr\/sbin\/openvpn/\/usr\/bin\/openvpn/g" polkit/net.openvpn.gui.gopenvpn.policy
  patch -p1 -i ../config.patch
}

build() {
  cd "$pkgname"
  autoreconf -vi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
