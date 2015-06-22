# Contributor: Hinrich Harms <arch@hinrich.de>
# Contributor: Flamelab <panosfilip@gmail.com>
# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=mutter
pkgname=$_pkgname-wine-fullscreen
pkgver=3.12.2
pkgrel=1
pkgdesc="Window and compositing manager based on Clutter. Wine fullscreen fixed (Hearthstone)."
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
depends=("gtk3" "cogl" "clutter" 'dconf' 'gobject-introspection' 
         'gsettings-desktop-schemas' 'libcanberra' 'startup-notification' 
         'zenity' 'libsm' "upower" "wayland")
makedepends=('git' 'intltool' 'gnome-doc-utils' 'gtk-doc')
provides=("mutter="$pkgver "mutter-wayland="$pkgver)
conflicts=('mutter' 'mutter-wayland')
groups=('gnome')
options=('!libtool' '!emptydirs')
install=$_pkgname.install
source=("git://git.gnome.org/mutter#tag=$pkgver"
        "0001-Revert-display-Don-t-focus-the-no-focus-window-when-.patch")
sha256sums=('SKIP'
            '2afaa0f384674119b46f0538764323c8becff9cd5c7bc1f732af9e063418f0b1')

prepare() {
  cd $_pkgname
  git am ../0001-Revert-display-Don-t-focus-the-no-focus-window-when-.patch
}

build() {
  cd $_pkgname
  ./autogen.sh \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libexecdir=/usr/lib/mutter \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile \
      --enable-compile-warnings=minimum \
      --enable-gtk-doc
  make
}

package()  {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}
