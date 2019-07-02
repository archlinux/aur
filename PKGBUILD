# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
pkgver=3.32.2+5+gae0567949
pkgrel=1
pkgdesc="Next generation desktop shell | Attempt to improve the performance by non-upstreamed patches"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter-781835-workaround nm-connection-editor unzip gstreamer libibus libcap-ng)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell gnome-shell=$pkgver)
conflicts=(gnome-shell)
install="$pkgname.install"
_commit=ae05679498ff78b88ede8f15bd646716366b2ff8 # tags/3.32.2^5
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
         https://gitlab.gnome.org/GNOME/gnome-shell/uploads/4a083c80c81eeb0dd1be64e0e24b5c17/nvidia-background-workaround.patch)
sha256sums=('SKIP'
            'SKIP'
            '505c90290e5a867692f55d3209a22755bcffb997e7cac59e49b1a78c976d5af9')
pkgver() {
  cd $pkgname

  git describe --tags | sed "s/-/+/g"
}

prepare() {
  cd $pkgname

  git remote add verde https://gitlab.gnome.org/verdre/gnome-shell.git || true
  git fetch verde

  # https://gitlab.gnome.org/GNOME/gnome-shell/issues/1084
  #patch -Np1 -i ../nvidia-background-workaround.patch

  # Fixes and performance improvements to the extension system
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/96
  git cherry-pick -n 39f10eaa^..6e704ee1

  # Refine the app menu a bit
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/406
  git cherry-pick -n ffaca005^..56a36165

  # iconGrid: Hide children outside allocation loop
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/566
  git cherry-pick -n 520cea93

  # appDisp allocation cycle fix
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/581
  git cherry-pick -n c1c45f95

  # iconGrid: Fix animation glitch
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/582
  git cherry-pick -n b4797956

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson $pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # https://bugs.archlinux.org/task/37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}

