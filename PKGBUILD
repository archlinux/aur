# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-hide-legacy-decorations
_pkgname=mutter
pkgver=3.30.2
pkgrel=2
pkgdesc="A window manager for GNOME (with a little hack to hide the window decorations on maximized legacy applications)"
url="https://git.gnome.org/browse/mutter"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire)
makedepends=(intltool gobject-introspection git egl-wayland)
replaces=('mutter-wayland' 'mutter')
conflicts=('mutter-wayland' 'mutter')
provides=("mutter=${pkgver}")
groups=(gnome)
options=(!emptydirs)
_commit=bcd6103c44ff74ebffd1737b8e0f3a952b83bd54  # tags/3.30.2^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        https://gitlab.gnome.org/vanvugt/mutter/commit/fc02b040f3b750b0513f812813351c09795950f6.patch
        "startup-notification.patch"
        "hideTitlebar.patch")

sha256sums=('SKIP'
            'dffa2ca19281b9fa5a81bf80bd46a8eae78325c7e1f8b2a25c33945aa7cc0903'
            '00d5e77c94e83e1987cc443ed7c47303aa33367ce912b2f665bcd34f88890a17'
            'ec1a0f5f98213c340e907761e72fc3e22cb9c8ff503c6c234a4a41aac4ec7ac4')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/216
  git apply -3 ../fc02b040f3b750b0513f812813351c09795950f6.patch

  # https://bugs.archlinux.org/task/51940
  # As of 2018-05-08: Still needed, according to fmuellner
  patch -Np1 -i ../startup-notification.patch

  patch -p1 -i $srcdir/hideTitlebar.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum \
      --enable-gtk-doc --enable-egl-device --enable-remote-desktop

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
