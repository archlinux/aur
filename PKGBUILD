# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
_pkgname=gnome-shell
pkgver=3.28.3+7+g721ce5403
pkgrel=1
pkgdesc="The next generation GNOME Shell | Attempt to improve the performance by non-upstreamed patches"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter nm-connection-editor unzip gstreamer libibus)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell)
conflicts=(gnome-shell)
_commit=721ce54037cc07a82927cfdfb7928dadad7d7791 # gnome-3-28
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        fix.diff)
sha256sums=('SKIP'
            'SKIP'
            '11dcffae170776140b1f0c9bed90b8df70e8d3c6694b60ab40bb46235e3ad755')

prepare() {
  cd $_pkgname

  # js/ui: Choose some actors to cache on the GPU
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/73/commits
  git remote add vanvugt https://gitlab.gnome.org/vanvugt/gnome-shell.git || true
  git fetch vanvugt
  git cherry-pick f77b3da7 || bash

  # Javascript invalid access fixes
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/4/commits
  git remote add vanvugt https://gitlab.gnome.org/vanvugt/gnome-shell.git || true
  git fetch vanvugt
  git cherry-pick 78da92c1 || bash
  git cherry-pick df5ca834 || bash
  git cherry-pick a667357e || bash
  git cherry-pick 163e9b43 || bash
  git cherry-pick 1f820518 || bash


  # Try to fix docs build
  patch -Np1 -i ../fix.diff

  # Move the plugin to our custom epiphany-only dir
  sed -i "s/'mozilla'/'epiphany'/g" meson.build

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}
  
build() {
  arch-meson $_pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Must exist; FS#37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}

