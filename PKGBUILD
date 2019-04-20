# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Patched package maintainer: Saren Arterius <saren@wtako.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-performance
pkgver=3.32.1
pkgrel=1
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
_commit=9090b7dc3ddbc2ff6d0445d071a07eae525000b4 # tags/3.32.1^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
         https://github.com/endlessm/gnome-shell/commit/11ddabfb22aedb3c35abe06d2cf0205f223cca03.diff)
sha256sums=('SKIP'
            'SKIP'
            '53fb32bfe8432e6309d5b1bcf9c2b7f36693b9141778b823f1d7e9c1d3f39425')
pkgver() {
  cd $pkgname

  git describe --tags | sed "s/-/+/g"
}

prepare() {
  cd $pkgname

  # js/ui: Use captured-event::nonmotion [performance]
  # https://gitlab.gnome.org/GNOME/gnome-shell/merge_requests/276
  # Requires mutter MR283/commit "clutter-actor: Add detail to captured-event signal [performance]"
  # git cherry-pick -n 297a18f2

  # Hack to fix topicon-* extensions  making gnome-shell CPU usage > 50%
  patch -Np1 -i ../11ddabfb22aedb3c35abe06d2cf0205f223cca03.diff

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

