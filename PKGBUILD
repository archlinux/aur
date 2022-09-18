# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=totem-git
pkgver=43.0+r3+g040ca6f91
pkgrel=1
pkgdesc="Movie player for the GNOME desktop based on GStreamer"
url="https://wiki.gnome.org/Apps/Videos"
arch=(x86_64)
license=(GPL2 custom)
depends=(totem-plparser iso-codes libpeas grilo gsettings-desktop-schemas
         python-gobject gnome-desktop gst-plugins-base gst-plugins-good
         gst-plugins-bad gst-plugin-gtk libhandy)
makedepends=(libnautilus-extension itstool docbook-xsl python-pylint
             gobject-introspection git appstream-glib gtk-doc meson intltool)
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'grilo-plugins: Media discovery')
conflicts=(totem totem-plugin)
replaces=(totem-plugin)
provides=(totem)
groups=(gnome)
options=(debug)
source=("git+https://gitlab.gnome.org/GNOME/totem.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd totem
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd totem

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git submodule update
}

build() {
  arch-meson totem build -D enable-gtk-doc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 totem/COPYING
}
