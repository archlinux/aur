# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
_pkgname=gnome-shell
pkgver=3.30.2+4
pkgrel=4
pkgdesc="Next generation desktop shell | Attempt to improve the performance by non-upstreamed patches"
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
provides=(gnome-shell gnome-shell=$pkgver)
conflicts=(gnome-shell)
_commit=2a36bf52cb61ac1a015bc2150807a8d47c7155e4 # tags/3.30.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd $_pkgname

  # st-box-layout: Avoid fullscreen relayout on scroll
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/224
  git remote add vanvugt https://gitlab.gnome.org/vanvugt/gnome-shell.git || true
  git fetch vanvugt
  git cherry-pick 6a3dd0fa
  git cherry-pick 5aac3f0a

  # js/ui: Use captured-event::instantaneous [performance]
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/276
  # Requires mutter MR283/commit "clutter-actor: Add detail to captured-event signal [performance]"
  if pacman -Q | grep mutter-781835-workaround; then
    git cherry-pick d12c86cf || bash
    echo "======= mutter-781835-workaround detected, MR276 is applied ======="
    sleep 3
  else
    echo "======= mutter-781835-workaround not installed, not applying MR276 ======="
    sleep 3
  fi

  # messageTray: Re-enable unredirection when banner is destroyed 
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/304
  # Fix performance regression with fullscreen apps, merged in master but not in 3.30
  git cherry-pick e5ce3d54

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
  DESTDIR="$pkgdir" meson install -C build

  # https://bugs.archlinux.org/task/37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}

