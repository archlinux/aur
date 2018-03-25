# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Patch origin: https://gist.github.com/DeadMetaler/12622bf9415c1100f2d436ffbd6778c6

pkgname=mutter-781835-workaround
_pkgname=mutter
pkgver=3.28.0
pkgrel=1
pkgdesc="A window manager for GNOME. This package reverts a commit which may causes performance problems for nvidia driver users."
url="https://git.gnome.org/browse/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire 'gnome-shell>=3.28' 'gnome-shell<3.29')
makedepends=(intltool gobject-introspection git)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
_commit=47856d97011d7a9bd13c1e1c638a6e43ebd9d9ac  # tags/3.28.0^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        startup-notification.patch
        revert.patch)
sha256sums=('SKIP'
            '5a35ca4794fc361219658d9fae24a3ca21a365f2cb1901702961ac869c759366'
            '2d2e305e0a6cca087bb8164f81bdc0ae7a5ca8e9c13c81d7fd5252eb3563fc09')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Revert offending commit
  patch -Np1 -i ../revert.patch

  # https://bugs.archlinux.org/task/51940
  patch -Np1 -i ../startup-notification.patch

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
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}