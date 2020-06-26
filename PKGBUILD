# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.14.4
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with fixes for Compiz"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils' 'libwnck3')
makedepends=('intltool' 'gtk-doc' 'xfce4-dev-tools')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
source=("https://archive.xfce.org/src/xfce/$_realname/${pkgver%.*}/$_realname-$pkgver.tar.bz2"
	  fix-scrolling2.patch
	  fix-scrolling3.patch
	  pager-dimensions.patch
	  wrap-workspaces.patch)
sha256sums=('8e5ea79412ba84cfada897ff309cbe2cd4aca16b9bd4f93df060229528576fd5'
		'2bbcace9c0c25c14fc1180a1064329240867a0b83c1c668aadc8c77f92ee0aab'
		'5e17300981a6030a2a3d4172b897e7aea0037401c8c9866cc03d82e0629c7fe2'
		'7055df37c000731057af828ef99ffb7193a18b3f2ab7dee541d79de029995cae'
		'063f11ddbf695d0f7b819209245e201c8d7420cbf94a6c557593deb2aa061f82')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://bugzilla.xfce.org/show_bug.cgi?id=3361#c28
  echo "Applying fix-scrolling2.patch:"
  patch -p1 -i "$srcdir/fix-scrolling2.patch"
  
  # See https://bugzilla.xfce.org/show_bug.cgi?id=3361#c32
  echo "Applying fix-scrolling3.patch:"
  patch -p1 -i "$srcdir/fix-scrolling3.patch"
  
  # See https://bugzilla.xfce.org/show_bug.cgi?id=3361#c30
  echo "Applying wrap-workspaces.patch:"
  patch -p1 -i "$srcdir/wrap-workspaces.patch"
  
  # See https://bugzilla.xfce.org/show_bug.cgi?id=11697
  echo "Applying pager-dimensions.patch:"
  patch -p1 -i "$srcdir/pager-dimensions.patch"
}

build() {
  cd "$srcdir/$_realname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
