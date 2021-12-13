# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-oldstable
pkgver=40.7
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell (oldstable version)"
url="https://wiki.gnome.org/Projects/GnomeShell"
conflicts=("gnome-shell")
provides=("gnome-shell=$pkgver")
replaces=("gnome-shell")
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gtk4
         gnome-settings-daemon-oldstable gnome-themes-extra gsettings-desktop-schemas-oldstable
         libcanberra-pulse libgdm libsecret mutter-oldstable nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire)
makedepends=(gtk-doc gnome-control-center-oldstable evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome-oldstable)
_commit=d2e906d846d87fc6f6aa2f87a70082098ce7730b  # tags/40.7^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-shell
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gnome-shell

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson gnome-shell build -D gtk_doc=true
  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
  meson test -C build --print-errorlogs
)

package() {
  depends+=(libmutter-8.so)
  meson install -C build --destdir "$pkgdir"
}
