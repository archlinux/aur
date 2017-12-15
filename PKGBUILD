# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-hide-legacy-decorations
_pkgname=mutter
pkgver=3.26.2+31+gbf91e2b4c
pkgrel=1
pkgdesc="A window manager for GNOME (with a little hack to hide the window decorations on maximized legacy applications)"
url="https://git.gnome.org/browse/mutter"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput)
makedepends=(intltool gobject-introspection git gnome-common)
replaces=('mutter-wayland' 'mutter')
conflicts=('mutter-wayland' 'mutter')
provides=("mutter=${pkgver}")
groups=(gnome)
options=(!emptydirs)

_commit=bf91e2b4ca1ef8b0478d1edec46bd33065457153  # gnome-3-26
source=("git://git.gnome.org/mutter#commit=$_commit"
        "startup-notification.patch"
        "hideTitlebar.patch")

sha256sums=('SKIP'
            '5a35ca4794fc361219658d9fae24a3ca21a365f2cb1901702961ac869c759366'
            'ec1a0f5f98213c340e907761e72fc3e22cb9c8ff503c6c234a4a41aac4ec7ac4')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # https://bugs.archlinux.org/task/51940
  patch -Np1 -i ../startup-notification.patch
  patch -p1 -i $srcdir/hideTitlebar.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgname"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$pkgname --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum \
      --enable-gtk-doc --enable-egl-device --disable-remote-desktop

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
