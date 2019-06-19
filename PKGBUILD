# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
pkgver=3.32.2+2+g95e353fdb
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
_commit=95e353fdb4067c54b677efcc7f204525f9c7a66d # tags/3.32.2^2
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
         https://github.com/endlessm/gnome-shell/commit/11ddabfb22aedb3c35abe06d2cf0205f223cca03.diff
         https://gitlab.gnome.org/GNOME/gnome-shell/uploads/4a083c80c81eeb0dd1be64e0e24b5c17/nvidia-background-workaround.patch)
sha256sums=('SKIP'
            'SKIP'
            '53fb32bfe8432e6309d5b1bcf9c2b7f36693b9141778b823f1d7e9c1d3f39425'
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

  # Mild performance improvements on style changes
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/524
  # git cherry-pick -n fb04dafb^..94995e9c

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

