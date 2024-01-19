# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

# Based on PKGBUILD for package: extra/xfwm4 (4.18.0-1)
pkgname=xfwm4-windowcenter
pkgver=4.18.0
pkgrel=1
pkgdesc="Xfce's window manager, with a patch to allow titles to be centered relatively to the full window title."
arch=('x86_64')
url="https://gitlab.xfce.org/xfce/xfwm4/-/merge_requests/27"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
provides=("xfwm4=$pkgver")
conflicts=("xfwm4")
source=(
	"$pkgname::git+https://gitlab.xfce.org/xfce/xfwm4#tag=xfwm4-$pkgver"
	pr27{,-locale-pl}.patch
)
sha256sums=(SKIP{,,})

prepare(){
  cd $pkgname
  # Original patch by Ryan Bester (see $url for the reference)
  # Backported for 4.18.0 and localized to Polish by SpacingBat3
  git apply ../pr27{,-locale-pl}.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-maintainer-mode \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
