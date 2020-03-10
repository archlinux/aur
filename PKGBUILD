pkgname=totem-git
_pkgname=totem
pkgver=3.34.0+105+g020c9dfd6
pkgrel=1
pkgdesc="Movie player for the GNOME desktop based on GStreamer"
url="https://wiki.gnome.org/Apps/Videos"
arch=(x86_64)
license=(GPL2 custom)
depends=('totem-plparser' 'iso-codes' 'libpeas' 'clutter-gtk' 'clutter-gst' 'grilo' 'gsettings-desktop-schemas'
         'dconf' 'python-gobject' 'python-xdg' 'gnome-desktop' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad')
makedepends=('libnautilus-extension' 'itstool' 'docbook-xsl' 'python-pylint'
             'gobject-introspection' 'git' 'appstream-glib' 'gtk-doc' 'meson' 'intltool')
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'grilo-plugins: Media discovery'
            'python-dbus: MPRIS plugin')
provides=('totem')
conflicts=('totem' 'totem-plugin')
replaces=('totem' 'totem-plugin')
source=("git+https://gitlab.gnome.org/GNOME/totem.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.subprojects/libgd.url "$srcdir/libgd"
  git submodule update
}

build() {
  arch-meson $_pkgname build -D enable-gtk-doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/licenses/$_pkgname" -m644 $_pkgname/COPYING
}
