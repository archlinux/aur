# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Patch origin: https://gist.github.com/DeadMetaler/12622bf9415c1100f2d436ffbd6778c6

pkgname=mutter-781835-workaround
_pkgname=mutter
pkgver=3.30.0+13+g2fb3db765
pkgrel=3
pkgdesc="A window manager for GNOME. This package reverts a commit which may causes performance problems for nvidia driver users. Some performance patches also included."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire gnome-shell) # or gnome-shell-performance=3.28.3+7+g721ce5403
makedepends=(intltool gobject-introspection git egl-wayland)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
_commit=2fb3db7659caa3627a473fefabc4d6a87f688cee  # master
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        startup-notification.patch
        revert.patch)
sha256sums=('SKIP'
            '5a35ca4794fc361219658d9fae24a3ca21a365f2cb1901702961ac869c759366'
            '2d2e305e0a6cca087bb8164f81bdc0ae7a5ca8e9c13c81d7fd5252eb3563fc09')

# pkgver() {
#   cd $_pkgname
#   # git describe --tags | sed 's/-/+/g'
# }

prepare() {
  cd $_pkgname

  ## Unmerged performance bits
  # Commented multiline comment start, remove the # below to disable the patches
  # : '

  git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  git fetch vanvugt

  # clutter: Deliver events sooner when possible
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/168/commits
  git cherry-pick 0feecfe8

  # clutter: Fix offscreen-effect painting of clones
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/117/commits
  git cherry-pick 3552fd1e

  # Geometric (GPU-less) picking
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/189
  git cherry-pick 23435a40
  git cherry-pick 095d3a7b

  # Sync to the hardware refresh rate, not just 60.00Hz [performance]
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/171/commits
  git cherry-pick ac031043
  git cherry-pick 177ec12e

  # '
  # Commented multiline comment end, remove the # above if disabling the patches

  # Revert offending commit
  patch -Np1 -i ../revert.patch

  # https://bugs.archlinux.org/task/51940
  # As of 2018-05-08: Still needed, according to fmuellner
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
