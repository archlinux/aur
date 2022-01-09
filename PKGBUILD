# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Tim Jester-Pfadt <t.jp<at>gmx.de>

_pkgname=gnome-builder
pkgname=gnome-builder-git
pkgver=42.alpha1+10+gc550764ec
pkgrel=1
pkgdesc='An IDE for writing GNOME-based software'
arch=(i686 x86_64)
url='https://wiki.gnome.org/Apps/Builder'
license=(GPL3)
conflicts=(gnome-builder)
provides=(gnome-builder)
depends=(gtksourceview4 devhelp libgit2-glib gjs python-gobject clang desktop-file-utils libhandy-git
         ctags libpeas vte3 vala python-jedi autoconf-archive sysprof flatpak gspell libdazzle
         template-glib jsonrpc-glib python-sphinx webkit2gtk glade sysprof libportal cmark)
makedepends=(intltool llvm gobject-introspection gtk-doc yelp-tools appstream-glib vala git
             mm-common meson)
optdepends=('gnome-code-assistance: Legacy assistance services'
            'python-lxml: documentation support for Python auto-completion')
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/gnome-builder.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^GNOME_BUILDER_//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build \
    --buildtype debugoptimized \
    -D docs=true \
    -D help=true \
    -D plugin_editorconfig=true
  ninja -C build
}

check() {
  # some tests need an installed gnome-builder
  xvfb-run meson test -C build || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
# vim:set ts=2 sw=2 et:

