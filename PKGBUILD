# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Patch origin: https://gist.github.com/DeadMetaler/12622bf9415c1100f2d436ffbd6778c6

pkgname=mutter-781835-workaround
_pkgname=mutter
pkgver=3.28.3+8+gd0d807801
pkgrel=1
pkgdesc="A window manager for GNOME. This package reverts a commit which may causes performance problems for nvidia driver users. Some performance patches also included."
url="https://git.gnome.org/browse/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire gnome-shell) # or gnome-shell-performance=3.28.3+7+g721ce5403
makedepends=(intltool gobject-introspection git)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
_commit=d0d8078013749bb84dc611dfdf6b317512c8559e  # gnome-3-28
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

  ## Unmerged performance bits, enable with own risk and merge conflicts yourself
  # Multiline comment start, remove the line (and comment end line) below to enable the patches
  # : '
  ## https://gitlab.gnome.org/GNOME/mutter/merge_requests/70/commits
  git remote add vanvugt https://gitlab.gnome.org/vanvugt/mutter.git || true
  git fetch vanvugt
  git cherry-pick 13870745 || bash
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/98/commits
  git remote add carlosg https://gitlab.gnome.org/carlosg/mutter.git || true
  git fetch carlosg
  git cherry-pick ec813877 || bash
  git cherry-pick 94f40098 || bash
  git cherry-pick 161d2540 || bash
  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/145/commits
  # This causes stutter on Intel iGPU (i7 8550u). Works fine for nv GPU from my experience
  # git cherry-pick a4b62506 || bash
  # git cherry-pick 2088061a || bash
  # '
  # Multiline comment end, remove the line above if enabling the patches

  # Revert offending commit
  patch -Np1 -i ../revert.patch

  # Port to pipewire 0.2
  git cherry-pick -n 0407a8b33d8c3503fba63ad260984bb08bd6e0dc
  sed -i 's/pipewire-0.1/pipewire-0.2/g' configure.ac

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
