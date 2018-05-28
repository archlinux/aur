# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-tweener-fix
pkgver=3.28.2
pkgrel=2
pkgdesc="The next generation GNOME Shell (patched to fix bug #1 )"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL2)
real_pkgname=gnome-shell
provides=(${real_pkgname}=${pkgver})

depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter nm-connection-editor unzip gstreamer libibus)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
_commit=c70b18764b2658849b170c897ce4c423a118d7f2  # tags/3.28.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://git.gnome.org/browse/libgnome-volume-control"
        "pull-request-4.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
conflicts=(${real_pkgname})
provides=(${real_pkgname})

pkgver() {
  cd $real_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $real_pkgname

  # Move the plugin to our custom epiphany-only dir
  sed -i "s/'mozilla'/'epiphany'/g" meson.build
  # patch -Np1 -i ../tweener-fix.patch
  patch -Np1 -i ../pull-request-4.patch
  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson $real_pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Must exist; FS#37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}
