# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-338
pkgver=3.38.6
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell (3.38 version)"
url="https://wiki.gnome.org/Projects/GnomeShell"
conflicts=("gnome-shell")
provides=("gnome-shell=$pkgver")
replaces=("gnome-shell")
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session
         gnome-settings-daemon-338 gnome-themes-extra gsettings-desktop-schemas-338 gnome-control-center-338
         libcanberra-pulse libgdm libsecret mutter-338 nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire)
makedepends=(gtk-doc gnome-control-center-338 evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('evolution-data-server: Evolution calendar integration')
groups=(gnome-338)
install=gnome-shell.install
_commit=beb24d6b101708e978eda748187e351e35e3ce66  # tag/3.38.6
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
  # Check might fail without clean build env. Continue building in any case.
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
  meson test -C build --print-errorlogs || true
)

package() {
  depends+=(libmutter-7.so)
  DESTDIR="$pkgdir" meson install -C build
}
