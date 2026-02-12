# Maintainer: Johannes Arnold <johannes@rnold.online>
# Maintainer: Samuel Young <samueldy@umich.edu>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>


pkgname=xfwm4-rounded-corners
pkgver=4.20.0
pkgrel=1
pkgdesc="xfwm4 with patch that allows drawing windows with rounded corners."
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfwm4/start"
license=('GPL-2.0-or-later')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('git' 'xfce4-dev-tools')
provides=("xfwm4")
conflicts=("xfwm4")
source=("git+https://gitlab.xfce.org/xfce/xfwm4.git#tag=xfwm4-$pkgver" "rounded-corners-4.20.patch")
sha256sums=('68691593f06659f1ba1a0363be161b2cd50a84016612394c909bce1485a75cff'
            '1f57987fd3f5b455ec43cb914ff21548cac030c8140f85ec14043af253288bb7')

prepare() {
  # Apply patch first.
  cd "$srcdir/xfwm4"
  git apply "$srcdir/rounded-corners-4.20.patch"
  
  # Then do normal autogen procedure.
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/xfwm4"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug \
    --enable-maintainer-mode
  make
}

package() {
  cd "$srcdir/xfwm4"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
